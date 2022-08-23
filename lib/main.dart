import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/setup.dart';
import 'package:flutter_hyper_ui/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './riverpod_util.dart';

void main() async {
  await initialize();

  Widget mainView = Container();
  if (FirebaseAuth.instance.currentUser != null) {
    mainView = Container();
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.navigatorKey,
        theme: defaultTheme,
        home: const DevTestView(),
      ),
    ),
  );
}
