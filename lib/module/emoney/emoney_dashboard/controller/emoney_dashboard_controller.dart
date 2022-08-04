import 'package:get/get.dart';
import '../view/emoney_dashboard_view.dart';

class EmoneyDashboardController extends GetxController {
  EmoneyDashboardView? view;

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

  List<Map> categories = [
    {
      'icon': 'assets/icon/purchase-credit.png',
      'title': 'Purchase Credit',
    },
    {
      'icon': 'assets/icon/mobile-data.png',
      'title': 'Mobile Data',
    },
    {
      'icon': 'assets/icon/electricity.png',
      'title': 'Electricity Bill',
    },
    {
      'icon': 'assets/icon/tax.png',
      'title': 'Tax',
    },
    {
      'icon': 'assets/icon/credit-card.png',
      'title': 'Credit Card',
    },
    {
      'icon': 'assets/icon/protection.png',
      'title': 'Protection',
    },
    {
      'icon': 'assets/icon/investment.png',
      'title': 'Investment',
    },
    {
      'icon': 'assets/icon/deals.png',
      'title': 'Deals',
    },
  ];

  List carousel = [
    'assets/image/promotion/promo-1.jpg',
    'assets/image/promotion/promo-2.jpg',
    'assets/image/promotion/promo-3.jpg',
  ];
}
