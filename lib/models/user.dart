class User {
  final String fullName;
  final String id;
  final String email;
  final String rollNo;
  final String bio;
  final String contact;
  final String collegeName;
  final String profileImg;
  final String userType;

  User(
      {this.fullName,
      this.id,
      this.email,
      this.userType,
      this.rollNo,
      this.bio,
      this.contact,
      this.collegeName,
      this.profileImg});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        rollNo = data['rollNo'],
        fullName = data['fullName'],
        profileImg = data['profileImg'],
        collegeName = data['collegeName'],
        bio = data['bio'],
        contact = data['contact'],
        userType = data['userType'];

  Map<String, String> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "userType": userType,
      "rollNo": rollNo,
      "profileImg": profileImg,
      "collegeName": collegeName,
      "bio": bio,
      "contact": contact,
    };
  }
}
