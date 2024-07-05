import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCZj7cmFjgQqtcA-128bOcEaPksb2n3R0A",
            authDomain: "xtra-mind-70d4b.firebaseapp.com",
            projectId: "xtra-mind-70d4b",
            storageBucket: "xtra-mind-70d4b.appspot.com",
            messagingSenderId: "311004611977",
            appId: "1:311004611977:web:2da73195424fef565b8d58",
            measurementId: "G-P619D04MB7"));
  } else {
    await Firebase.initializeApp();
  }
}
