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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuH8CGtgeMCB1mW71wWDwcS0tH9TNGzCQ',
    appId: '1:159496270161:android:b29b5bd0ae126ec611a370',
    messagingSenderId: '159496270161',
    projectId: 'shelhop-92a9a',
    databaseURL: 'https://shelhop-92a9a-default-rtdb.firebaseio.com',
    storageBucket: 'shelhop-92a9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO483rWdrio7v0h02BxyRu_vFi7YfJQAE',
    appId: '1:159496270161:ios:0fcc6a0b4fab63ac11a370',
    messagingSenderId: '159496270161',
    projectId: 'shelhop-92a9a',
    databaseURL: 'https://shelhop-92a9a-default-rtdb.firebaseio.com',
    storageBucket: 'shelhop-92a9a.appspot.com',
    androidClientId: '159496270161-434ogkqig2bbkejvrdikfo3083jvfo7h.apps.googleusercontent.com',
    iosClientId: '159496270161-rq9s9ds4rtr7991md345bdr618evdklk.apps.googleusercontent.com',
    iosBundleId: 'com.example.shelhopFlowerAdmin',
  );
}
