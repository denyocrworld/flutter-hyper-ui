import 'dart:io';
import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/module/dev/dev_apps/view/dev_apps_view.dart';

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
  Widget mainView = DevAppsView();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: defaultTheme,
    home: mainView,
  ));

  //Run in Emulator Mode (Windows)
  if (Platform.isWindows) {
    Future.delayed(Duration(milliseconds: 900), () {
      doWhenWindowReady(() {
        var initialSize = Size(340, 680);
        appWindow.alignment = Alignment.topCenter;
        // appWindow.position = Offset(5, 5);
        appWindow.minSize = initialSize;
        appWindow.size = initialSize;
        appWindow.show();
      });
    });
  }
}
