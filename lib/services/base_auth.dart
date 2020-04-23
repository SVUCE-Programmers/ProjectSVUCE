abstract class BaseAuth {
  Future createStudent(
      {String email, String password, String fullName, String rollNo});
  Future<bool> isUserLoggedIn();
  Future signOut();
  Future loginUser({String email, String password});
}
