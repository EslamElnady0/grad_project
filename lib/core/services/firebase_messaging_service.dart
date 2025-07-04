import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/chat/data/models/chat_groups_response.dart';
import 'package:grad_project/features/chat/ui/views/chat_view.dart';
import 'package:grad_project/features/home/ui/views/home_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('Handling a background message: ${message.messageId}');
  log('Message data: ${message.data}');
  log('Message notification: ${message.notification?.title}');
}

class FirebaseMessagingService {
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;
  FirebaseMessagingService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String? _fcmToken;
  StreamSubscription<String?>? _tokenSubscription;

  /// Expose current FCM token
  String? get fcmToken => _fcmToken;

  /// Initialize FCM and local notifications
  Future<void> initialize() async {
    try {
      // Request notification permissions
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        log('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        log('User granted provisional permission');
      } else {
        log('User declined or has not accepted permission');
      }

      // Initialize local notifications (creates channels, etc.)
      await _initializeLocalNotifications();

      // Obtain FCM token
      await _getFCMToken();

      // Listen for token refresh
      _tokenSubscription =
          _firebaseMessaging.onTokenRefresh.listen(_onTokenRefresh);

      // Register background handler (must be before runApp in main.dart)
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle taps on terminated/background notifications
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // Check if app was launched by a notification tap
      RemoteMessage? initialMessage =
          await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        _handleMessageOpenedApp(initialMessage);
      }
    } catch (e) {
      log('Error initializing Firebase Messaging: $e');
    }
  }

  /// Obtain and store the FCM token
  Future<String?> _getFCMToken() async {
    try {
      _fcmToken = await _firebaseMessaging.getToken();
      log('FCM Token: $_fcmToken');
      return _fcmToken;
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }

  /// Create notification channel and initialize plugin
  Future<void> _initializeLocalNotifications() async {
    // Android channel definition
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // name
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    // Initialize plugin settings
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // Create the channel on Android
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Initialize the plugin
    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  /// Handle incoming foreground messages
  void _handleForegroundMessage(RemoteMessage message) {
    log('Received foreground message: ${message.data}');
    if (message.notification != null) {
      _showLocalNotification(message);
    }
  }

  /// Show a local notification for a RFP message
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformDetails,
      payload: message.data.toString(),
    );
  }

  /// Handle notification taps (foreground & background)
  void _onNotificationTapped(NotificationResponse response) {
    log('Notification tapped: [32m${response.payload}[0m');
    // Parse payload (assume it's a JSON string or Map<String, dynamic>)
    final data = parsePayload(response.payload);
    log(data.toString());
    if (data != null && data['type'] == 'chat') {
      _navigateToChatFromNotification(data);
    }
  }

  /// Handle app opened via notification tap
  void _handleMessageOpenedApp(RemoteMessage message) {
    log('App opened from notification: [32m${message.data}[0m');
    final data = message.data;

    if (data['type'] == 'chat') {
      _navigateToChatFromNotification(data);
    }
  }

  void _navigateToChatFromNotification(Map<String, dynamic> data) {
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      log('No context available for navigation');
      return;
    }

    log('Navigating to HomeView to wait for socket connection...');

    // Navigate to HomeView (resets the stack)

    // Delay to allow socket connection setup in HomeView
    try {
      GoRouter.of(context).go(HomeView.routeName);
      Future.delayed(const Duration(milliseconds: 100), () {
        final chatGroup = DepartmentChatGroup(
          id: data['chatId'] as String,
          name: data['chatName'] as String,
          imageurl: data['imageUrl'] as String?,
        );

        log('Navigating to ChatView with: $chatGroup');

        GoRouter.of(context).push(ChatView.routeName, extra: chatGroup);
      });
    } catch (e) {
      log('Error navigating to ChatView: $e');
    }
  }

  Map<String, dynamic>? parsePayload(String? input) {
    if (input == null || input.isEmpty) return null;

    try {
      final cleaned =
          input.trim().replaceAll(RegExp(r'^\{|\}$'), ''); // remove { and }
      final pairs = cleaned.split(',').map((pair) => pair.trim());

      final Map<String, dynamic> result = {};

      for (var pair in pairs) {
        final keyValue = pair.split(':');
        if (keyValue.length >= 2) {
          final key = keyValue[0].trim();
          final value =
              keyValue.sublist(1).join(':').trim(); // handles values with ':'
          result[key] = value;
        }
      }

      return result;
    } catch (e) {
      log('Failed to parse payload: $e');
      return null;
    }
  }

  /// Handle token refresh events
  void _onTokenRefresh(String? token) {
    if (token != null) {
      _fcmToken = token;
      log('FCM Token refreshed: $token');
      // TODO: Send refreshed token to your backend
    }
  }

  /// Subscribe to a topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
      log('Subscribed to topic: $topic');
    } catch (e) {
      log('Error subscribing to topic: $e');
    }
  }

  /// Unsubscribe from a topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      log('Unsubscribed from topic: $topic');
    } catch (e) {
      log('Error unsubscribing from topic: $e');
    }
  }

  /// Clean up resources
  void dispose() {
    _tokenSubscription?.cancel();
  }
}
