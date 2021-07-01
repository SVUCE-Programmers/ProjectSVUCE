import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:lottie/lottie.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';

class PdfViewerWidget extends StatelessWidget {
  final String url;

  const PdfViewerWidget({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<PdFViewerViewModel>(
      viewModel: PdFViewerViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: uiHelpers.textPrimaryColor,
                ),
                onSelected: (value) {
                  switch (value) {
                    case "Move":
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                backgroundColor: uiHelpers.surfaceColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                contentPadding: const EdgeInsets.all(8),
                                title:
                                    Text('Drag slider to change page number'),
                                content: StatefulBuilder(
                                  builder: (context, setState) => Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: Slider(
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            inactiveColor: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.3),
                                            value:
                                                (model.currentPage).toDouble(),
                                            max: model.pageCount.toDouble(),
                                            onChanged: (v) {
                                              setState(() {
                                                model.moveToDifferentPage(v);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                          " ${model.currentPage}/${model.pageCount} ")
                                    ],
                                  ),
                                ),
                              ));
                      break;
                    default:
                  }
                },
                color: uiHelpers.surfaceColor,
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text("Move to"),
                        value: "Move",
                      )
                    ])
          ],
          leading: IconButton(
              onPressed: model.goBack,
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              )),
          elevation: 0,
          backgroundColor: uiHelpers.backgroundColor,
        ),
        body: Container(
          child: model.pdfViewController == null
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/lottie/loading_resource.json"),
                      Text("Loading Document...", style: uiHelpers.title)
                    ],
                  ),
                )
              : Stack(
                  children: [
                    PDF(
                            onPageChanged: (a, total) {
                              print("$a ,$total");
                              model.changePage(a, total);
                            },
                            pageSnap: true,
                            onRender: (int value) {},
                            fitEachPage: true,
                            autoSpacing: true,
                            onViewCreated: model.assignController)
                        .cachedFromUrl(url),
                    Align(
                      alignment: Alignment.topRight,
                      child: Chip(
                          label: Text(
                              "${model.currentPage + 1}/ ${model.pageCount}")),
                    )
                  ],
                ),
          color: uiHelpers.backgroundColor,
        ),
      ),
    );
  }
}

class PdFViewerViewModel extends BaseViewModel {
  PDFViewController pdfViewController;
  int pageCount = 0;
  int currentPage = 0;
  changePage(int value, int total) {
    currentPage = value;
    pageCount = total;
    notifyListeners();
  }

  moveToDifferentPage(double value) async {
    currentPage = value.toInt();
    await pdfViewController.setPage(value.toInt());
    notifyListeners();
  }

  final NavigationService _navService = locator<NavigationService>();
  goBack() => _navService.back();
  assignController(controller) async {
    pdfViewController = await controller;
    pageCount = await getPageCount();
    notifyListeners();
  }

  getPageCount() async {
    var value = await pdfViewController.getPageCount();
    return value;
  }
}
