import 'package:flutterx/core.dart';
import 'package:flutterx/service/user_service.dart';

class EmoneyLoginController extends GetxController {
  EmoneyLoginView? view;

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

    Get.off(EmoneyMainNavigationView());
  }
}
