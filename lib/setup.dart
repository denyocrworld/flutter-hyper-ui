import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) return;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.wait();
}
