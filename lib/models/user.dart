class User {
  final String fullName;
  final String id;
  final String email;
  final String userType;

  User({this.fullName, this.id, this.email, this.userType});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        fullName = data['fullName'],
        userType = data['userType'];

  Map<String, String> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "userType": userType,
    };
  }
}
