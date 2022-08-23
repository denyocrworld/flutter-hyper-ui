import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';

class ImagePickerController {
  static Future<String?> uploadImage({
    required Uint8List imageBytes,
    required String fileName,
  }) async {
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        imageBytes,
        filename: fileName,
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?expiration=600&key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    if (res.data == null) {
      log(res.data.toString());
      log(res.statusCode.toString());
      return null;
    }

    log("// IMGBB");
    log(res.data["data"].toString());
    log("// IMGBB");

    var data = res.data["data"];
    var url = data["url"];
    log("IMGBBURL: $url");

    return url;
  }
}
