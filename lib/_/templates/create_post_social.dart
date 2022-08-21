import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class TemplateLoginSocialView extends StatelessWidget {
  const TemplateLoginSocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#TEMPLATE ui_create_post_social
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Starring:
    Name: Deny Ocr
    Youtube: https://www.youtube.com/c/CapekNgoding
    ------------------------
    [1] Update pubspec.yaml
    blur:
    image_picker:
    dio:

    [2] Import
    import 'package:image_picker/image_picker.dart';
    import 'package:dio/dio.dart';

    [2.a] If you are using Getx
    import 'package:get/get.dart' hide Response, FormData, MultipartFile;

    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
    Keep it in mind, Our snippet can't generate many files yet. 
    So, all of our snippets are put in one file which is not best practice.
    You need to do the optimization yourself, and at least you are familiar with using Flutter.
    ------------------------
    */

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[600],
              ),
              onPressed: () {},
              child: const Text("Post"),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const NetworkImage(
                    "https://i.ibb.co/QrTHd59/woman.jpg",
                  ),
                ),
                title: const Text("Jessica Doe"),
                subtitle: Row(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.public,
                              size: 12.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "Public",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind?",
                  ),
                ),
              ),
            ),
            Container(
              height: 24 + 60.0,
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60.0,
                    width: 60.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      final ImagePicker imagePicker = ImagePicker();
                      var image = await imagePicker.pickImage(
                        source: ImageSource.camera,
                        maxWidth: 1024,
                      );
                      if (image == null) return;

                      final formData = FormData.fromMap({
                        'image': MultipartFile.fromBytes(
                          await image.readAsBytes(),
                          filename: "upload.jpg",
                        ),
                      });

                      var res = await Dio().post(
                        'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
                        data: formData,
                      );

                      var data = res.data["data"];
                      var imageUrl = data["url"];
                      // ignore: avoid_print
                      print("imageUrl: $imageUrl");
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.green,
                    ),
                    onPressed: () async {
                      final ImagePicker imagePicker = ImagePicker();
                      var image = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                        maxWidth: 1024,
                      );
                      if (image == null) return;

                      final formData = FormData.fromMap({
                        'image': MultipartFile.fromBytes(
                          await image.readAsBytes(),
                          filename: "upload.jpg",
                        ),
                      });

                      var res = await Dio().post(
                        'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
                        data: formData,
                      );

                      var data = res.data["data"];
                      var imageUrl = data["url"];
                      // ignore: avoid_print
                      print("imageUrl: $imageUrl");
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.pin_drop,
                      color: Colors.red,
                    ),
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: Colors.yellow[700],
                    ),
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.tag,
                      color: Colors.grey[600],
                    ),
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.grey[600],
                    ),
                    onPressed: () async {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //#END
  }
}
