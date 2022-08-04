import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import '../controller/dev_secret_home_controller.dart';

class DevSecretHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevSecretHomeController>(
      init: DevSecretHomeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Secret Home"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ExTextField(
                    id: "email",
                    label: "Email",
                  ),
                  ExTextField(
                    id: "password",
                    label: "Password",
                    textFieldType: TextFieldType.password,
                  ),
                  ExCombo(
                    id: "gender",
                    label: "Gender",
                    items: [
                      {
                        "label": "Male",
                        "value": "Male",
                      },
                      {
                        "label": "Female",
                        "value": "Female",
                      }
                    ],
                  ),
                  ExRadio(
                    id: "gender",
                    label: "Gender",
                    items: [
                      {
                        "label": "Male",
                        "value": "Male",
                      },
                      {
                        "label": "Female",
                        "value": "Female",
                      }
                    ],
                  ),
                  ExDatePicker(
                    id: "birth_date",
                    label: "Birth Date",
                  ),
                  ExTimePicker(
                    id: "time",
                    label: "Time",
                  ),
                  Divider(),
                  ExImagePicker(
                    id: "photo",
                    label: "Photo",
                  ),
                  ExLocationPicker(
                    id: "location",
                    label: "Location",
                  ),
                  ExRating(
                    id: "rating",
                    label: "Rating",
                  ),
                  ExColorPicker(
                    id: "color",
                    label: "Color",
                  ),
                  Text(
                    "Buttons",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ExButton(
                    label: "Success",
                    color: successColor,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Warning",
                    color: warningColor,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Danger",
                    color: dangerColor,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Info",
                    color: infoColor,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Primary",
                    color: primaryColor,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Success",
                    color: successColor,
                    outline: true,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Warning",
                    color: warningColor,
                    outline: true,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Danger",
                    color: dangerColor,
                    outline: true,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Info",
                    color: infoColor,
                    outline: true,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "Primary",
                    color: primaryColor,
                    outline: true,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "size: xl",
                    color: successColor,
                    size: xl,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "size: lg",
                    color: successColor,
                    size: lg,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "size: md",
                    color: successColor,
                    size: md,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "size: sm",
                    color: successColor,
                    size: sm,
                    onPressed: () {},
                  ),
                  ExButton(
                    label: "size: xs",
                    color: successColor,
                    size: xs,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
