import 'package:farmalog/editBlogForm.dart';
import 'package:farmalog/editProfile.dart';
import 'package:farmalog/main.dart';
import 'package:farmalog/showBlog.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e2e5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xFFc4cfdd),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage("lib/assets/Fig.1-resized.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Shekhar Patil",
                    style: TextStyle(
                        color: Color(0xFF333c3a),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "@Shekharkp555",
                    style: TextStyle(
                        color: Color(0xFF333c3a),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20,bottom: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFc4cfdd),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.call, color: Color(0xFF333c3a), size: 30),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "9112000761",
                          style: TextStyle(
                              fontSize: 15, color: Color(0xFF333c3a)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFc4cfdd),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.account_box_rounded,
                            color: Color(0xFF333c3a), size: 30),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 15, color: Color(0xFF333c3a)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.only(
                                right: 25, left: 25, top: 12, bottom: 12),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF333c3a)),
                          elevation: MaterialStatePropertyAll(10),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileForm(),),);
                        },
                        icon: Icon(Icons.edit),
                        label: Text("Edit Profile"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  right: 35, left: 35, top: 10, bottom: 10),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFFc4cfdd)),
                            elevation: MaterialStatePropertyAll(10)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                        },
                        icon: Icon(
                          Icons.logout_rounded,
                          color: Color(0xFF333c3a),
                        ),
                        label: Text(
                          "Logout",
                          style: TextStyle(color: Color(0xFF333c3a),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Posts",
                  style: TextStyle(
                      color: Color(0xFF333c3a),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 3,
              color: Colors.grey,
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
                                "Researchers Helping Protect Crops From Pests | National institute of food and agriculture is actually good thing you shold foolow and this be good and its good to have you on board",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF333c3a),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "by shekhar patil",
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
                                                                child: TextFormField(
                                                                  decoration:
                                                                  InputDecoration(
                                                                      hintText:
                                                                      "enter reply"),
                                                                ),
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
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditBlogForm(),),);
                                },
                                icon: Icon(
                                  Icons.edit_document,
                                  color: Color(0xFF333c3a),
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Color(0xFF333c3a),
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStatePropertyAll(
                                          Color(0xFF333c3a)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10)))),
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
    );
  }
}
