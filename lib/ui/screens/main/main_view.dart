import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/drawer/drawer_view.dart';

import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<MainViewModel>(
      viewModel: MainViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text(
              "Home",
              style:
                  uiHelpers.title.copyWith(color: uiHelpers.textPrimaryColor),
            ),
          ),
          endDrawer: DrawerView(),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 20.0),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: model.getGreeting(),
                            style: uiHelpers.body.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text: "\n" + model.name ?? "",
                            style: uiHelpers.body.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: uiHelpers.textPrimaryColor),
                          )
                        ],
                      ),
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          uiHelpers.scalingHelper.size(80)),
                      child: model.userImage != null
                          ? Image.network(model.userImage,
                              fit: BoxFit.cover, width: 40, height: 40)
                          : SizedBox(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                        color: uiHelpers.surfaceColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 200,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    trailing: TextButton(
                      onPressed: () => model.navigateToTimeTable(),
                      child: Text(
                        "View More",
                        style: uiHelpers.body
                            .copyWith(color: uiHelpers.primaryColor),
                      ),
                    ),
                    title: Text(
                      "Today\'s Classes",
                      style: uiHelpers.title,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        height: 80,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "9:30Am -10:30Am",
                              style: uiHelpers.body,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Discrete Mathematics",
                              style: uiHelpers.title,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: uiHelpers.surfaceColor,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
