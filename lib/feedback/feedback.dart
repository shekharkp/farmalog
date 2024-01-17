

class Feedbacks
{
  String userid;
  String username;
  String feedbackContent;

  Feedbacks(this.userid,this.username,this.feedbackContent);

  toJson()
  {
    return {
      "userid" : userid,
      "username" : username,
      "feedbackContent" : feedbackContent,
    };
  }

}