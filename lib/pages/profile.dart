import 'package:farmalog/forms/editBlogForm.dart';
import 'package:farmalog/forms/editProfile.dart';
import 'package:farmalog/main.dart';
import 'package:farmalog/Database_helper/securedStorage.dart';
import 'package:farmalog/Database_helper/firestore_helper.dart';
import 'package:farmalog/Entities/user.dart';
import 'package:farmalog/forms/showBlog.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:farmalog/Entities/blog.dart';
import 'package:farmalog/Entities/comment.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _securedstorage = Securedstorage();
  final Firestore_helper _firestore_helper = Firestore_helper();
  final TextEditingController _comment = TextEditingController();



  Future<String> getUsername() async
  {
    var userID =await _securedstorage.getuserID();
    User user = await _firestore_helper.getUserByID(userID);
    return user.username;
  }


  Future<String> getUserID() async
  {
    var userID =await _securedstorage.getuserID();
    User user = await _firestore_helper.getUserByID(userID);
    return "@${user.userid}";
  }

  Future<String> getUsergender() async
  {
    var userID =await _securedstorage.getuserID();
    User user = await _firestore_helper.getUserByID(userID);
    return user.gender;
  }

  Future<String> getUserMobileNo() async
  {
    var userID =await _securedstorage.getuserID();
    User user = await _firestore_helper.getUserByID(userID);
    return user.mobileNo.toString();
  }

  Future<List<Blog>> _getUserBlog() async
  {
    String userid = await _securedstorage.getuserID();
    return await _firestore_helper.getUserBlogs(userid);
  }

  Future<String> _createCommentId() async
  {
    String userid = await _securedstorage.getuserID();
    DateTime dateTime = DateTime.now();
    return "${userid}_comment_${dateTime}";
  }

  Future<List<Comments>> getBlogComment(String Blogid)async
  {
    final Comment = await _firestore_helper.getBlogComments(Blogid);
    return Comment;
  }


  showMessage(String message)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
  }

  LoadingScreen() {
    return showDialog(context: context, builder: (context) {
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
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          
        });
      },
      child: Scaffold(
        backgroundColor: Color(0xffe4e2e5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                width: double.maxFinite,
                decoration:const BoxDecoration(
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
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Lottie.asset("lib/assets/Farmer.json"),
                    ),
                    FutureText(getText: getUsername(), style: const TextStyle(
                        color: Color(0xFF333c3a),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                    ),
                    FutureText(getText: getUserID(), style:const TextStyle(
                        color: Color(0xFF333c3a),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,),
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
                        color:const Color(0xFFc4cfdd),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.call, color: Color(0xFF333c3a), size: 30),
                          const SizedBox(
                            width: 10,
                          ),
                          FutureText(getText: getUserMobileNo(), style:const TextStyle(
                              fontSize: 15, color: Color(0xFF333c3a),
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:const Color(0xFFc4cfdd),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.account_box_rounded,
                              color: Color(0xFF333c3a), size: 30),
                          const SizedBox(
                            width: 10,
                          ),
                          FutureText(getText: getUsergender(), style:const TextStyle(
                              fontSize: 15, color: Color(0xFF333c3a),
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            padding:const MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  right: 25, left: 25, top: 12, bottom: 12),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Color(0xFF333c3a)),
                            elevation:const MaterialStatePropertyAll(10),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileForm(),),);
                          },
                          icon:const Icon(Icons.edit),
                          label:const Text("Edit Profile"),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              padding:const MaterialStatePropertyAll(
                                EdgeInsets.only(
                                    right: 35, left: 35, top: 10, bottom: 10),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Color(0xFFc4cfdd)),
                              elevation:const MaterialStatePropertyAll(10)),
                          onPressed: () {
                            _securedstorage.setLoginout("False");
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyHomePage(),),);
                          },
                          icon:const Icon(
                            Icons.logout_rounded,
                            color: Color(0xFF333c3a),
                          ),
                          label:const Text(
                            "Logout",
                            style: TextStyle(color: Color(0xFF333c3a),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "Posts",
                    style: TextStyle(
                        color: Color(0xFF333c3a),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
              const Divider(
                height: 5,
                thickness: 3,
                color: Colors.grey,
              ),
              FutureBuilder(
                future: _getUserBlog(),
                builder: (context,AsyncSnapshot<List<Blog>> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return const Padding(
                        padding: EdgeInsets.all(30),
                        child: CircularProgressIndicator(color: Color(0xFF333c3a),),
                      );
                    }
                  else if (snapshot.hasError)
                    {
                      return const Center(
                        heightFactor: 20,
                        child: Text(
                          "Failed to fetch,Check your connection!!!",
                          style: TextStyle(
                              color: Color(0xFF333c3a), fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  else if(snapshot.hasData)
                    {
                      return AnimatedList(
                        initialItemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index, animation) {
                          return Column(
                            children: [
                              Container(
                                padding:const EdgeInsets.all(10),
                                decoration:const BoxDecoration(
                                  color: Color(0xffe4e2e5),
                                ),
                                child: Column(
                                  children: [
                                    //Post_image
                                    AspectRatio(
                                      aspectRatio: 1 / 0.8,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin:const EdgeInsets.all(10),
                                        padding:const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: Image.network(snapshot.data![index].imagePath).image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Post_Title
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot.data![index].title,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style:const TextStyle(
                                              color: Color(0xFF333c3a),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "by ${snapshot.data![index].userid}",
                                            maxLines: 1,
                                            style:const TextStyle(
                                                color: Color(0xFF333c3a), fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),

                                    //Post_buttons
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              backgroundColor:const Color(0xffe4e2e5),
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
                                                    builder: (context,
                                                        controller) =>
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons.remove,
                                                              color: Colors
                                                                  .grey[600],
                                                            ),
                                                            Container(
                                                              padding:const EdgeInsets
                                                                  .all(10),
                                                              child:const Text(
                                                                "Q&A",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Color(
                                                                        0xFF333c3a)),
                                                              ),
                                                            ),
                                                            FutureBuilder(
                                                              future: getBlogComment(snapshot.data![index].blog_id),
                                                              builder: (context1,AsyncSnapshot<List<Comments>> snapshot1) {
                                                                if(snapshot1.connectionState == ConnectionState.waiting)
                                                                {
                                                                  return const Padding(
                                                                    padding: EdgeInsets.all(25.0),
                                                                    child: CircularProgressIndicator(color: Color(0xFF333c3a),),
                                                                  );
                                                                }
                                                                else if(snapshot1.hasError)
                                                                {
                                                                  return const Expanded(
                                                                    child: Center(
                                                                      child: Text(
                                                                        "Failed to fetch,Check your Connection!",
                                                                        style: TextStyle(
                                                                            color: Color(0xFF333c3a), fontSize: 18,fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                else if(snapshot1.hasData)
                                                                {
                                                                  return Expanded(
                                                                    child: ListView
                                                                        .builder(
                                                                      controller: controller,
                                                                      itemCount: snapshot1.data!.length,
                                                                      itemBuilder: (
                                                                          context,
                                                                          index) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(10),
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                            children: [
                                                                              Text(
                                                                                snapshot1.data![index].commentUserId,
                                                                                style:const TextStyle(
                                                                                    color: Colors
                                                                                        .blueGrey),
                                                                              ),
                                                                              Container(
                                                                                padding:
                                                                                const EdgeInsets
                                                                                    .all(
                                                                                    5),
                                                                                child: Text(
                                                                                    snapshot1.data![index].content),
                                                                              ),
                                                                              Container(
                                                                                  child: TextButton(onPressed: () {
                                                                                     showModalBottomSheet(context: context,isScrollControlled: true,
                                                                                       builder:(context) =>  DraggableScrollableSheet(expand: false,initialChildSize: 0.8,builder: (context, scrollController) {
                                                                                         return ReplySheet(commentID: snapshot1.data![index].commentId,userName: snapshot1.data![index].commentUserId,content: snapshot1.data![index].content,);
                                                                                    },),
                                                                                     );
                                                                                  }, child: snapshot1.data![index].replyContent == "" ?const Text("Reply"):Padding(
                                                                                    padding: const EdgeInsets.only(left: 50,),
                                                                                    child: Text(snapshot1.data![index].replyContent,style:const TextStyle(color:  Color(0xFF333c3a)),),
                                                                                  ))
                                                                              ),
                                                                              const Divider(
                                                                                color:
                                                                                Colors
                                                                                    .blueGrey,
                                                                                thickness: 2,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                }
                                                                else
                                                                {
                                                                  return const Center(
                                                                    heightFactor: 20,
                                                                    child: Text(
                                                                      "No comments found",
                                                                      style: TextStyle(
                                                                          color: Color(0xFF333c3a), fontSize: 18,fontWeight: FontWeight.bold),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                bottom: MediaQuery
                                                                    .of(context)
                                                                    .viewInsets
                                                                    .bottom,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .all(10),
                                                                      child: TextFormField(
                                                                        controller: _comment,
                                                                        maxLength: 100,
                                                                        keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                        decoration: const InputDecoration(
                                                                            counterText: '',
                                                                            hintText:"add a Comment"),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right: 10),
                                                                    child: IconButton(
                                                                      icon:const Icon(
                                                                        Icons
                                                                            .send_rounded,
                                                                        color: Color(
                                                                            0xFF333c3a),),
                                                                      onPressed: () async{


                                                                        if(_comment.text.isNotEmpty)
                                                                        {
                                                                              String commentId = await _createCommentId();
                                                                              String userName = await getUsername();
                                                                              String replyContent = "";
                                                                              String blogId = snapshot.data![index].blog_id;

                                                                              Comments comment = Comments(commentId, blogId, _comment.text, userName, replyContent);
                                                                              await _firestore_helper.addComment(comment);

                                                                             _comment.clear();
                                                                              FocusScope.of(context).unfocus();

                                                                        }
                                                                      },
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
                                          icon:const Icon(
                                            Icons.mode_comment_rounded,
                                            color: Color(0xFF333c3a),
                                            size: 30,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {

                                              Share.share("${snapshot.data![index].title}\n\n${snapshot.data![index].content}");

                                          },
                                          icon:const Icon(
                                            Icons.share_rounded,
                                            color: Color(0xFF333c3a),
                                            size: 30,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditBlogForm(title: snapshot.data![index].title,content: snapshot.data![index].content,imageProvider: Image.network(snapshot.data![index].imagePath).image,showcomments: snapshot.data![index].showComments,blogid: snapshot.data![index].blog_id,userid: snapshot.data![index].userid,imgurl: snapshot.data![index].imagePath),),);
                                          },
                                          icon:const Icon(
                                            Icons.edit_document,
                                            color: Color(0xFF333c3a),
                                            size: 30,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: ()async {
                                            LoadingScreen();
                                            await _firestore_helper.deleteBlog(snapshot.data![index].blog_id);
                                            Navigator.of(context).pop();
                                            showMessage("Blog Deleted");
                                            setState(() {

                                            });
                                          },
                                          icon:const Icon(
                                            Icons.delete_rounded,
                                            color: Color(0xFF333c3a),
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFF333c3a)),
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)))),
                                            onPressed: () {
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowBlog(imageProvider: NetworkImage(snapshot.data![index].imagePath), title: snapshot.data![index].title, content: snapshot.data![index].content, author: snapshot.data![index].userid),),);
                                            },
                                            child:const Text(
                                              "Read More",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
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
                      );
                    }
                  else
                    {
                      return const Center(
                        heightFactor: 20,
                        child: Text(
                          "Blogs not Found!!",
                          style: TextStyle(
                              color: Color(0xFF333c3a), fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FutureText extends StatefulWidget {
  const FutureText({super.key,required this.getText,required this.style});
  final Future<String> getText;
  final TextStyle style;
  @override
  State<FutureText> createState() => _FutureTextState();
}

class _FutureTextState extends State<FutureText> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: widget.getText, builder: (context,AsyncSnapshot<String> snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting)
      {
        return Text(
          "Loading...",
          style: widget.style,
        );
      }
      else if(snapshot.hasData)
      {
        return Text(
          snapshot.data!,
          style: widget.style,
        );
      }
      else
      {
        return Text(
          "Failed to fetch",
          style: widget.style
        );
      }
    },
    );
  }
}

class ReplySheet extends StatelessWidget {
   ReplySheet({super.key,required this.commentID,required this.userName,required this.content});
   final String commentID;
   final String userName;
   final String content;
  final TextEditingController _reply = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:const EdgeInsets
              .all(10),
          child:const Text(
            "Reply",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight
                    .bold,
                color: Color(
                    0xFF333c3a)),
          ),
        ),
         Padding(
              padding:const EdgeInsets
                  .all(10),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  Text(
                   userName,
                    style:const TextStyle(
                        color: Colors
                            .blueGrey),
                  ),
                  Container(
                    padding:
                    const EdgeInsets
                        .all(
                        5),
                    child: Text(
                        content),
                  ),
                  const Divider(
                    color:
                    Colors
                        .blueGrey,
                    thickness: 2,
                  ),
                ],
              ),
            ),
        Padding(
          padding:const EdgeInsets.all(2),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets
                      .all(10),
                  child: TextFormField(
                    controller: _reply,
                    maxLength: 100,
                    autofocus: true,
                    keyboardType:
                    TextInputType
                        .text,
                    decoration:const InputDecoration(
                        counterText: '',
                        hintText:"reply to Comment"),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets
                    .only(
                    right: 10),
                child: IconButton(
                  icon:const Icon(
                    Icons
                        .send_rounded,
                    color: Color(
                        0xFF333c3a),),
                  onPressed: () async{


                    if(_reply.text.isNotEmpty)
                    {
                      Firestore_helper _firestore_helper = Firestore_helper();
                      _firestore_helper.updateComment(commentID, _reply.text);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
