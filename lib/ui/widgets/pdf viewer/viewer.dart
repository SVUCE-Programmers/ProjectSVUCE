import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svuce_app/ui/widgets/pdf%20viewer/page.dart';
import 'package:svuce_app/ui/widgets/pdf%20viewer/tooltip.dart';

import 'document.dart';

enum IndicatorPosition { topLeft, topRight, bottomLeft, bottomRight }

class PDFViewer extends StatefulWidget {
  final PDFDocument document;
  final Color indicatorText;
  final Color indicatorBackground;
  final Color pickerButtonColor;
  final Color pickerIconColor;
  final IndicatorPosition indicatorPosition;
  final bool showIndicator;
  final bool showPicker;
  final bool showNavigation;
  final PDFViewerTooltip tooltip;
  final bool enableSwipeNavigation;
  final Axis scrollDirection;
  final bool lazyLoad;
  final PageController controller;
  final int zoomSteps;
  final double minScale;
  final double maxScale;
  final double panLimit;
  final ValueChanged<int> onPageChanged;

  final Widget Function(
    BuildContext,
    int pageNumber,
    int totalPages,
    void Function({int page}) jumpToPage,
    void Function({int page}) animateToPage,
  ) navigationBuilder;
  final Widget progressIndicator;

  PDFViewer({
    Key key,
    @required this.document,
    this.scrollDirection,
    this.lazyLoad = true,
    this.indicatorText = Colors.white,
    this.indicatorBackground = Colors.black54,
    this.showIndicator = true,
    this.showPicker = true,
    this.showNavigation = true,
    this.enableSwipeNavigation = true,
    this.tooltip = const PDFViewerTooltip(),
    this.navigationBuilder,
    this.controller,
    this.indicatorPosition = IndicatorPosition.topRight,
    this.zoomSteps,
    this.minScale,
    this.maxScale,
    this.panLimit,
    this.progressIndicator,
    this.pickerButtonColor,
    this.pickerIconColor,
    this.onPageChanged,
  }) : super(key: key);

  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  bool _isLoading = true;
  int _pageNumber;
  bool _swipeEnabled = true;
  List<PDFPage> _pages;
  PageController _pageController;
  final Duration animationDuration = Duration(milliseconds: 200);
  final Curve animationCurve = Curves.easeIn;

