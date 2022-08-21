import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

class FormExampleView extends StatelessWidget {
  const FormExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //#TEMPLATE f_btn
              ExButton(
                label: "Save",
                color: primaryColor,
                onPressed: () {},
              ),
              //#END
              //#TEMPLATE f_text
              const ExTextField(
                id: "first_name",
                label: "First Name",
                value: "Deny",
              ),
              //#END
              //#TEMPLATE f_password
              const ExTextField(
                id: "password",
                label: "Password",
                textFieldType: TextFieldType.password,
              ),
              //#END
              //#TEMPLATE f_number
              const ExTextField(
                id: "qty",
                label: "Qty",
                keyboardType: TextInputType.number,
                value: "12",
              ),
              //#END
              //#TEMPLATE f_text_area
              const ExTextArea(
                id: "memo",
                label: "Memo",
                value: "nice one!",
              ),
              //#END
              //#TEMPLATE f_combo
              const ExCombo(
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
                value: "Female",
              ),
              //#END
              //#TEMPLATE f_radio
              const ExRadio(
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
                value: "Female",
              ),
              //#END
              //#TEMPLATE f_switch
              const ExSwitch(
                id: "gender",
                label: "Gender",
                value: true,
              ),
              //#END
              //#TEMPLATE f_check
              const ExCheckBox(
                id: "my_hobby",
                label: "My Hobby",
                items: [
                  {
                    "label": "Coding",
                    "value": "Coding",
                  },
                  {
                    "label": "Afk",
                    "value": "Afk",
                  },
                  {
                    "label": "E-Sport",
                    "value": "E-Sport",
                  }
                ],
                value: [
                  "Coding",
                ],
              ),
              //#END
              //#TEMPLATE f_image
              const ExImagePicker(
                id: "photo",
                label: "Photo",
                // value: "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
              //#END
              //#TEMPLATE f_location
              const ExLocationPicker(
                id: "location",
                label: "Location",
                latitude: -6.218481065235333,
                longitude: 106.80254435779423,
              ),
              //#END
              //#TEMPLATE f_color
              const ExColorPicker(
                id: "color",
                label: "Color",
              ),
              //#END
            ],
          ),
        ),
      ),
    );
  }
}
