class Comments
{
  String commentId;
  String blogId;
  String content;
  String commentUserId;
  String replyContent;

  Comments(this.commentId,this.blogId,this.content,this.commentUserId,this.replyContent);

  toJson()
  {
    return
        {
          "commentId" : commentId,
          "blogId" : blogId,
          "content" : content,
          "commentUserId" : commentUserId,
          "replyContent" : replyContent
        };
  }
}