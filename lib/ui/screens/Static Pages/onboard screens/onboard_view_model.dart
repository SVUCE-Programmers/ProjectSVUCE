import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/ui/screens/login/login_view.dart';

class OnBoardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  PageController pageController = PageController();
  int index = 0;
  changeIndex(int value) {
    index = value;
    notifyListeners();
  }

  List<String> lottieAssets = [
    "assets/lottie/explore.json",
    "assets/lottie/attendance.json",
    "assets/lottie/calendar.json"
  ];
  List<String> titles = [
    "Explore everything",
    "Attendance Manager",
    "Get to know live events"
  ];
  List<String> description = [
    "Get to know what's happening in your college through this app",
    "Use our latest feature to plan your bunks so that you wont get detained",
    "Get to know all events,exams and any special occassions that are happening in your college"
  ];

  handleNextAction() async {
    if (index < titles.length - 1) {
      await pageController.animateToPage(pageController.page.toInt() + 1,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOutQuint);
      changeIndex(pageController.page.toInt());
    } else {
      _navigationService.navigateWithTransition(LoginView(),
          transition: "fade", duration: Duration(milliseconds: 750));
    }
  }
}
