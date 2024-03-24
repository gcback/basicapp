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
        return macos;
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
    apiKey: 'AIzaSyBVyoU3CXAM69jIJ2vVqG0mHdj6Wz9u8Mg',
    appId: '1:882231392840:web:7df959c6b1c61e176df67d',
    messagingSenderId: '882231392840',
    projectId: 'basicapp-313b2',
    authDomain: 'basicapp-313b2.firebaseapp.com',
    storageBucket: 'basicapp-313b2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAG4tKr-OwtWfe-dp94wrtObnAc770OrfQ',
    appId: '1:882231392840:android:33cd177d7e4a6b196df67d',
    messagingSenderId: '882231392840',
    projectId: 'basicapp-313b2',
    storageBucket: 'basicapp-313b2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-D2wDOZsw8Y8fa4-oA7WSk4RxCEZXwMM',
    appId: '1:882231392840:ios:69b0d4d633165c636df67d',
    messagingSenderId: '882231392840',
    projectId: 'basicapp-313b2',
    storageBucket: 'basicapp-313b2.appspot.com',
    iosClientId: '882231392840-0jkdad13gdr61k7n7nh09s5tja1ql569.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-D2wDOZsw8Y8fa4-oA7WSk4RxCEZXwMM',
    appId: '1:882231392840:ios:536a99a525a6720c6df67d',
    messagingSenderId: '882231392840',
    projectId: 'basicapp-313b2',
    storageBucket: 'basicapp-313b2.appspot.com',
    iosClientId: '882231392840-l940reon89calgheuq5ski22bi7johb4.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicapp.RunnerTests',
  );
}
