import 'package:flutter/material.dart';

import 'templates/chat_detail.dart';
import 'templates/chat_list.dart';
import 'templates/dashboard_grocery.dart';
import 'templates/dashboard_ovo.dart';
import 'templates/dashboard_travel.dart';
import 'templates/login.dart';
import 'templates/profile_basic.dart';
import 'templates/sign_up.dart';
import 'templates/welcome_screen.dart';

class DeveloperHomeView extends StatelessWidget {
  const DeveloperHomeView({Key? key}) : super(key: key);

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
