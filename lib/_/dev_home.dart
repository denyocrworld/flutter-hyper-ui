import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/_/templates/form/form.dart';
import 'package:flutter_hyper_ui/_/templates/list/list_horizontal_example.dart';
import 'package:flutter_hyper_ui/_/templates/list/list_vertical_example.dart';
import 'package:flutter_hyper_ui/_/templates/menu/menu.dart';
import 'package:flutter_hyper_ui/_/templates/navigation/basic_drawer_navigation.dart';
import 'package:flutter_hyper_ui/_/templates/navigation/basic_navigation.dart';
import 'package:flutter_hyper_ui/_/templates/navigation/curved_navigation.dart';

import 'templates/chat_detail.dart';
import 'templates/chat_list.dart';
import 'templates/dashboard_grocery.dart';
import 'templates/dashboard_ovo.dart';
import 'templates/dashboard_travel.dart';
import 'templates/login.dart';
import 'templates/profile_basic.dart';
import 'templates/sign_up.dart';
import 'templates/welcome.dart';

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
        "page": const TemplateWelcomeScreen(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Login",
        "page": const TemplateLoginView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Sign Up",
        "page": const TemplateSignUpView(),
      },
      {
        "category": "Dashboard",
      },
      {
        "icon": Icons.developer_board,
        "name": "Dashboard Travel",
        "page": const TemplateDashboardTravelView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Dashboard Grocery",
        "page": const TemplateDashboardGroceryView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Dashboard OVO",
        "page": const TemplateDashboardOvoView(),
      },
      {
        "category": "Profile",
      },
      {
        "icon": Icons.developer_board,
        "name": "Profile Basic",
        "page": const TemplateProfileBasicView(),
      },
      {
        "category": "Chat",
      },
      {
        "icon": Icons.developer_board,
        "name": "Chat List",
        "page": const TemplateChatListView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Chat Detail",
        "page": const TemplateChatDetailView(),
      },
      {
        "category": "Navigation",
      },
      {
        "icon": Icons.developer_board,
        "name": "Basic Navigation",
        "page": const BasicMainNavigationView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Float Navigation",
        "page": const FloatMainNavigationView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Basic Drawer Navigation",
        "page": const BasicDrawerMainNavigationView(),
      },
      {
        "category": "Menu",
      },
      {
        "icon": Icons.developer_board,
        "name": "Menu",
        "page": const MenuView(),
      },
      {
        "category": "List",
      },
      {
        "icon": Icons.developer_board,
        "name": "Horizontal List",
        "page": const ListHorizontalView(),
      },
      {
        "icon": Icons.developer_board,
        "name": "Vertical List",
        "page": const ListVerticalView(),
      },
      {
        "category": "Form",
      },
      {
        "icon": Icons.developer_board,
        "name": "Form",
        "page": const FormExampleView(),
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
          child: Column(
            children: [
              //#TEMPLATE image
              Image.network(
                "https://i.ibb.co/S32HNjD/no-image.jpg",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
              //#END
              const SizedBox(
                height: 10.0,
              ),
              //#TEMPLATE image_network
              Image.network(
                "https://i.ibb.co/S32HNjD/no-image.jpg",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
              //#END

              const SizedBox(
                height: 10.0,
              ),

              //#TEMPLATE image_asset
              Image.asset(
                "assets/icon/icon.png",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
              //#END

              //#TEMPLATE button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_stadium
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_radius
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_beveled
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_outline
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_stadium_outline
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_radius_outline
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_beveled_outline
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //----------------------

              //#TEMPLATE button_icon
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_stadium
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_radius
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_beveled
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //----------
              //#TEMPLATE button_icon_outline
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_stadium_outline
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_radius_outline
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_beveled_outline
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE icon
              const Icon(Icons.developer_board),
              //#END

              //#TEMPLATE icon_button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              //#END

              //#TEMPLATE textfield
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'John Doe',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                ),
              ),
              //#END

              //#TEMPLATE textfield_icon
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'John Doe',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.abc,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                ),
              ),
              //#END

              //#TEMPLATE textfield_email
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'admin@gmail.com',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your email address',
                  ),
                ),
              ),
              //#END

              //#TEMPLATE textfield_password
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'admin@gmail.com',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.password,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your password',
                  ),
                ),
              ),
              //#END

              //#TEMPLATE textfieldrad
              Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              //#END
              //----------

              Wrap(
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
            ],
          ),
        ),
      ),
    );
  }
}
