import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';





class EmoneyMainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyMainNavigationController>(
      init: EmoneyMainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return ExNavigation(
          type: NavigationType.basic,
          selectedColor: Colors.purple[900],
          unselectedColor: Colors.grey[400],
          children: [
            EmoneyDashboardView(),
            EmoneyFinanceView(),
            EmoneyInboxView(),
            EmoneyProfileView(),
          ],
          menus: [
            NavigationItem(
              icon: Icons.dashboard,
              label: "Dashboard",
            ),
            NavigationItem(
              icon: MdiIcons.finance,
              label: "Finance",
            ),
            NavigationItem(
              icon: MdiIcons.inboxOutline,
              label: "Inbox",
            ),
            NavigationItem(
              icon: Icons.person,
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
