import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/onboard%20screens/onboard_view_model.dart';
import 'package:svuce_app/ui/utils/animatedText.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<OnBoardViewModel>(
        builder: (context, uiHelpers, model) => Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 40,
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  MaterialButton(
                    onPressed: model.handleNextAction,
                    child: AnimatedSwitcher(
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      switchInCurve: Curves.easeInOutCubic,
                      switchOutCurve: Curves.easeOutCubic,
                      duration: Duration(milliseconds: 454),
                      child: model.index < model.titles.length - 1
                          ? Text(
                              "Next",
                              key: UniqueKey(),
                              style: uiHelpers.title,
                            )
                          : Text(
                              "Go to Login",
                              key: UniqueKey(),
                              style: uiHelpers.title,
                            ),
                    ),
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      onPageChanged: model.changeIndex,
                      controller: model.pageController,
                      itemBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: LottieBuilder.asset(
                                  model.lottieAssets[index],
                                  alignment: Alignment.bottomCenter,
                                )),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                        horizontal: uiHelpers.width * 0.08)
                                    .copyWith(top: 25),
                                child: Column(
                                  children: [
                                    AnimatedText(
                                      delay: 0.75,
                                      data: "${model.titles[index]}",
                                      style: uiHelpers.headline,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    AnimatedText(
                                      delay: 1.2,
                                      data: "${model.description[index]}",
                                      style: uiHelpers.body,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: model.lottieAssets.length,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          model.titles.length,
                          (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 750),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: model.index == index ? 5 : 5,
                                width: model.index == index ? 25 : 10,
                                decoration: BoxDecoration(
                                    // shape: model.index == index
                                    //     ? BoxShape.rectangle
                                    //     : BoxShape.circle,
                                    color: model.index == index
                                        ? uiHelpers.primaryColor
                                        : uiHelpers.textSecondaryColor),
                              )),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
        viewModel: OnBoardViewModel());
  }
}
