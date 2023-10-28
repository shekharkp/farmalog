import 'package:farmalog/createBlogForm.dart';
import 'package:farmalog/feedbackForm.dart';
import 'package:farmalog/showBlog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e2e5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 70,
                right: 10,
                left: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Shekhar Patil 👋",
                        style: TextStyle(
                            color: Color(0xFF333c3a),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Feedbackform(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.feedback_rounded,
                      size: 25,
                      color: Color(0xFF333c3a),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedList(
              initialItemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index, animation) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffe4e2e5),
                      ),
                      child: Column(
                        children: [
                          //Post_image
                          AspectRatio(
                            aspectRatio: 1 / 0.8,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage("lib/assets/Fig.1-resized.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          //Post_Title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Researchers Helping Protect Crops From Pests | National institute of food and agriculture",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF333c3a),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "by Manish",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Color(0xFF333c3a), fontSize: 12),
                              ),
                            ],
                          ),

                          //Post_buttons
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: Color(0xffe4e2e5),
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16))),
                                    builder: (context) =>
                                        DraggableScrollableSheet(
                                          initialChildSize: 0.7,
                                          minChildSize: 0.4,
                                          maxChildSize: 0.85,
                                          expand: false,
                                          builder: (context, controller) =>
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.remove,
                                                    color: Colors.grey[600],
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                      "Q&A",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Color(0xFF333c3a)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListView.builder(
                                                      controller: controller,
                                                      itemCount: 10,
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "Rohit Patil",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blueGrey),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(5),
                                                                child: Text(
                                                                    "What about land?"),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.only(
                                                                    left: 40,
                                                                    top: 5,
                                                                    right: 5,
                                                                    bottom: 5),
                                                                child: Text("I will post about it soon...")
                                                              ),
                                                              Divider(
                                                                color:
                                                                Colors.blueGrey,
                                                                thickness: 2,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: MediaQuery.of(context)
                                                          .viewInsets
                                                          .bottom,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.all(10),
                                                            child: TextFormField(
                                                              maxLength: 100,
                                                              keyboardType:
                                                              TextInputType.text,
                                                              decoration: InputDecoration(
                                                                  counterText: '',
                                                                  hintText:
                                                                  "add a Comment"),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                          child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                Icons.send_rounded,
                                                                color: Color(
                                                                    0xFF333c3a)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        ),
                                  );
                                },
                                icon: Icon(
                                  Icons.mode_comment_rounded,
                                  color: Color(0xFF333c3a),
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_rounded,
                                  color: Color(0xFF333c3a),
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 160,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStatePropertyAll(
                                          Color(0xFF333c3a),),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),),),
                                  elevation: MaterialStatePropertyAll(8),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowBlog(),),);
                                  },
                                  child: Text(
                                    "Read More",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          backgroundColor: Color(0xFF333c3a),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlogForm(),));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
