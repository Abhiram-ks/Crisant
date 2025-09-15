import 'package:crisent_pannel/core/cloudinary/cloudinary_keystore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationSender {
   String serverKey = FcmConfig.serverKey;

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://fcm.googleapis.com",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<bool> sendPushNotification({
    required String token,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(alert: true, badge: true, sound: true);
    try {
      final payload = {
        "to": token,
        "priority": "high",
        "notification": {"title": title, "body": body},
        "data": data ?? {},
      };

      final response = await _dio.post("/fcm/send", data: payload);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
