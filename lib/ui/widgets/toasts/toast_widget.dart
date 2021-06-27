import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

enum ToastVariant { SUCCESS, ERROR, INFO, WARNING }

class ToastWidget extends StatelessWidget {
  final String title;
  final ToastVariant variant;
  final IconData iconData;
  final String description;

  const ToastWidget({
    Key key,
    this.title = "",
    this.variant,
    this.iconData,
    this.description = "",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: uiHelpers.surfaceColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 75,
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 8,
                  decoration: BoxDecoration(
                    color: getLeadingColor(variant),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: getIcon(variant),
                  decoration: BoxDecoration(
                      color: getLeadingColor(variant), shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: uiHelpers.title.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: uiHelpers.body.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon getIcon(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.SUCCESS:
        return Icon(
          FlutterIcons.check_fea,
          color: Colors.white,
          size: 15,
        );
      case ToastVariant.WARNING:
        return Icon(
          FlutterIcons.warning_ent,
          color: Colors.white,
          size: 15,
        );
      case ToastVariant.ERROR:
        return Icon(
          FlutterIcons.error_outline_mdi,
          color: Colors.white,
          size: 15,
        );
      case ToastVariant.INFO:
        return Icon(
          FlutterIcons.info_fea,
          color: Colors.white,
          size: 15,
        );
      default:
        return Icon(
          FlutterIcons.info_fea,
          color: Colors.white,
          size: 15,
        );
    }
  }

  Color getLeadingColor(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.SUCCESS:
        return Colors.green;
      case ToastVariant.WARNING:
        return Colors.orange[400];
      case ToastVariant.ERROR:
        return Colors.red;
      case ToastVariant.INFO:
        return Colors.orangeAccent;
      default:
        return Colors.purple;
    }
  }
}
