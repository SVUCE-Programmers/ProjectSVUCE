import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/widgets/custom_clipper.dart';
import 'package:svuce_app/ui/widgets/signup_pages.dart';
import 'package:svuce_app/viewmodels/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
        viewModel: SignUpViewModel(),
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: secondaryDark,
            bottomNavigationBar: FlatButton(
              splashColor: secondaryLight,
              onPressed: model.gotoLogin,
              child: Text(
                "Already have an account? Login",
                style: bodyText.apply(color: primary),
              ),
            ),
            body: Stack(fit: StackFit.expand, children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: primary,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: 'Create\nAccount', style: heading),
                ])),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 150),
                child: IndexedStack(
                  index: model.currentIndex,
                  children:
                      [pageOne(model), pageTwo(model, context)].map((widget) {
                    return Center(
                      child: widget,
                    );
                  }).toList(),
                ),
              ),
            ])));
  }
}
