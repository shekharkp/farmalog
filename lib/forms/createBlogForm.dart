import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:farmalog/Entities/blog.dart';
import 'package:farmalog/Database_helper/firestore_helper.dart';
import 'package:farmalog/Database_helper/securedStorage.dart';
import 'package:farmalog/chatbot/chatbotapi.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class CreateBlogForm extends StatefulWidget {
  const CreateBlogForm({super.key});

  @override
  State<CreateBlogForm> createState() => _CreateBlogFormState();
}

class _CreateBlogFormState extends State<CreateBlogForm> {
  File? _image;
  bool Showcomments = true;

  final Securedstorage securedstorage = Securedstorage();
  final Firestore_helper firestore_helper = Firestore_helper();

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final GlobalKey<FormState> _createBlogkey = GlobalKey<FormState>();

  showMessage(String message)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
  }

  LoadingScreen() {
    return showDialog(context: context,barrierDismissible: false, builder: (context) {
      return Center(
        child: Container(
          height: 110,
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

  Future<String> _createBlogId() async
  {
    String userid = await securedstorage.getuserID();
    DateTime dateTime = DateTime.now();
    return "${userid}_blog_${dateTime}";
  }

  _imgFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future<String> uploadAndGetImageUrl() async
  {
     firebase_storage.Reference storagereferance = firebase_storage.FirebaseStorage.instance.ref().child("images/${DateTime.now().millisecondsSinceEpoch}");

     await storagereferance.putFile(_image!);

     String imgurl = await storagereferance.getDownloadURL();
     return imgurl;
  }


  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffe4e2e5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              padding:const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:const Color(0xFFc4cfdd),
                  borderRadius: BorderRadius.circular(30)),
              child:const Text(
                "Create Blog",
                style: TextStyle(
                  color: Color(0xFF333c3a),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _createBlogkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Padding(
                      padding:
                           EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text(
                        "Title",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF333c3a)),
                      ),
                    ),
                    TextFormField(
                      controller: _title,
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if(value == null || value.isEmpty)
                          {
                            return "This field is required!";
                          }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          counterText: '',
                          hintText: "Enter Title"),
                    ),
                    AspectRatio(
                      aspectRatio: 1 / 0.8,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin:const EdgeInsets.all(20),
                        padding:const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: _image == null
                                ?const AssetImage("lib/assets/image_placeholder.png")
                                : Image.file(_image!).image,
                            fit: BoxFit.cover,
                            opacity: 1,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        icon:const Icon(Icons.add),
                        label:const Text("Add Image"),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                (20),
                              ),
                            ),
                          ),
                          padding:const MaterialStatePropertyAll(
                            EdgeInsets.only(
                                bottom: 10, top: 10, left: 16, right: 16),
                          ),
                          elevation:const MaterialStatePropertyAll(10),
                          backgroundColor:const MaterialStatePropertyAll(
                            Color(0xFF333c3a),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _imgFromGallery();
                          });
                        },
                      ),
                    ),
                   const Padding(
                      padding: EdgeInsets.only(left: 10, top: 50),
                      child: Text(
                        "Content",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF333c3a),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _content,
                      maxLines: 30,
                      maxLength: 2000,
                      validator: (value) {
                        if(value == null || value.isEmpty)
                        {
                          return "This field is required!";
                        }
                      },
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
                        Checkbox(
                          value: Showcomments,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          activeColor:const Color(0xFF333c3a),
                          onChanged: (value) {
                            setState(() {
                              Showcomments = value!;
                            });

                          },
                        ),
                        const Text(
                          "Comments",
                          style: TextStyle(
                            color: Color(0xFF333c3a),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ElevatedButton.icon(
                          icon:const Icon(Icons.post_add),
                          label:const Text("Post"),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  (10),
                                ),
                              ),
                            ),
                            padding:const MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  bottom: 10, top: 10, left: 36, right: 36),
                            ),
                            elevation:const MaterialStatePropertyAll(10),
                            backgroundColor:const MaterialStatePropertyAll(
                              Color(0xFF333c3a),
                            ),
                          ),
                          onPressed: () async {

                            if(_createBlogkey.currentState!.validate())
                              {
                                String blogId = await _createBlogId();
                                String userid = await securedstorage.getuserID();
                                Responce gptApi = Responce();
                                if(_image != null)
                                  {
                                    LoadingScreen();
                                    String verifyBlogContent = await gptApi.verifyBlogContent(_content.text.length > 100 ? _content.text.substring(0,100):_content.text);
                                    if(verifyBlogContent == "True")
                                      {
                                        String imgurl = await uploadAndGetImageUrl();
                                        Blog blog = Blog(blogId, _title.text, _content.text, userid, Showcomments, imgurl);
                                        firestore_helper.createBlog(blog);
                                        showMessage("Blog Posted");
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      }
                                    else
                                      {
                                        Navigator.of(context).pop();
                                        showMessage("Blog Content is not related to Agriculture field.");
                                      }

                                  }
                                else
                                  {
                                    showMessage("Pick Image from Gallery");
                                  }
                              }
                          },
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
