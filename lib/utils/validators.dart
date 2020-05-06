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

String validateRollNo(String rollNo) {
  RegExp regExp = new RegExp(r'^1[0-9]{3}[1-6]{1}[0-9]{3}$');
  if (rollNo.isEmpty) {
    return 'Please enter your rollno.';
  } else if (!regExp.hasMatch(rollNo) || rollNo.length < 8) {
    return 'Please enter a valid rollno.';
  } else {
    return null;
  }
}

//TODO: Add name and contact validator
