import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TemplateChatDetailView extends StatelessWidget {
  const TemplateChatDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#TEMPLATE ui_chat_detail
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Starring:
    Name: Jaisy Al Huda
    Linkedin: https://www.linkedin.com/in/jaisy-al-huda-622a8bb2/
    ------------------------
    [1] Update pubspec.yaml
    material_design_icons_flutter:

    [2] Import
    import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
    Keep it in mind, Our snippet can't generate many files yet. So, all of our snippets are put in one file which is not best practice.
    ------------------------ 
    */

    List messageList = [
      {
        "message": "Can you check your email?",
        "images": [],
        "time": "10:02",
        "is_me": false,
        "sender": {
          "name": "Keanue Reeve",
          "avatar_url":
              "https://i.ibb.co/PMKdvj4/photo-1529156349890-84021ffa9107-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
        }
      },
      {
        "message": "",
        "images": [
          "https://images.unsplash.com/photo-1483972117325-ce4920ff780b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dW5pdGVkJTIwa2luZ2RvbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60g",
          "https://images.unsplash.com/photo-1601860354536-8e0dd988651b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dW5pdGVkJTIwc3RhdGVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1522885147691-06d859633fb8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmlubGFuZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        ],
        "time": "10:02",
        "is_me": true,
      },
      {
        "message": "Yes. i have check it. Thanks for your update!",
        "images": [],
        "time": "10:02",
        "is_me": true,
      },
      {
        "message": "This jelly fish is awesome",
        "images": [
          "https://images.unsplash.com/photo-1628944682084-831f35256163?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8amVsbHklMjBmaXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        ],
        "time": "10:02",
        "is_me": true,
      },
      {
        "message": "I have one!",
        "images": [
          "https://images.unsplash.com/photo-1545537619-3b5475acd977?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8amVsbHklMjBmaXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        ],
        "time": "10:02",
        "is_me": false,
        "sender": {
          "name": "Keanue Reeve",
          "avatar_url":
              "https://i.ibb.co/ysF41JY/photo-1546957221-37816b007052-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-HNl.jpg",
        }
      },
      {
        "message": "Haha, Cool!",
        "images": [
          "https://images.unsplash.com/photo-1565799557186-1abfed8a31e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8amVsbHklMjBmaXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1563204424-83201789377d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8amVsbHklMjBmaXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        ],
        "time": "10:02",
        "is_me": true,
      },
    ];

    getImages({
      List images = const [],
      bool isMe = false,
    }) {
      if (images.isEmpty) return Container();
      if (images.length == 1) {
        return Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.1,
              height: 200,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(images[0]),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        );
      }

      if (images.length == 2) {
        return Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 200,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(images[0]),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 200,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(images[1]),
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        );
      }

      if (images.length >= 3) {
        return Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 200,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(images[0]),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 100,
                  height: 95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(images[1]),
                    ),
                    color: Colors.blue,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Container(
                  width: 100,
                  height: 95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(images[2]),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }

      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        elevation: 0.0,
        leading: Container(),
        leadingWidth: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: const CircleAvatar(
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Keanu Reeves',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blueGrey[100],
            padding: const EdgeInsets.only(
              left: 0.0,
              right: 0.0,
              top: 12.0,
              bottom: 40.0,
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                ...List.generate(messageList.length, (index) {
                  var item = messageList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (item["is_me"] == false)
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.yellow,
                              backgroundImage: NetworkImage(
                                item["sender"]["avatar_url"],
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (item["message"].isNotEmpty)
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          color: Colors.grey[300],
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Text("${item["message"]}"),
                                      ),
                                    getImages(
                                      images: item["images"],
                                      isMe: item["is_me"],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 75.0,
                            ),
                          ],
                        ),
                      if (item["is_me"] == true)
                        Row(
                          children: [
                            const SizedBox(
                              width: 75.0,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  if (item["message"].isNotEmpty)
                                    Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 10.0),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 4,
                                            blurRadius: 5,
                                            offset: const Offset(
                                              0,
                                              7,
                                            ), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        color: Colors.green[300],
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        "${item["message"]}",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  getImages(
                                    images: item["images"],
                                    isMe: item["is_me"],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        MdiIcons.emoticon,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.attachment,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        MdiIcons.microphone,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //#END
  }
}