  @override
  void initState() {
    super.initState();
    _pages = List.filled(widget.document.count, null);
    _pageController = widget.controller ?? PageController();
    _pageNumber = _pageController.initialPage + 1;
    if (!widget.lazyLoad)
      widget.document.preloadPages(
        onZoomChanged: onZoomChanged,
        zoomSteps: widget.zoomSteps,
        minScale: widget.minScale,
        maxScale: widget.maxScale,
        panLimit: widget.panLimit,
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageNumber = _pageController.initialPage + 1;
    _isLoading = true;
    _pages = List.filled(widget.document.count, null);
    // _loadAllPages();
    _loadPage();
  }

  @override
  void didUpdateWidget(PDFViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  onZoomChanged(double scale) {
    if (scale != 1.0) {
      setState(() {
        _swipeEnabled = false;
      });
    } else {
      setState(() {
        _swipeEnabled = true;
      });
    }
  }

  _loadPage() async {
    if (_pages[_pageNumber - 1] != null) return;
    setState(() {
      _isLoading = true;
    });
    final data = await widget.document.get(
      page: _pageNumber,
      onZoomChanged: onZoomChanged,
      zoomSteps: widget.zoomSteps,
      minScale: widget.minScale,
      maxScale: widget.maxScale,
      panLimit: widget.panLimit,
    );
    _pages[_pageNumber - 1] = data;
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _animateToPage({int page}) {
    _pageController.animateToPage(page != null ? page : _pageNumber - 1,
        duration: animationDuration, curve: animationCurve);
  }

  Widget _drawIndicator() {
    Widget child = GestureDetector(
        onTap:
            widget.showPicker && widget.document.count > 1 ? _pickPage : null,
        child: Container(
            padding:
                EdgeInsets.only(top: 4.0, left: 16.0, bottom: 4.0, right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: widget.indicatorBackground),
            child: Text("$_pageNumber/${widget.document.count}",
                style: TextStyle(
                    color: widget.indicatorText,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400))));

    switch (widget.indicatorPosition) {
      case IndicatorPosition.topLeft:
        return Positioned(top: 20, left: 20, child: child);
      case IndicatorPosition.topRight:
        return Positioned(top: 20, right: 20, child: child);
      case IndicatorPosition.bottomLeft:
        return Positioned(bottom: 20, left: 20, child: child);
      case IndicatorPosition.bottomRight:
        return Positioned(bottom: 20, right: 20, child: child);
      default:
        return Positioned(top: 20, right: 20, child: child);
    }
  }

  _pickPage() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.all(8),
              title: Text('Drag slider to change page number '),
              content: StatefulBuilder(
                builder: (context, setState) => Container(
                  height: 100,
                  child: Slider(
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor:
                        Theme.of(context).primaryColor.withOpacity(0.3),
                    value: _pageNumber.toDouble(),
                    max: widget.document.count.toDouble(),
                    onChanged: (v) {
                      setState(() {
                        _pageNumber = v.toInt();
                        _animateToPage();
                      });
                    },
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 'move':
                      _pickPage();
                      break;
                    case 'std':
                      _animateToPage(page: widget.document.count);
                      break;
                    case 'stt':
                      _animateToPage(page: 0);
                      break;
                    case 'rotate':
                      if (MediaQuery.of(context).orientation ==
                          Orientation.landscape) {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);
                      } else {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.landscapeLeft]);
                      }

                      break;
                    default:
                  }
                },
                padding: const EdgeInsets.all(0),
                itemBuilder: (_) => [
                      PopupMenuItem<String>(
                          child: ListTile(
                            leading: Icon(Icons.swap_horiz),
                            horizontalTitleGap: 0.0,
                            dense: true,
                            title: Text(
                              "Move To",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          value: 'move'),
                      PopupMenuItem<String>(
                          child: ListTile(
                            leading: Icon(Icons.arrow_circle_down),
                            horizontalTitleGap: 0.0,
                            dense: true,
                            title: Text(
                              "Scroll To Down",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          value: 'std'),
                      PopupMenuItem<String>(
                          child: ListTile(
                            leading: Icon(Icons.arrow_circle_up),
                            horizontalTitleGap: 0.0,
                            title: Text(
                              'Scroll to Top',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            dense: true,
                          ),
                          value: 'stt'),
                      PopupMenuItem<String>(
                          child: ListTile(
                            leading: Icon(Icons.rotate_90_degrees_ccw),
                            horizontalTitleGap: 0.0,
                            dense: true,
                            title: Text(
                              "Rotate",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          value: 'rotate'),
                      PopupMenuItem<String>(
                          child: ListTile(
                            leading: Icon(Icons.arrow_circle_up),
                            horizontalTitleGap: 0.0,
                            title: Text(
                              'Scroll to Top',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            dense: true,
                          ),
                          value: 'stt'),
                    ])
          ],
        ),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              physics:
                  _swipeEnabled && widget.enableSwipeNavigation && !_isLoading
                      ? null
                      : NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  _pageNumber = page + 1;
                });
                _loadPage();
                widget.onPageChanged?.call(page);
              },
              scrollDirection: widget.scrollDirection ?? Axis.horizontal,
              controller: _pageController,
              itemCount: _pages?.length ?? 0,
              itemBuilder: (context, index) => _pages[index] == null
                  ? Center(
                      child: widget.progressIndicator ??
                          CircularProgressIndicator(),
                    )
                  : _pages[index],
            ),
            (widget.showIndicator && !_isLoading)
                ? _drawIndicator()
                : Container(),
          ],
        ),
      ),
    );
  }
}
