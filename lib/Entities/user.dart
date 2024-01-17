class User{
  String userid;
  String username;
  String gender;
  int mobileNo;
  String password;

  User(
      this.userid,
      this.username,
      this.gender,
      this.mobileNo,
      this.password,
      );


  toJson()
  {
    return {
      'username' : username,
      'userid' : userid,
      'gender' : gender,
      'mobileNo' : mobileNo,
      'password' : password
    };
  }
}