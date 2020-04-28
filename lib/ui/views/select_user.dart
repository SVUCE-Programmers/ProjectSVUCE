import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/constants/assets.dart';
import 'package:svuce_app/ui/responsive/view.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/viewmodels/select_user_viewmodel.dart';

class SelectUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SelectUserViewModel>.withoutConsumer(
        viewModel: SelectUserViewModel(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: model.onWillPop,
              child: ResponsiveView(
                builder: (context, designInfo) => Scaffold(
                  backgroundColor: revampBG,
                  body: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Welcome\n",
                            style: designInfo.scaleOne,
                          ),
                          TextSpan(
                            text: "\nPlease select the user type to \ncontinue",
                            style: designInfo.scaleTwo
                                .apply(color: revampSecondary),
                          ),
                        ])),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20.0),
                            child: Image.asset(
                              onboarding,
                              fit: BoxFit.fitWidth,
                              height: designInfo.blockSizeHorizontal * 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        WidgetWrapper(
                          decoration: buttonDecoration.copyWith(color: primary),
                          child: FlatButton.icon(
                              onPressed: () {
                                model.gotoStudentlogin();
                              },
                              icon: Icon(
                                FontAwesome5Solid.graduation_cap,
                                color: secondaryDark,
                              ),
                              label: Text(
                                "\t\tI\'m a Student",
                                style: designInfo.scaleTwo
                                    .apply(color: secondaryDark),
                              )),
                        ),
                        WidgetWrapper(
                          decoration: buttonDecoration,
                          child: FlatButton.icon(
                              onPressed: () {
                                model.gotoTeacherLogin();
                              },
                              icon: Icon(
                                FontAwesome5Solid.chalkboard_teacher,
                                color: primary,
                              ),
                              splashColor: primary,
                              label: Text(
                                "\t\tI\'m a Teacher",
                                style:
                                    designInfo.scaleTwo.apply(color: primary),
                              )),
                        ),
                        WidgetWrapper(
                          decoration: BoxDecoration(
                            color: secondaryLight,
                            border:
                                Border.all(color: secondaryLight, width: 3.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FlatButton.icon(
                              splashColor: secondaryLight,
                              onPressed: () {
                                model.signInAsGuest();
                              },
                              icon: Icon(
                                FontAwesome.user,
                                color: textPrimary,
                              ),
                              label: Text(
                                "\tI\'m a Guest",
                                style: designInfo.scaleTwo
                                    .apply(color: textPrimary),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
