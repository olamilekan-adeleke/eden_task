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
    apiKey: 'AIzaSyAn61Ymhg855VdNiDWddBBWsjps9kFVwH4',
    appId: '1:552810675673:web:9993b4db155e2261fc2dc8',
    messagingSenderId: '552810675673',
    projectId: 'eden-task-fae2a',
    authDomain: 'eden-task-fae2a.firebaseapp.com',
    storageBucket: 'eden-task-fae2a.appspot.com',
    measurementId: 'G-33EM7WELH6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhSZgo_noKdsatNELvENaMZCGSFnvZPjM',
    appId: '1:552810675673:android:c0b71df21213bb8bfc2dc8',
    messagingSenderId: '552810675673',
    projectId: 'eden-task-fae2a',
    storageBucket: 'eden-task-fae2a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpMWu0SOOcERNeW7PLnbiFlyiLQHErgsY',
    appId: '1:552810675673:ios:e839713e06fc5679fc2dc8',
    messagingSenderId: '552810675673',
    projectId: 'eden-task-fae2a',
    storageBucket: 'eden-task-fae2a.appspot.com',
    iosClientId: '552810675673-ii7t94q7vauhudglb8no6sqju0jrhvmn.apps.googleusercontent.com',
    iosBundleId: 'com.example.edenTask',
  );
}