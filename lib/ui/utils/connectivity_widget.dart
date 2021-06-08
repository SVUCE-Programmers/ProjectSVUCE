import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/connectivity%20service/connectivity_services.dart';
import 'package:svuce_app/ui/widgets/offline_widget.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget childWidget;
  final bool onOnlineBack;

  const ConnectivityWidget(
      {Key key, @required this.childWidget, this.onOnlineBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConenctivityWidgetViewModel>.reactive(
        onModelReady: (m) => m.listenConnectionStatus(),
        viewModelBuilder: () => ConenctivityWidgetViewModel(),
        builder: (context, model, child) => (model.isOnline)
            ? childWidget
            : onOnlineBack
                ? OfflineWidget()
                : childWidget);
  }
}

class ConenctivityWidgetViewModel extends BaseViewModel {
  bool isOnline = true;
  final ConnectivityServices _connectivityServices =
      locator<ConnectivityServices>();
  listenConnectionStatus() {
    _connectivityServices.listenStream().listen((event) {
      isOnline = event;
      if (isOnline) {}
      notifyListeners();
    });
  }
}
