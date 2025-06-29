# Firebase Cloud Messaging (FCM) Setup

This guide explains how to set up and use Firebase Cloud Messaging in your Flutter app.

## Files Created

1. **`lib/core/services/fcm_service.dart`** - Main FCM service
2. **`lib/core/helpers/fcm_helper.dart`** - Helper class for easy access
3. **`lib/core/widgets/fcm_token_display.dart`** - Widget to display device token

## Setup Instructions

### 1. Install Dependencies

Run the following command to install the required dependencies:

```bash
flutter pub get
```

### 2. Initialize FCM in your app

In your `main.dart` file, initialize FCM after Firebase initialization:

```dart
import 'package:grad_project/core/helpers/fcm_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize FCM
  await FCMHelper.initialize();

  runApp(MyApp());
}
```

### 3. Get Device Token

To get the device FCM token:

```dart
// Get token asynchronously
String? token = await FCMHelper.getDeviceToken();

// Or get current token if already initialized
String? currentToken = FCMHelper.currentToken;
```

### 4. Display Token in UI

Use the provided widget to display the token:

```dart
import 'package:grad_project/core/widgets/fcm_token_display.dart';

// In your widget
FCMTokenDisplay()
```

### 5. Subscribe to Topics (Optional)

```dart
// Subscribe to a topic
await FCMHelper.subscribeToTopic('announcements');

// Unsubscribe from a topic
await FCMHelper.unsubscribeFromTopic('announcements');
```

## Features

- ✅ **Background Notifications**: Handles notifications when app is closed
- ✅ **Foreground Notifications**: Shows notifications when app is open
- ✅ **Token Management**: Automatically handles token refresh
- ✅ **iOS Permission**: Requests notification permission on iOS
- ✅ **Topic Subscription**: Subscribe/unsubscribe to topics
- ✅ **Simple API**: Easy to use helper methods

## How it Works

1. **Background Handler**: `_backgroundMessageHandler` processes notifications when app is closed
2. **Foreground Handler**: `_handleForegroundMessage` shows local notifications when app is open
3. **Token Management**: Automatically retrieves and refreshes FCM tokens
4. **Local Notifications**: Uses `flutter_local_notifications` to show notifications in foreground

## Sending Notifications from Backend

Your backend can send notifications using the device token:

```json
{
  "to": "DEVICE_TOKEN_HERE",
  "notification": {
    "title": "Notification Title",
    "body": "Notification Body"
  },
  "data": {
    "key": "value"
  }
}
```

## Testing

1. Initialize FCM in your app
2. Use the `FCMTokenDisplay` widget to get the device token
3. Send a test notification from Firebase Console or your backend
4. Verify notifications appear both when app is open and closed

## Notes

- Make sure Firebase is properly configured in your project
- For iOS, ensure you have the required capabilities and certificates
- The service automatically handles token refresh
- Notifications will be displayed as local notifications when the app is in foreground
