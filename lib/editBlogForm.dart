import 'package:farmalog/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditBlogForm extends StatelessWidget {
  const EditBlogForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e2e5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFFc4cfdd),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Edit Blog",
                style: TextStyle(
                  color: Color(0xFF333c3a),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10,bottom: 10),
                      child: Text(
                        "Title",
                        style: TextStyle(fontSize: 15,color: Color(0xFF333c3a)),
                      ),
                    ),
                    TextFormField(
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          counterText: '',
                          hintText: "Enter Title"),
                    ),
                    AspectRatio(
                      aspectRatio: 1 / 0.7,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("lib/assets/Fig.1-resized.png"),
                            fit: BoxFit.cover,
                            opacity: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 50),
                      child: Text(
                        "Content",
                        style: TextStyle(fontSize: 15,color: Color(0xFF333c3a),),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 30,
                      maxLength: 1500,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          counterText: '',
                          hintText: "Enter Content"),
                    ),
                    Row(
                      children: [
                        Checkbox(value: true,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),activeColor: Color(0xFF333c3a),onChanged: (value) {

                        },
                        ),
                        Text("Comments"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.post_add),
                          label: Text("Post"),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  (10),
                                ),
                              ),
                            ),
                            padding: MaterialStatePropertyAll(EdgeInsets.only(bottom: 10,top: 10,left: 36,right: 36),),
                            elevation: MaterialStatePropertyAll(10),
                            backgroundColor: MaterialStatePropertyAll(Color(0xFF333c3a),),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
