import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TemplateWelcomeScreen extends StatelessWidget {
  const TemplateWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#TEMPLATE ui_welcome
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Starring:
    Name: Flutter Way
    Youtube: https: //www.youtube.com/c/TheFlutterWay/playlists?app=desktop
    ------------------------
    [1] Update pubspec.yaml
    flutter_svg:

    [2] Import
    import 'package:flutter_svg/svg.dart';
    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
    Keep it in mind, Our snippet can't generate many files yet. So, all of our snippets are put in one file which is not best practice.
    ------------------------
    */

    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF6F35A5),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: const Color(0xFF6F35A5),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Color(0xFF6F35A5),
          prefixIconColor: Color(0xFF6F35A5),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: 120,
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            const Text(
                              "WELCOME TO EDU",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16.0 * 2),
                            Row(
                              children: [
                                const Spacer(),
                                Expanded(
                                  flex: 8,
                                  child: SvgPicture.asset(
                                    "assets/icons/chat.svg",
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 16.0 * 2),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: Column(
                                children: [
                                  Hero(
                                    tag: "login_btn",
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Container();
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Login".toUpperCase(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Container();
                                          },
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFFF1E6FF),
                                        elevation: 0),
                                    child: Text(
                                      "Sign Up".toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //#END
  }
}
