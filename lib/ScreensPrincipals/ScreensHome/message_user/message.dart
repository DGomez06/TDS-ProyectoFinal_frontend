import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/models/notificaitons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List<NotificationMessage> notifications = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    loadNotifications();
    setupFirebaseMessaging();
  }

  Future<void> loadNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notificationStrings = prefs.getStringList('notifications') ?? [];

    setState(() {
      notifications = notificationStrings
          .map((notificationString) {
            try {
              return NotificationMessage.fromJson(jsonDecode(notificationString));
            } catch (e) {
              print('Error al parsear notificación: $e');
              return NotificationMessage(title: 'Error', body: 'Notificación inválida');
            }
          })
          .toList();
    });
  }

  Future<void> setupFirebaseMessaging() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Manejar la notificación recibida mientras la app está en primer plano
      final notification = NotificationMessage(
        title: message.notification?.title ?? 'Nuevo Mensaje',
        body: message.notification?.body ?? '',
      );

      setState(() {
        notifications.insert(0, notification); // Agregar al inicio de la lista
      });

      // Guardar la lista actualizada en SharedPreferences
      saveNotifications();
    });
  }

  Future<void> saveNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedNotifications = notifications
        .map((notification) => jsonEncode(notification.toJson()))
        .toList();

    await prefs.setStringList('notifications', updatedNotifications);
  }

  Future<void> deleteNotification(int index) async {
    setState(() {
      notifications.removeAt(index);
    });

    // Actualiza SharedPreferences con la nueva lista de notificaciones
    await saveNotifications();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                const Text('No hay notificaciones'),
                IconButton(onPressed: loadNotifications, 
                icon: const Icon(Icons.refresh))
                ]),
            )
          
      
      :Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    String text = notifications[index].body ?? '';
                    return Container(
                      height: 80,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                            width: 1.5, color: const Color(0xFFD3D2D2)),
                      ),
                      child: Stack(
                        children: [ListTile(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 700,
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/ProfileScreen/back.svg',
                                              height: 25,
                                            ),
                                          ),
                                          const SizedBox(width: 110),
                                          const Text(
                                            'MENSAJE',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF4BB8D0),
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'A',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                                width:
                                                    20), // Espacio entre el círculo y los textos
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Anonimato Pimentel',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '22/02/2022 11:03 PM',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Titulo',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Container(
                                          height: 40,
                                          width:
                                              350, // Altura deseada del TextField
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFD3D2D2)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                    0.5), // Color y opacidad de la sombra
                                                spreadRadius:
                                                    1, // Radio de dispersión de la sombra
                                                blurRadius:
                                                    2, // Radio de difuminado de la sombra
                                                offset: const Offset(0,
                                                    2), // Desplazamiento de la sombra
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Mantenimiento', // Icono deseado
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 8,
                                                  horizontal:
                                                      12), // Ajusta el espacio interno
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Mensaje',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Container(
                                          height: 300,
                                          width: 350,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFD3D2D2)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: TextField(
                                              textAlign: TextAlign.justify,
                                              maxLines: 20,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Ahora mismo el espejo del baño se encuentra roto y propongo la idea de cambiarlo por uno más grande y más resistente.',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          leading: Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4BB8D0),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: const Center(
                              child: Text(
                                'A',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            notifications[index].title?? '',
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text((text.length > 30
                              ? '${text.substring(0, 30)}...'
                              : text)),
                        ),
                        Positioned(
                          right: -5,
                          top: -5,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => deleteNotification(index),
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
