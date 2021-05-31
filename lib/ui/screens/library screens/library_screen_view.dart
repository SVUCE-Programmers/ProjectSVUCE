import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/library%20screens/library_items.dart';
import 'package:svuce_app/ui/screens/library%20screens/library_screen_view_model.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<LibraryScreenViewModel>(
      viewModel: LibraryScreenViewModel(),
      builder: (_, uiHelpers, model) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (uiHelpers.width * 0.5) / 100,
                      mainAxisSpacing: 40,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => libraryItems[index],
                  itemCount: libraryItems.length,
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Library",
            style: uiHelpers.headline,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              ),
              onPressed: () => model.navigateBack()),
        ),
      ),
    );
  }
}
