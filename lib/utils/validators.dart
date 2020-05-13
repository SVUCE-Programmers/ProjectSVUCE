class Validators {
  static String validateName(String name) {
    RegExp reg = new RegExp(r"^[a-zA-Z ]{6,}$");
    if (name.isEmpty) {
      return "Please Enter your name";
    } else if (!reg.hasMatch(name)) {
      return "Enter a valid name";
    }
    return null;
  }

  static String validateEmail(String email) {
    RegExp reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!reg.hasMatch(email)) {
      return 'Please enter a valid email';
    } else if (email.length < 5) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please Enter Your Password';
    } else if (password.length < 6) {
      return 'Your password must be atleast 6';
    } 
    return null;
  }

  static String validateRollNo(String rollNo) {
    RegExp regExp = new RegExp(r'^1[0-9]{3}[1-6]{1}[0-9]{3}$');
    if (rollNo.isEmpty) {
      return 'Please enter your rollno.';
    } else if (!regExp.hasMatch(rollNo) || rollNo.length < 8) {
      return 'Please enter a valid rollno.';
    } else {
      return null;
    }
  }

  static String validatePhoneNo(String phone) {
    RegExp regex = new RegExp(r"^[0-9]{10}$");
    if (phone.isEmpty) {
      return "Please enter your contact details";
    } else if (!regex.hasMatch(phone)) {
      return "Please enter a valid number";
    } else {
      return null;
    }
  }
}
