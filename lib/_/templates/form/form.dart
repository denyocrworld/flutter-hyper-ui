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
            children: const [
              //#TEMPLATE f_text
              ExTextField(
                id: "first_name",
                label: "First Name",
                value: "Deny",
              ),
              //#END
              //#TEMPLATE f_password
              ExTextField(
                id: "password",
                label: "Password",
                textFieldType: TextFieldType.password,
              ),
              //#END
              //#TEMPLATE f_number
              ExTextField(
                id: "qty",
                label: "Qty",
                keyboardType: TextInputType.number,
                value: "12",
              ),
              //#END
              //#TEMPLATE f_text_area
              ExTextArea(
                id: "memo",
                label: "Memo",
                value: "nice one!",
              ),
              //#END
              //#TEMPLATE f_combo
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
                value: "Female",
              ),
              //#END
              //#TEMPLATE f_radio
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
                value: "Female",
              ),
              //#END
              //#TEMPLATE f_switch
              ExSwitch(
                id: "gender",
                label: "Gender",
                value: true,
              ),
              //#END
              //#TEMPLATE f_check
              ExCheckBox(
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
              ExImagePicker(
                id: "photo",
                label: "Photo",
                // value: "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
              //#END
              //#TEMPLATE f_location
              ExLocationPicker(
                id: "location",
                label: "Location",
                latitude: -6.218481065235333,
                longitude: 106.80254435779423,
              ),
              //#END
              //#TEMPLATE f_color
              ExColorPicker(
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
