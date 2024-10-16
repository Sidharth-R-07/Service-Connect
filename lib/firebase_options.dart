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
    apiKey: 'AIzaSyDWt9B8wdslMEuyFu7OAYieGB4TJVjF83c',
    appId: '1:727615182353:web:7ac0b9c7a9fe64953e43b0',
    messagingSenderId: '727615182353',
    projectId: 'service-connect-test',
    authDomain: 'service-connect-test.firebaseapp.com',
    storageBucket: 'service-connect-test.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRz7w1x6Y8GcCP5VwnKJaS6m9my_egcQk',
    appId: '1:727615182353:android:b578283b93fb27723e43b0',
    messagingSenderId: '727615182353',
    projectId: 'service-connect-test',
    storageBucket: 'service-connect-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyKhdXJa6oZHmMTRk83nNX6bXiQwHM-7g',
    appId: '1:727615182353:ios:543e5c7f75ecb2d93e43b0',
    messagingSenderId: '727615182353',
    projectId: 'service-connect-test',
    storageBucket: 'service-connect-test.appspot.com',
    iosBundleId: 'com.example.serviceConnect',
  );
}
