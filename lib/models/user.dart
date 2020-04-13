class User {
  final String fullName;
  final String id;
  final String email;
  final String rollNo;
  final String profileImg;
  final String userType;

  User(
      {this.fullName,
      this.id,
      this.email,
      this.userType,
      this.rollNo,
      this.profileImg});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        rollNo = data['rollNo'],
        fullName = data['fullName'],
        profileImg = data['profileImg'],
        userType = data['userType'];

  Map<String, String> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "userType": userType,
      "rollNo": rollNo,
      "profileImg": profileImg,
    };
  }
}
