import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/module/qualified/chat_detail.dart';
import 'package:flutter_hyper_ui/module//qualified/chat_list.dart';
import 'package:flutter_hyper_ui/module//qualified/dashboard_grocery.dart';
import 'package:flutter_hyper_ui/module//qualified/dashboard_ovo.dart';
import 'package:flutter_hyper_ui/module//qualified/dashboard_travel.dart';
import 'package:flutter_hyper_ui/module//qualified/login.dart';
import 'package:flutter_hyper_ui/module//qualified/navigation_gojek.dart';
import 'package:flutter_hyper_ui/module//qualified/profile_basic.dart';
import 'package:flutter_hyper_ui/module//qualified/sign_up.dart';
import 'package:flutter_hyper_ui/module//qualified/welcome_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List menu = [
      {
        "category": "Auth",
      },
      {
        "icon": Icons.developer_board,
        "name": "Welcome",
        "page": const WelcomeScreen(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Login",
        "page": const LoginView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Sign Up",
        "page": const SignUpView(),
      },
      {
        "category": "Dashboard",
      },
      {
        "icon": Icons.developer_board,
        "name": "Dashboard Travel",
        "page": const DashboardTravelView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Dashboard Grocery",
        "page": const DashboardGroceryView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Dashboard OVO",
        "page": const DashboardOvoView(),
      },
      {
        "category": "Profile",
      },
      {
        "icon": Icons.developer_board,
        "name": "Profile Basic",
        "page": const ProfileBasicView(),
      },
      {
        "category": "Chat",
      },
      {
        "icon": Icons.developer_board,
        "name": "Chat List",
        "page": const ChatListView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Chat Detail",
        "page": const ChatDetailView(),
      },
      {
        "category": "Navigation",
      },
      {
        "icon": Icons.developer_board,
        "name": "Navigation Gojek",
        "page": GojekMainNavigationView(),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text("Dashboard"),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.tune),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
              children: List.generate(
            menu.length,
            (index) {
              var item = menu[index];

              if (item["category"] != null) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${item["category"]}",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item["page"]),
                ),
                child: Card(
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width - 80) / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Icon(item["icon"]),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          item["name"],
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 8.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }
}
