import 'package:firebase_auth/firebase_auth.dart';

enum FirebaseAuthExtensionEnum {
  dev,
}

extension FirebaseAuthExtension on FirebaseAuth {
  wait() async {
    bool ready = false;
    FirebaseAuth.instance.authStateChanges().listen((event) {
      ready = true;
    });

    while (ready == false) {
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }
}
