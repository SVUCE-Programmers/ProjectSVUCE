import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/Club%20Details%20Page/club_details_view_model.dart';

class ClubDetaislPageView extends StatelessWidget {
  final Club club;

  const ClubDetaislPageView({Key key, @required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ClubDetailsViewModel>(
      viewModel: ClubDetailsViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 270,
                child: Stack(
                  children: [
                    FadeInImage(
                        placeholder: AssetImage("assets/images/logo.png"),
                        height: 200,
                        width: uiHelpers.width,
                        fit: BoxFit.fill,
                        image: NetworkImage(club.clubBanner)),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Hero(
                        tag: "Club Logo",
                        child: FadeInImage(
                            placeholder: AssetImage("assets/images/logo.png"),
                            height: 120,
                            width: uiHelpers.width * 0.3,
                            fit: BoxFit.fill,
                            image: NetworkImage(club.clubLogo)),
                      ),
                    ),
                    Positioned(
                      child: Text(
                        club.name,
                        style: uiHelpers.headline,
                      ),
                      bottom: 20,
                      left: uiHelpers.width * 0.3 + 20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 25),
                child: Column(
                  children: [
                    Text(
                      "Motto",
                      style: uiHelpers.title,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(club.moto, style: uiHelpers.body),
                    uiHelpers.verticalSpaceLow,
                    Text(
                      "Description",
                      style: uiHelpers.title,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(club.description, style: uiHelpers.body),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Hero(
            tag: "Back Button",
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(backIcon, color: uiHelpers.textPrimaryColor),
                  onPressed: model.navigateBack),
            ),
          ),
          title: Text(
            "${club.name}",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
