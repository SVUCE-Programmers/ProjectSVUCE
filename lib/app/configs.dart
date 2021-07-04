mixin Configs {
  static const String headlineFont = "Quicksand";
  static const String titleFont = "Quicksand";
  static const String bodyFont = "Quicksand";
}
mixin ApiKeys {}

mixin Validators {
  static String validatePassword(value) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "Password should be atleast of length 6.";
    }
    return null;
  }
}
mixin UrlConfigs {
  static const staffJsonUrl =
      "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Database/Staff%20Data/staff.json";
}
