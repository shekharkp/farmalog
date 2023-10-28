import 'package:flutter/material.dart';

class Feedbackform extends StatelessWidget {
  const Feedbackform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e2e5),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Feedback",
                style: TextStyle(
                    color: Color(0xFF333c3a),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              maxLines: 5,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.only(right: 20, left: 20, top: 12, bottom: 12),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF333c3a)),
                elevation: MaterialStatePropertyAll(10),
              ),
              onPressed: () {},
              icon: Icon(Icons.feedback_rounded),
              label: Text("Send Feedback"),
            ),
          ],
        ),
      ),
    );
  }
}
