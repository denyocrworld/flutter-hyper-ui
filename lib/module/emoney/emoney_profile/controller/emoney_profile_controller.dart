import 'package:get/get.dart';
import '../view/emoney_profile_view.dart';
import 'package:flutter/material.dart';

class EmoneyProfileController extends GetxController {
  EmoneyProfileView? view;

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

  List<Map<String, dynamic>> card1 = [
    {
      'name': 'Marks',
      'subname': 'Average: 8.9',
      'color': Color(0xffFF9500),
      'icon': 'assets/icon/icon_thumup.png',
    },
    {
      'name': 'Debts',
      'subname': 'None',
      'color': Color(0xffFF3B30),
      'icon': 'assets/icon/icon_fire.png',
    },
    {
      'name': 'History',
      'subname': '',
      'color': Color(0xff34C759),
      'icon': 'assets/icon/icon_time.png',
    },
  ];

  List<Map<String, dynamic>> card2 = [
    {
      'name': 'News',
      'subname': '',
      'color': Color(0xff546CF6),
      'icon': 'assets/icon/icon_compas.png',
    },
    {
      'name': 'Teachers',
      'subname': '',
      'color': Color(0xff546CF6),
      'icon': 'assets/icon/icon_peoples.png',
    },
    {
      'name': 'Rools',
      'subname': '',
      'color': Color(0xff546CF6),
      'icon': 'assets/icon/icon_shield.png',
    },
  ];
}
