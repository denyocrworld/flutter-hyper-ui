import 'dart:io';
import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/shared/util/get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    Hive.init("./");
  } else if (Platform.isAndroid) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  } else {}

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  mainStorage = await Hive.openBox('mainStorage');
  Widget mainView = DevMainNavigationView();

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: Get.navigatorKey,
    theme: defaultTheme,
    home: mainView,
  ));
}
