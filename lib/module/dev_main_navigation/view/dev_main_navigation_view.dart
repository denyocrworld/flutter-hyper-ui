import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import 'package:flutterx/module/dev_about/view/dev_about_view.dart';
import 'package:flutterx/module/dev_dashboard/view/dev_dashboard_view.dart';
import 'package:flutterx/module/dev_pages/view/dev_pages_view.dart';
import 'package:flutterx/module/dev_ui_kit/view/dev_ui_kit_view.dart';
import '../controller/dev_main_navigation_controller.dart';

class DevMainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevMainNavigationController>(
      init: DevMainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return ExNavigation(
          type: NavigationType.basic,
          children: [
            DevDashboardView(),
            DevUiKitView(),
            DevPagesView(),
            DevAboutView(),
          ],
          menus: [
            NavigationItem(
              icon: Icons.home,
              label: "Dashboard",
            ),
            NavigationItem(
              icon: Icons.list,
              label: "UI Kit",
            ),
            NavigationItem(
              icon: Icons.pages,
              label: "Pages",
            ),
            NavigationItem(
              icon: Icons.supervised_user_circle,
              label: "About Us",
            ),
          ],
        );
      },
    );
  }
}
