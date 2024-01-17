import 'package:farmalog/feedback/feedback.dart';
import 'package:farmalog/Entities/user.dart';
import 'package:farmalog/Entities/comment.dart';
import '../Entities/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore_helper {
  final db = FirebaseFirestore.instance;

  //Methods for user

  Future<void> addUser(User user) async {
    await db.collection("Users").add(user.toJson());
  }

  Future<dynamic> getUser(User user) async {
    CollectionReference ref = await db.collection("Users");
    QuerySnapshot query =
    await ref.where("userid", isEqualTo: user.userid).get();

    if (query.docs.isNotEmpty) {
      var element = query.docs.first;
      User user = User(
          element["userid"],
          element["username"],
          element["gender"],
          element['mobileNo'],
          element["password"]);
      return user;
    } else {
      return null;
    }
  }

  Future<dynamic> getUserByID(String userID) async {
    CollectionReference ref = await db.collection("Users");
    QuerySnapshot query = await ref.where("userid", isEqualTo: userID).get();

    if (query.docs.isNotEmpty) {
      var element = query.docs.first;
      User user = User(element["userid"], element["username"],
          element["gender"], element['mobileNo'], element["password"]);
      return user;
    } else {
      return null;
    }
  }

  Future<bool> getUserbyIDPass(String userid, String password) async {
    CollectionReference ref = await db.collection("Users");
    QuerySnapshot query = await ref.where("userid", isEqualTo: userid).get();

    if (query.docs.isNotEmpty) {
      var element = query.docs.first;
      if (element["userid"] == userid && element["password"] == password) {
        return true;
      }
    }
    return false;
  }

  Updateuser(User user) async {
    CollectionReference ref = await db.collection("Users");
    QuerySnapshot query =
    await ref.where("userid", isEqualTo: user.userid).get();
    DocumentSnapshot documentSnapshot = await query.docs.first;
    DocumentReference documentReference = await ref.doc(documentSnapshot.id);
    await documentReference.update(user.toJson());
  }

  //Methods for blog
  createBlog(Blog blog) async {
    await db.collection("Blog").add(blog.toJson());
  }

  Future<List<Blog>> getAllBlogs() async {
    CollectionReference collectionReference = await db.collection("Blog");
    QuerySnapshot querySnapshot = await collectionReference.get();

    List<Blog> Blogs = [];
    querySnapshot.docs.forEach(
          (element) {
        Blogs.add(
          Blog(
            element["blogid"],
            element["title"],
            element["content"],
            element["userid"],
            element["showcomments"],
            element["img"],
          ),
        );
      },
    );
    return Blogs;
  }


  Future<List<Blog>> getUserBlogs(String userid) async {
    CollectionReference collectionReference = await db.collection("Blog");
    QuerySnapshot querySnapshot = await collectionReference.where(
        "userid", isEqualTo: userid).get();

    List<Blog> Blogs = [];
    querySnapshot.docs.forEach(
          (element) {
        Blogs.add(
          Blog(
            element["blogid"],
            element["title"],
            element["content"],
            element["userid"],
            element["showcomments"],
            element["img"],
          ),
        );
      },
    );
    return Blogs;
  }


  updateBlog(Blog blog) async {
    CollectionReference ref = await db.collection("Blog");
    QuerySnapshot query = await ref.where("blogid", isEqualTo: blog.blog_id)
        .get();
    DocumentSnapshot documentSnapshot = await query.docs.first;
    DocumentReference documentReference = await ref.doc(documentSnapshot.id);
    await documentReference.update(blog.toJson());
  }

  deleteBlog(String blogId) async {
    CollectionReference ref = await db.collection("Blog");
    QuerySnapshot query = await ref.where("blogid", isEqualTo: blogId).get();
    DocumentSnapshot documentSnapshot = await query.docs.first;
    DocumentReference documentReference = await ref.doc(documentSnapshot.id);
    await documentReference.delete();
  }


  //methods for comment
  addComment(Comments comment) async {
    await db.collection("Comment").add(comment.toJson());
  }

  Future<List<Comments>> getBlogComments(String blogId) async
  {
    CollectionReference collectionReference = await db.collection("Comment");
    QuerySnapshot querySnapshot = await collectionReference.where(
        "blogId", isEqualTo: blogId).get();

    List<Comments> Comment = [];

    querySnapshot.docs.forEach((element) {
      Comments comments = Comments(
          element["commentId"], element["blogId"], element["content"],
          element["commentUserId"], element["replyContent"]);
      Comment.add(comments);
    }
    );
    return Comment;
  }

  updateComment(String commentId,String reply) async {
    CollectionReference ref = await db.collection("Comment");
    QuerySnapshot query = await ref.where("commentId", isEqualTo: commentId).get();
    DocumentSnapshot documentSnapshot = await query.docs.first;
    DocumentReference documentReference = await ref.doc(documentSnapshot.id);
    await documentReference.update({"replyContent" : reply});
  }


  //Feedback
  sendFeedback(Feedbacks feedbacks)async
  {
       await db.collection("Feedback").add(feedbacks.toJson());
  }
}

