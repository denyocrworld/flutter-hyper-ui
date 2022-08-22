import 'package:flutter/material.dart';
class Get {
    static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    static get currentContext {
    return navigatorKey.currentContext;
    }

    static to(Widget page) async {
    await navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (context) => page),
    );
    }

    static back() {
    navigatorKey.currentState!.pop(currentContext);
    }

    static offAll(page) {
    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false,
    );
    }

    static double get width {
    return MediaQuery.of(currentContext).size.width;
    }

    static double get height {
    return MediaQuery.of(currentContext).size.width;
    }
}

extension ChangeNotifierExtension on ChangeNotifier {
    update() {
        // ignore: invalid_use_of_visible_for_testing_member, unnecessary_this
        this.notifyListeners();
    }
}

class HyperController {}