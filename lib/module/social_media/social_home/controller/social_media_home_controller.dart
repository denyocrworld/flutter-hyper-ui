import 'package:dio/dio.dart';
import 'package:flutterx/core.dart';
import 'package:flutterx/module/social_media/social_home/view/social_media_home_view.dart';
import '../../model/content_model.dart';

class SocialMediaHomeController extends GetxController {
  SocialMediaHomeView? view;

  @override
  void onInit() {
    super.onInit();
    isLoading = true;
    getListContent().then((result) {
      listContent = result;
      isLoading = false;
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final List users = [
    'Erika',
    'Hasan',
    'Suryono',
    'Ngatman',
    'Budi',
    'Rojanah',
    'Bahri',
    'Erwin'
  ];

  List<Content> listContent = [];
  bool isLoading = false;
  final String dataUrl =
      'https://pixabay.com/api/?key=28901809-0958cfb5c962cfc68206428e0&q=blue+flowers&image_type=photo&pretty=true';

  Future<List<Content>> getListContent() async {
    final response = await Dio().get(dataUrl);
    final dataModel =
        ContentModel.fromJson(response.data as Map<String, dynamic>);
    return dataModel.listContent;
  }
}
