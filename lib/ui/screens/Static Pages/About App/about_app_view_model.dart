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
          "https://media-exp1.licdn.com/dms/image/C5603AQEgY9OTq5ZNwQ/profile-displayphoto-shrink_800_800/0/1620666120685?e=1627516800&v=beta&t=RqxX0dBC8f8f2_eb3vLLVF5VJUiMnqks3E8Enocidt4",
      "urlLink": "",
      "role": "App Developer"
    },
    {
      "name": "C V.Prakash Reddy",
      "image":
          "https://scontent.fpnq13-1.fna.fbcdn.net/v/t1.6435-9/34822149_2230498097180963_2703025976836620288_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=e3f864&_nc_ohc=UuGvrTsTLGsAX850BfU&_nc_ht=scontent.fpnq13-1.fna&oh=53c53ca94bcab6a51f338e8dadd67b62&oe=60CFF98F",
      "urlLink": "",
      "role": "Backend Developer"
    },
    {
      "name": "D.Niharika",
      "image":
          "https://scontent.fpnq13-1.fna.fbcdn.net/v/t1.18169-9/23755389_136589117001115_4491797434067482872_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=_ISEckVyewwAX9CRxCP&_nc_ht=scontent.fpnq13-1.fna&oh=56e3ae0082ef8450ae24cb3c140c95f1&oe=60D28F5F",
      "urlLink": "",
      "role": "UI Designer"
    },
    {
      "name": "Mohan",
      "urlLink": "",
      "image": "https://avatars.githubusercontent.com/u/21126965?v=4",
      "role": "UX Designer"
    }
  ];
  Map<String, String> hkData = {
    "name": "Dr Humera Khanam",
    "urlLink": "",
    "image": "https://svuniversity.edu.in/ShowImagefeda.jpg?ProductPhotoID=373",
    "role": "Mentor"
  };
  //? NavigationService
  navigateBack() {
    _navigationService.back();
  }

  init() {}
}
