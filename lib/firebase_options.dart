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
    apiKey: 'AIzaSyDN285GVLBH10vpWBOwsYlQTsN-dItCAcU',
    appId: '1:943243524425:web:abae9142d176a354c34298',
    messagingSenderId: '943243524425',
    projectId: 'weathera-faa1d',
    authDomain: 'weathera-faa1d.firebaseapp.com',
    storageBucket: 'weathera-faa1d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIWX644YYcPRLL-DgXPowBAVchcYNZ9J8',
    appId: '1:943243524425:android:8b4a81acea98b7c8c34298',
    messagingSenderId: '943243524425',
    projectId: 'weathera-faa1d',
    storageBucket: 'weathera-faa1d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDb9xmWbV6fFB2mNPnTgIji3OkBihMgws0',
    appId: '1:943243524425:ios:3ee0f8007164280fc34298',
    messagingSenderId: '943243524425',
    projectId: 'weathera-faa1d',
    storageBucket: 'weathera-faa1d.appspot.com',
    iosBundleId: 'com.example.weatherapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDb9xmWbV6fFB2mNPnTgIji3OkBihMgws0',
    appId: '1:943243524425:ios:1e28a3d614685665c34298',
    messagingSenderId: '943243524425',
    projectId: 'weathera-faa1d',
    storageBucket: 'weathera-faa1d.appspot.com',
    iosBundleId: 'com.example.weatherapp.RunnerTests',
  );
}
