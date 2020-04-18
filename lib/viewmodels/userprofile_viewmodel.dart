import 'package:firebase_auth/firebase_auth.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class UserProfileViewModel extends BaseModel{
   Future<String> getCurrentUser() async{
    return (await FirebaseAuth.instance.currentUser()).uid;
  }
}