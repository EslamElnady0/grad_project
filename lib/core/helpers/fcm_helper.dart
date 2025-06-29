import '../services/firebase_messaging_service.dart';

class FCMHelper {
  static final FirebaseMessagingService _fcmService =
      FirebaseMessagingService();

  /// Initialize FCM service
  static Future<void> initialize() async {
    await _fcmService.initialize();
  }

  /// Get device token
  static Future<String?> getDeviceToken() async {
    return await _fcmService.firebaseMessaging.getToken();
  }

  /// Get current device token (if already initialized)
  static String? get currentToken => _fcmService.fcmToken;

  /// Subscribe to a topic
  static Future<void> subscribeToTopic(String topic) async {
    await _fcmService.subscribeToTopic(topic);
  }

  /// Unsubscribe from a topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await _fcmService.unsubscribeFromTopic(topic);
  }
}
