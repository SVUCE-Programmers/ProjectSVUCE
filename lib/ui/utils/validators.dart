String validateEmail(String email) {
  RegExp reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (!reg.hasMatch(email)) {
    return 'Please enter a valid email';
  } else if (email.length < 5) {
    return 'Your email must be atleast 6';
  }
  return null;
}

String validatePassword(String password) {
  if (password.isEmpty) {
    return 'Please Enter Your Password';
  } else if (password.length < 5) {
    return 'Your password must be atleast 6';
  }
  return null;
}
