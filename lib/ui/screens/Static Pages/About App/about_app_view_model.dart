import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';

class AboutAppViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Map<String, dynamic> technologiesList = {
    "Flutter": FlutterLogo(
      size: 80,
    ),
    "Firebase":
        "https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png",
    "One Signal":
        "https://onesignal-blog.s3.amazonaws.com/2018/Aug/onesignal-1534463753064.png",
    "Figma":
        "https://i.pinimg.com/originals/17/06/c9/1706c9f16bd08eb5e03f1df3e0a94a1c.png",
  };
  List<Map<String, String>> teamList = [
    {
      "name": "B.Shashi Kumar",
      "image":
          "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Team/shashi.jpg",
      "urlLink": "",
      "role": "App Developer"
    },
    {
      "name": "C V.Prakash Reddy",
      "image":
          "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Team/prakash.jpeg",
      "urlLink": "",
      "role": "Backend Developer"
    },
    {
      "name": "D.Niharika",
      "image":
          "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Team/niharika.png",
      "urlLink": "",
      "role": "UI Designer"
    },
    {
      "name": "Mohan",
      "urlLink": "",
      "image":
          "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Team/mohan.png",
      "role": "UX Designer"
    }
  ];
  Map<String, String> hkData = {
    "name": "Dr Humera Khanam",
    "urlLink": "",
    "image":
        "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Team/humera_khanam.jpeg",
    "role": "Mentor"
  };
  //? NavigationService
  navigateBack() {
    _navigationService.back();
  }

  init() {}
}
