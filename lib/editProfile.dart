import 'package:flutter/material.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  String Gender = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          const Backgroundcolour(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 250, 20, 40),
            child: Container(
              margin: EdgeInsets.only(bottom: 6),
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFFe4e2e5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      offset: Offset(3, 2),
                    )
                  ]),
              child: Column(
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333c3a)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    child: Column(
                      children: [
                        FormTextFields(Title: "Username"),
                        FormTextFields(Title: "User ID"),
                        Text(
                          "Gender",
                          style: TextStyle(
                              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: RadioListTile(
                                value: "Male",
                                groupValue: Gender,
                                activeColor: Color(0xFF333c3a),
                                title: Text("Male",style: TextStyle(color: Color(0xFF333c3a),),),
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value.toString();
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: RadioListTile(
                                value: "Female",
                                groupValue: Gender,
                                activeColor: Color(0xFF333c3a),
                                title: Text("Female",style: TextStyle(color: Color(0xFF333c3a),),),
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value.toString();
                                  },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        FormTextFields(
                          Title: "Phone Number",
                        ),
                        FormTextFields(Title: "Password"),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(45, 15, 45, 15),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              backgroundColor: MaterialStatePropertyAll(Color(0xFF333c3a))
                          ),
                          icon: Icon(Icons.save_rounded),
                          label: Text("Save"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Backgroundcolour extends StatelessWidget {
  const Backgroundcolour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFc4cfdd),
      width: double.maxFinite,
      height: 500,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
      child: const Text(
        "FarmLog",
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FormTextFields extends StatelessWidget {
  const FormTextFields({super.key, required this.Title});
  final String Title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Title,
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            cursorColor: Colors.grey,
            cursorHeight: 15,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide.none),
            ),
            style: const TextStyle(fontSize: 15, color: Color(0xFF333c3a)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
