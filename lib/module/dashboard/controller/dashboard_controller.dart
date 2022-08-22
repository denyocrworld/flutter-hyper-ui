import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hyper_ui/riverpod_util.dart';
import '../view/dashboard_view.dart';

class DashboardController extends ChangeNotifier implements HyperController {
  DashboardView? view;
}

final dashboardController =
    ChangeNotifierProvider<DashboardController>((ref) {
  return DashboardController();
});