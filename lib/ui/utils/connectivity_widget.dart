import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/connectivity%20service/connectivity_services.dart';
import 'package:svuce_app/ui/widgets/offline_widget.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget childWidget;
  final bool showOnline;

  const ConnectivityWidget(
      {Key key, @required this.childWidget, this.showOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConenctivityWidgetViewModel>.reactive(
        onModelReady: (m) => m.init(),
        viewModelBuilder: () => ConenctivityWidgetViewModel(),
        builder: (context, model, child) => Scaffold(
              body: !showOnline
                  ? childWidget
                  : model.hasNetwork
                      ? childWidget
                      : OfflineWidget(),
            ));
  }
}

class ConenctivityWidgetViewModel extends BaseViewModel {
  final log = getLogger('Connectivty View Model');
  bool hasNetwork = true;
  final ConnectivityServices _connectivityServices =
      locator<ConnectivityServices>();

  init() {
    _connectivityServices.listenStream().listen((event) {
      hasNetwork = event;
      notifyListeners();
    });
  }
}
