import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:get/get.dart';
import 'package:image_compression/image_compression.dart';

class ImagePickerController {
  static Future<String?> uploadImage({
    required Uint8List imageBytes,
    required String fileName,
  }) async {
    final form = FormData({
      'image': MultipartFile(
        imageBytes,
        filename: fileName,
      ),
    });
    var res = await GetConnect().post(
      'https://api.imgbb.com/1/upload?expiration=600&key=b55ef3fd02b80ab180f284e479acd7c4',
      form,
    );
    if (res.body == null) {
      log(res.body.toString());
      log(res.statusCode.toString());
      return null;
    }

    log("// IMGBB");
    log(res.body["data"].toString());
    log("// IMGBB");

    var data = res.body["data"];
    var url = data["url"];
    log("IMGBBURL: $url");

    return url;
  }
}

extension MyImageCompressorExtension on FilePickerCross {
  Uint8List compressImage() {
    var value = this;
    final input = ImageFile(
      rawBytes: value.toUint8List(),
      filePath: value.path!,
    );
    return compress(
      ImageFileConfiguration(input: input),
    ).rawBytes;
  }
}
