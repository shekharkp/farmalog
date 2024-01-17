import 'package:flutter/material.dart';

class ShowBlog extends StatelessWidget {
  const ShowBlog(
      {super.key,
      required this.imageProvider,
      required this.title,
      required this.content,
      required this.author});
  final ImageProvider<Object> imageProvider;
  final String title;
  final String content;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 10, right: 10, left: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333c3a)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("by $author", style:const TextStyle(color: Colors.grey)),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                AspectRatio(
                  aspectRatio: 1 / 0.7,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin:const EdgeInsets.all(25),
                    padding:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        opacity: 1,
                      ),
                    ),
                  ),
                ),
                SelectableText(content,
                    style:const TextStyle(
                      color: Colors.black87,

                    ),
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
