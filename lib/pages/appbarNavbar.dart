import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farmalog/pages/home.dart';
import 'package:farmalog/chatbot/chatbot.dart';
import 'profile.dart';

class appbarNavbar extends StatefulWidget {
  const appbarNavbar({super.key});

  @override
  State<appbarNavbar> createState() => _appbarNavbarState();
}

class _appbarNavbarState extends State<appbarNavbar> {
  List<Widget> Pages = [const Home(), const Chatbot(), const Profile()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Warning"),
              content: const Text("Do you really wanted to exit!!!"),
              backgroundColor: const Color(0xFFe4e2e5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF333c3a),
                    ),
                  ),
                  child:const Text("No"),
                ),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF333c3a),
                    ),
                  ),
                  child:const Text("Yes"),
                ),
              ],
            );
          },
        );
        return true;
      },
      child: Scaffold(
        backgroundColor:const Color(0xffe4e2e5),
        extendBody: true,
        bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor:const Color(0xFFc4cfdd),
              elevation: 0,
              selectedIconTheme:const IconThemeData(
                size: 25,
              ),
              unselectedIconTheme:const IconThemeData(
                size: 22,
              ),
              selectedLabelStyle:const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333c3a)),
              selectedItemColor:const Color(0xFF333c3a),
              enableFeedback: true,
              unselectedItemColor:const Color(0xFF333c3a),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: index,
              onTap: (value) {
                setState(
                  () {
                    index = value;
                  },
                );
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  activeIcon: Icon(
                    Icons.home_rounded,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                  ),
                  label: "Chatbot",
                  activeIcon: Icon(
                    Icons.chat_bubble_rounded,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                  ),
                  label: "Profile",
                  activeIcon: Icon(
                    Icons.person,
                  ),
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
