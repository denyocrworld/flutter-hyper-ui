import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/riverpod_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/login_controller.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    LoginController controller = ref.watch(loginController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (controller.loading) const CircularProgressIndicator(),
              //body
              const ExTextField(
                id: "email",
                label: "Email",
                value: "admin@gmail.com",
              ),
              const ExTextField(
                id: "password",
                label: "Password",
                value: "123456",
              ),
              ExButton(
                label: "Login",
                color: primaryColor,
                onPressed: () => controller.doLogin(),
              ),
              Container(
                width: Get.width / 2,
                height: 200.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
