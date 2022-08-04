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

  List products = [
    {
      "product_name": "Orange",
      "photo":
          "https://i.ibb.co/58HqsTT/photo-1503508343067-c4103b7140b3-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "price": 14,
    },
    {
      "product_name": "Orange",
      "photo":
          "https://i.ibb.co/k87SYt0/photo-1517481705099-72660903e569-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "price": 15,
    },
    {
      "product_name": "Orange",
      "photo":
          "https://i.ibb.co/D1LGfph/photo-1495624423019-fdbb969dd0fe-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "price": 21,
    },
  ];
}
