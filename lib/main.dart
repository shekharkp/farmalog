import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginForm.dart';
import 'registerForm.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins"
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text("Warning"),content: Text("Do you really wanted to exit!!!"),backgroundColor: Color(0xFFe4e2e5),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),actions: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context,false);
            }, child: Text("No"),
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFF333c3a),),),),
            ElevatedButton(onPressed: () {
              SystemNavigator.pop();
            }, child: Text("Yes"),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFF333c3a),),),
            ),
          ],);
        },);
         return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFe4e2e5),
        body: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFFc4cfdd),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Lottie.asset("lib/assets/Mv5y4SKQga.json",),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              child: const Column(
                children: [
                  Text(
                    "FarmLog",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color(0xFF333c3a),
                    ),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Description is nothing just an long form explaination of the title "
                      "but you have to explain it after developing the app.so remenber it.and be specific upon what you write",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                    style: TextStyle(color: Color(0xFF333c3a),fontFamily: "Sans"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => LoginForm(),));
                      },
                      icon: Icon(
                        Icons.login_outlined,
                        size: 15,
                        color: Color(0xFF333c3a),
                      ),
                      label: Text(
                        "Login   ",
                        style: TextStyle(color: Color(0xFF333c3a),fontFamily: "Poppins",),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.fromLTRB(45, 15, 45, 15),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFc4cfdd)),
                          elevation: MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                         Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterForm(),));
                      },
                      icon: Icon(
                        Icons.app_registration_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Register",
                        style: TextStyle(color: Colors.white,fontFamily: "Poppins"),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.fromLTRB(45, 15, 45, 15),
                          ),
                          elevation: MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF333c3a))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
