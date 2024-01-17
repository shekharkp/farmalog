import 'loginForm.dart';
import 'package:flutter/material.dart';
import 'package:farmalog/Entities/user.dart';
import '../Database_helper/firestore_helper.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _mobileNo = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String Gender = "Male";
  final _registerFormKey = GlobalKey<FormState>();


  showMessage(String message)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
  }

  LoadingScreen() {
    return showDialog(context: context,barrierDismissible: false, builder: (context) {
      return Center(
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
            color: const Color(0xffe4e2e5),),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF333c3a)),
              SizedBox(height: 10),
              Text("  Processing...", style: TextStyle(fontSize: 12,
                  color: Color(0xFF333c3a),
                  fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      );
    },);
  }


  Future<bool> isUserIDAlreadyExist(User user,Firestore_helper fh)async
  {

    final userid = await fh.getUser(user);
    if(userid == null)
    {
      return true;
    }
    else
    {
      showMessage("user already exist,change userid!!!");
      return false;
    }

  }


  createAccount(User user,Firestore_helper fh)async
  {
    try
    {
      LoadingScreen();
      await fh.addUser(user);
      showMessage("Account created");
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm(),),);
    }
    catch(e)
    {
      showMessage("Something went wrong!");
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _id.dispose();
    _mobileNo.dispose();
    _password.dispose();
    super.dispose();
  }

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
              margin:const EdgeInsets.only(bottom: 6),
              padding:const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:const Color(0xFFe4e2e5),
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      offset: Offset(3, 2),
                    )
                  ]),
              child: Column(
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333c3a)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        FormTextFields(Title: "Username",controller: _name,maxlength: 25,),
                        FormTextFields(Title: "User ID",controller: _id,maxlength: 15,),
                        const Text(
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
                                activeColor:const Color(0xFF333c3a),
                                title:const Text("Male",style: TextStyle(color: Color(0xFF333c3a),),),
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
                          controller: _mobileNo,
                          maxlength: 10,
                          keyboadtype: TextInputType.phone,
                        ),
                        FormTextFields(
                            Title: "Password",
                            controller: _password,
                            maxlength: 15,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                    ElevatedButton.icon(
                      onPressed: () async{
                        if(_registerFormKey.currentState!.validate())
                          {
                            if(_id.text.contains(" ") || _password.text.contains(" ") || _mobileNo.text.contains(" "))
                              {
                                showMessage("Do not include spaces in UserID,password and Mobile Number.");
                                return;
                              }
                            else if(_mobileNo.text.length != 10)
                            {
                              showMessage("Invalid Mobile Number.");
                              return;
                            }
                            else{
                              User user = User(_id.text, _name.text, Gender, int.parse(_mobileNo.text), _password.text);
                              Firestore_helper firestore_helper = Firestore_helper();

                              if(await isUserIDAlreadyExist(user,firestore_helper))
                              {
                                createAccount(user, firestore_helper);
                              }

                            }

                          }

                      },
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.fromLTRB(45, 15, 45, 15),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor:const MaterialStatePropertyAll(Color(0xFF333c3a))
                      ),
                      icon:const Icon(Icons.app_registration_rounded),
                      label:const Text("Register"),
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
      color:const Color(0xFFc4cfdd),
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

  FormTextFields({super.key, required this.Title,required this.controller,required this.maxlength,this.keyboadtype});

  final String Title;
  TextEditingController controller;
  int maxlength;
  TextInputType? keyboadtype;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Title,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboadtype,
            cursorColor: Colors.grey,
            cursorHeight: 15,
            maxLength: maxlength,
            validator: (value) {
              if(value == null || value.isEmpty)
                {
                  return "Field is required";
                }
            },
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
