import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/core/utils/modal_hud.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/utils/connectivity_widget.dart';

class ScreenBuilder<T extends BaseViewModel> extends StatelessWidget {
  final bool disposeViewModel;
  final bool isReactive;
  final Widget Function(BuildContext, UiHelpers, T) builder;
  final T viewModel;
  final Function(T) onModelReady;
  final bool enableConnectionStream;
  final String appTitle;
  final bool showLoadingOnBusy;

  ScreenBuilder(
      {Key key,
      @required this.builder,
      this.appTitle = "Svuce",
      @required this.viewModel,
      this.enableConnectionStream=false,
      this.disposeViewModel = false,
      this.onModelReady,
      this.showLoadingOnBusy = true,
      this.isReactive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: appTitle,
      primaryColor: Theme.of(context).primaryColor.value,
    ));
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    if (isReactive) {
      return ConnectivityWidget(
        onOnlineBack: enableConnectionStream,
        childWidget: ViewModelBuilder<T>.reactive(
            builder: (context, model, child) {
              if (model.isBusy && showLoadingOnBusy) {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }
              return showLoadingOnBusy
                  ? IgnorePointer(
                      ignoring: model.isBusy && showLoadingOnBusy,
                      child: SafeArea(
                          child: ModalHud(
                        child: builder(context, uiHelpers, model),
                        isLoading: model.isBusy,
                      )))
                  : SafeArea(child: builder(context, uiHelpers, model));
            },
            disposeViewModel: disposeViewModel ?? true,
            onModelReady: onModelReady,
            viewModelBuilder: () => viewModel),
      );
    } else {
      return ViewModelBuilder<T>.nonReactive(
          builder: (context, model, child) => IgnorePointer(
              ignoring: model.isBusy && showLoadingOnBusy,
              child: SafeArea(child: builder(context, uiHelpers, model))),
          disposeViewModel: disposeViewModel ?? true,
          onModelReady: onModelReady ?? null,
          viewModelBuilder: () => viewModel);
    }
  }
}
