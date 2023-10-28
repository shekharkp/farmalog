
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'chatbot/chatbot.dart';
import 'profile.dart';

class appbarNavbar extends StatefulWidget {
  const appbarNavbar({super.key});

  @override
  State<appbarNavbar> createState() => _appbarNavbarState();
}

class _appbarNavbarState extends State<appbarNavbar> {
  List<Widget> Pages = [Home(),Chatbot(),Profile()];
  int index = 0;
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
        backgroundColor: Color(0xffe4e2e5),
        extendBody: true,
        bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFFc4cfdd),
              elevation: 0,
              selectedIconTheme: IconThemeData(size: 25,),
              unselectedIconTheme: IconThemeData(size: 22,),
              selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF333c3a)),
              selectedItemColor: Color(0xFF333c3a),
              enableFeedback: true,
              unselectedItemColor: Color(0xFF333c3a),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  index = value;
                },
                );
              },
              items: const[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined,),
                  activeIcon: Icon(Icons.home_rounded,),
                  label: "Home",

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline_rounded,),
                  label: "Chatbot",
                  activeIcon: Icon(Icons.chat_bubble_rounded,),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded,),
                  label: "Profile",
                  activeIcon: Icon(Icons.person,),
                ),
              ],
            ),
          ),
        ),
        body: Pages[index],
      ),
    );
  }
}
