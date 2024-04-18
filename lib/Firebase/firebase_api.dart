import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/models/notificaitons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('notiToken', token!);
    String? tokennot = await ApiConexion().getToken();
    print('Token: $token');
    print('TokenNot: $tokennot');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
 
}
 Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');

  // Crear una instancia de NotificationMessage con los datos de la notificación
  final notification = NotificationMessage(
    title: message.notification?.title,
    body: message.notification?.body,
  );

  // Guardar la notificación en SharedPreferences o en otro lugar para mostrarla después
  await saveNotification(notification);
}


  Future<void> saveNotification(NotificationMessage notification) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notifications =
        prefs.getStringList('notifications') ?? <String>[];

    // Convertir la notificación a un formato que puedas guardar
    String notificationString =
        '${notification.title}: ${notification.body}';

    // Guardar la notificación en la lista de notificaciones
    notifications.add(notificationString);

    // Guardar la lista actualizada en SharedPreferences
    await prefs.setStringList('notifications', notifications);
  }