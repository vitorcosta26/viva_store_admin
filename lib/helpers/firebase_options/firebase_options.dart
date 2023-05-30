// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCb5Iyz0gpYzO2bbf-TIPf0qgWeDv6tC0Q',
    appId: '1:854804288375:web:68f7eb6b850f42a61cc772',
    messagingSenderId: '854804288375',
    projectId: 'vivastore-6645c',
    authDomain: 'vivastore-6645c.firebaseapp.com',
    storageBucket: 'vivastore-6645c.appspot.com',
    measurementId: 'G-5TKYFNGNQS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKuGHWliT0zntJPtdi651SBMrl__cnSaM',
    appId: '1:854804288375:android:3613468aa17ce27a1cc772',
    messagingSenderId: '854804288375',
    projectId: 'vivastore-6645c',
    storageBucket: 'vivastore-6645c.appspot.com',
  );
}