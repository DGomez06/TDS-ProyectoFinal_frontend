import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('notiToken', token!);
    print('Token: $token');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
 
}
 Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }