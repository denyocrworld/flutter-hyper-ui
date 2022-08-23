import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

FilePickerCross? pickedFileInImagePicker;
FilePickerResult? filePickerResult;

class ExImagePicker extends StatefulWidget {
  final String id;
  final String label;
  final String? value;
  final Function(String value)? onChanged;
  final bool? compress;

  const ExImagePicker({
    Key? key,
    required this.id,
    required this.label,
    this.value,
    this.onChanged,
    this.compress = false,
  }) : super(key: key);

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

  @override
  setValue(value) {
    imageUrl = value;
    Input.set(widget.id, value);
    setState(() {});
  }

  @override
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

        filePickerResult = await FilePicker.platform.pickFiles(
          allowMultiple: false,
        );
        if (filePickerResult == null) return;
        if (filePickerResult!.files.isEmpty) return;

        loading = true;
        setState(() {});

        var file = filePickerResult!.files[0];
        var filename = const Uuid().v1() + "_" + path.basename(file.name);
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

        final formData = FormData.fromMap({
          'image': MultipartFile.fromBytes(
            targetFile.readAsBytesSync(),
            filename: "upload.jpg",
          ),
        });

        var res = await Dio().post(
          'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
          data: formData,
        );

        var data = res.data["data"];
        var url = data["url"];

        imageUrl = url;
        Input.set(widget.id, imageUrl);
        setState(() {});

        if (widget.onChanged != null) {
          widget.onChanged!(imageUrl!);
        }

        loading = false;
        setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(widget.label),
            ),
            const SizedBox(
              height: 4.0,
            ),
            if (loading) ...[
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const NetworkImage(
                          "https://cdn-icons-png.flaticon.com/128/159/159626.png",
                        ),
                        color: Colors.grey[600],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (!loading) ...[
              if (imageUrl != null)
                Container(
                  height: 120.0,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl!,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (imageUrl == null)
                Container(
                  height: 120.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const NetworkImage(
                            "https://cdn-icons-png.flaticon.com/128/159/159626.png",
                          ),
                          color: Colors.grey[600],
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text("Upload"),
                      ],
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
