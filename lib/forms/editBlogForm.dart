import 'package:farmalog/Entities/blog.dart';
import 'package:farmalog/Database_helper/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditBlogForm extends StatefulWidget {
  EditBlogForm({super.key,required this.title,required this.content,required this.imageProvider,required this.showcomments,required this.blogid,required this.userid,required this.imgurl});
  final String title;
  final String content;
  final ImageProvider imageProvider;
  bool showcomments;
  final String blogid;
  final String userid;
  final String imgurl;

  @override
  State<EditBlogForm> createState() => _EditBlogFormState();
}

class _EditBlogFormState extends State<EditBlogForm> {

  Firestore_helper firestore_helper = Firestore_helper();

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final _EditBlogkey = GlobalKey<FormState>();

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

  @override
  void initState() {
    _title.text = widget.title;
    _content.text = widget.content;
    super.initState();
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
                "Edit Blog",
                style: TextStyle(
                  color: Color(0xFF333c3a),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _EditBlogkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10,bottom: 10),
                      child: Text(
                        "Title",
                        style: TextStyle(fontSize: 15,color: Color(0xFF333c3a)),
                      ),
                    ),
                    TextFormField(
                      controller: _title,
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if(value == null || value.isEmpty)
                          {
                            return "Field is required!";
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
                            image: widget.imageProvider,
                            fit: BoxFit.cover,
                            opacity: 1,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 50),
                      child: Text(
                        "Content",
                        style: TextStyle(fontSize: 15,color: Color(0xFF333c3a),),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _content,
                      maxLines: 30,
                      maxLength: 1500,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if(value == null || value.isEmpty)
                        {
                          return "Field is required!";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          counterText: '',
                          hintText: "Enter Content"),
                    ),
                    Row(
                      children: [
                        Checkbox(value: widget.showcomments,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),activeColor: Color(0xFF333c3a),onChanged: (value) {
                              setState(() {
                                widget.showcomments = value!;
                              });
                        },
                        ),
                        const Text("Comments"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ElevatedButton.icon(
                          icon:const Icon(Icons.save_rounded),
                          label:const Text("Save"),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  (10),
                                ),
                              ),
                            ),
                            padding:const MaterialStatePropertyAll(EdgeInsets.only(bottom: 10,top: 10,left: 36,right: 36),),
                            elevation:const MaterialStatePropertyAll(10),
                            backgroundColor:const MaterialStatePropertyAll(Color(0xFF333c3a),),
                          ),
                          onPressed: () async{
                            if(_EditBlogkey.currentState!.validate())
                              {
                                LoadingScreen();
                                Blog blog = Blog(widget.blogid, _title.text, _content.text, widget.userid, widget.showcomments, widget.imgurl);
                                await firestore_helper.updateBlog(blog);
                                showMessage("Blog update success");
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
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
