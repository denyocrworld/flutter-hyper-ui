import 'package:flutterx/core.dart';

import 'package:flutterx/module/social_media/social_media_main_navigation/view/social_media_main_navigation_view.dart';
import 'package:flutterx/service/user_service.dart';

import '../view/social_media_login_view.dart';

class SocialMediaLoginController extends GetxController {
  SocialMediaLoginView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  doLogin() async {
    var email = Input.get("email");
    var password = Input.get("password");

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await UserService.saveCurrentUserData();
    } on Exception catch (_) {
      showError("Failed", "Login failed");
      return;
    }

    Get.off(SocialMediaMainNavigationView());
  }
}
