class Blog {
  String blog_id;
  String title;
  String content;
  String userid;
  bool showComments;
  String imagePath;

  Blog(this.blog_id, this.title, this.content, this.userid, this.showComments,
      this.imagePath);

  toJson() {
    return {
      "blogid": blog_id,
      "title": title,
      "content": content,
      "userid": userid,
      "showcomments": showComments,
      "img": imagePath,
    };
  }
}
