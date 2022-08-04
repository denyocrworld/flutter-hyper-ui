import 'package:flutterx/core.dart';
import '../view/social_media_new_post_view.dart';

class SocialMediaNewPostController extends GetxController {
  SocialMediaNewPostView? view;

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

  doPost() async {
    var photo = Input.get("photo");
    var description = Input.get("description");

    showLoading();

    await FirebaseFirestore.instance.collection("posts").add({
      "name": "DenyOcr",
      "user_photo":
          "https://images.unsplash.com/photo-1564360629-d9935fe414ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
      "photo": photo,
      "likes": 0,
      "description": description,
      "created_at": Timestamp.now(),
    });
    await Future.delayed(Duration(seconds: 2));

    hideLoading();
    Get.back();
  }
}
