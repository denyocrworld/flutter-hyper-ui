import 'dart:developer';
import 'dart:io';

import 'package:flutterx/core.dart';

import 'package:path/path.dart' as path;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../image/network_image.dart';

FilePickerCross? pickedFileInImagePicker;
FilePickerResult? filePickerResult;

class ExImagePicker extends StatefulWidget {
  final String id;
  final String label;
  final String? value;
  final Function(String value)? onChanged;
  final bool? compress;

  ExImagePicker({
    required this.id,
    required this.label,
    this.value,
    this.onChanged,
    this.compress = false,
  });

  @override
  _ExImagePickerState createState() => _ExImagePickerState();
}

class _ExImagePickerState extends State<ExImagePicker>
    implements InputControlState {
  String? imageUrl;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    pickedFileInImagePicker = null;
    imageUrl = widget.value;
    Input.set(widget.id, imageUrl);
    Input.inputController[widget.id] = this;
  }

  setValue(value) {
    imageUrl = value;
    Input.set(widget.id, value);
    setState(() {});
  }

  resetValue() {
    imageUrl = null;
    Input.set(widget.id, null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("imageUrl: $imageUrl");

    return InkWell(
      onTap: () async {
        if (loading) return;

        if (kIsWeb || Platform.isWindows) {
          FilePickerCross myFile;
          try {
            myFile = await FilePickerCross.importFromStorage(
              type: FileTypeCross.custom,
              fileExtension: 'jpg, png',
            );
          } on Exception catch (_) {
            log("No File is Selected or File Picker Error!!");
            return;
          }

          loading = true;
          setState(() {});

          var compressedFile = widget.compress == true
              ? myFile.compressImage()
              : myFile.toUint8List();

          var uploadedImageUrl = await ImagePickerController.uploadImage(
            imageBytes: compressedFile,
            fileName: myFile.fileName!,
          );

          if (uploadedImageUrl == null) {
            Get.snackbar("Error", "Failed to upload!");
            loading = false;
            setState(() {});
            return;
          }

          imageUrl = uploadedImageUrl;
          Input.set(widget.id, imageUrl);
          setState(() {});

          if (widget.onChanged != null) {
            widget.onChanged!(imageUrl!);
          }

          loading = false;
          setState(() {});
        } else {
          filePickerResult = await FilePicker.platform.pickFiles(
            allowMultiple: false,
          );
          if (filePickerResult == null) return;
          if (filePickerResult!.files.isEmpty) return;

          loading = true;
          setState(() {});

          var file = filePickerResult!.files[0];
          var filename = Uuid().v1() + "_" + path.basename(file.name);
          //Compress Image
          Directory tempDir = await getTemporaryDirectory();
          String tempPath = tempDir.path;
          String targetpath = "$tempPath/$filename";
          File targetFile = File(targetpath);

          await FlutterImageCompress.compressAndGetFile(
            file.path!,
            targetpath,
            quality: 50,
          );

          final form = FormData({
            'image': MultipartFile(
              targetFile.readAsBytesSync(),
              filename: "upload.jpg",
            ),
          });

          var res = await GetConnect().post(
            // 'https://api.imgbb.com/1/upload?expiration=600&key=b55ef3fd02b80ab180f284e479acd7c4',
            'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
            form,
          );

          var data = res.body["data"];
          var url = data["url"];
          print(url);

          imageUrl = url;
          Input.set(widget.id, imageUrl);
          setState(() {});

          if (widget.onChanged != null) {
            widget.onChanged!(imageUrl!);
          }

          loading = false;
          setState(() {});
        }
      },
      child: Container(
        width: Get.width,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(widget.label),
            ),
            SizedBox(
              height: 4.0,
            ),
            if (loading) ...[
              Container(
                height: 120.0,
                width: 160.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
            if (!loading) ...[
              if (imageUrl != null)
                Container(
                  height: 120.0,
                  width: 160.0,
                  child: ExImage(
                    imageUrl!,
                    height: 100,
                    width: Get.width / 3,
                    fit: BoxFit.cover,
                  ),
                ),
              if (imageUrl == null)
                Container(
                  height: 120.0,
                  width: 160.0,
                  child: Center(
                    child: Icon(
                      Icons.photo,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
