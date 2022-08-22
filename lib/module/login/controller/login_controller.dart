import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hyper_ui/riverpod_util.dart';
import '../view/login_view.dart';

class LoginController extends ChangeNotifier implements HyperController {
  LoginView? view;
  bool loading = false;

  doLogin() async {
    loading = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    update();
  }
}

final loginController = ChangeNotifierProvider<LoginController>((ref) {
  return LoginController();
});
