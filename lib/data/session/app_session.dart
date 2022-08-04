import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppSession {}

DocumentReference get userCollection {
  return FirebaseFirestore.instance.collection("users").doc(
        FirebaseAuth.instance.currentUser!.uid,
      );
}

User get currentUser {
  return FirebaseAuth.instance.currentUser!;
}
