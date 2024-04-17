// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD7Q0QvA0O9jC3ANfkCNhd14kAz48PpE5A',
    appId: '1:80777034304:web:52fafda71d1ebd9f2bbda5',
    messagingSenderId: '80777034304',
    projectId: 'rentalm-e4a0c',
    authDomain: 'rentalm-e4a0c.firebaseapp.com',
    storageBucket: 'rentalm-e4a0c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1QLme5Cg96wh7dDTjnaaX4dZONHUEUt4',
    appId: '1:80777034304:android:5a93f56f580467bc2bbda5',
    messagingSenderId: '80777034304',
    projectId: 'rentalm-e4a0c',
    storageBucket: 'rentalm-e4a0c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDS5fXfOn-_r9cyleeDfSiwqyQyXVQCyQY',
    appId: '1:80777034304:ios:7f056246475489e52bbda5',
    messagingSenderId: '80777034304',
    projectId: 'rentalm-e4a0c',
    storageBucket: 'rentalm-e4a0c.appspot.com',
    iosBundleId: 'com.example.leaseManagment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDS5fXfOn-_r9cyleeDfSiwqyQyXVQCyQY',
    appId: '1:80777034304:ios:7f056246475489e52bbda5',
    messagingSenderId: '80777034304',
    projectId: 'rentalm-e4a0c',
    storageBucket: 'rentalm-e4a0c.appspot.com',
    iosBundleId: 'com.example.leaseManagment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7Q0QvA0O9jC3ANfkCNhd14kAz48PpE5A',
    appId: '1:80777034304:web:b15afa1f7f3667592bbda5',
    messagingSenderId: '80777034304',
    projectId: 'rentalm-e4a0c',
    authDomain: 'rentalm-e4a0c.firebaseapp.com',
    storageBucket: 'rentalm-e4a0c.appspot.com',
  );
}
