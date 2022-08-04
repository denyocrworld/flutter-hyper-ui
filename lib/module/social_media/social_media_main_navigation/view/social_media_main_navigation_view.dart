import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import 'package:flutterx/module/social_media/social_home/view/social_media_home_view.dart';
import '../controller/social_media_main_navigation_controller.dart';

class SocialMediaMainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialMediaMainNavigationController>(
      init: SocialMediaMainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return ExNavigation(
          type: NavigationType.basic,
          selectedColor: Colors.grey[900],
          unselectedColor: Colors.grey[400],
          children: [
            SocialMediaHomeView(),
            Container(),
            Container(),
            Container(),
          ],
          menus: [
            NavigationItem(
              icon: MdiIcons.home,
              label: "Home",
            ),
            NavigationItem(
              icon: MdiIcons.searchWeb,
              label: "Search",
            ),
            NavigationItem(
              icon: MdiIcons.shopping,
              label: "Shooping",
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
