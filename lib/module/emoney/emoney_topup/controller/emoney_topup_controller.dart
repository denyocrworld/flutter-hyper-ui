import 'package:flutterx/core.dart';
import 'package:flutterx/data/session/app_session.dart';

class EmoneyTopupController extends GetxController {
  EmoneyTopupView? view;

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

  Map? selectedPayment;
  Map? selectedAmount;
  List paymentMethods = [
    {
      "photo": "https://i.ibb.co/yy0XYTS/349229.png",
      "payment_name": "BCA",
      "type": "Bank transfer",
    },
    {
      "photo": "https://i.ibb.co/yy0XYTS/349229.png",
      "payment_name": "BRI",
      "type": "Bank transfer",
    },
    {
      "photo": "https://i.ibb.co/yy0XYTS/349229.png",
      "payment_name": "BNI",
      "type": "Bank transfer",
    }
  ];

  List amounts = [
    {
      "amount": "100",
    },
    {
      "amount": "200",
    },
    {
      "amount": "300",
    },
    {
      "amount": "500",
    }
  ];

  doTopup() async {
    showLoading();
    await Future.delayed(Duration(seconds: 2));

    // await userCollection.update({
    //   "balance": FieldValue.increment(double.parse(selectedAmount["amount"])),
    // });

    await userCollection.update({
      "balance": FieldValue.increment(double.parse(selectedAmount!["amount"])),
    });

    hideLoading();
    Get.back();
  }
}
