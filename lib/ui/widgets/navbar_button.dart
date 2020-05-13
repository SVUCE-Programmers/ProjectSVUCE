import 'dart:core';

import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/models/home_view_item.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/rotation.dart';

class NavbarButton extends StatefulWidget {
  final HomeViewItem data;
  final bool isSelected;
  final VoidCallback onTap;

  const NavbarButton(this.data, this.isSelected, {@required this.onTap});

  @override
  _NavbarButtonState createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimController;
  bool _wasSelected;
  double _animScale = 1;

  @override
  void initState() {
    int duration = (350 / _animScale).round();
    _iconAnimController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    Tween<double>(begin: 0, end: 1).animate(_iconAnimController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _startAnimIfSelectedChanged(widget.isSelected);

    final uiHelpers = UIHelpers.fromContext(context);

    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 4, left: 4),
        child: AnimatedContainer(
            alignment: Alignment.center,
            width: widget.isSelected
                ? uiHelpers.blockSizeHorizontal * widget.data.scaleRatio
                : uiHelpers.blockSizeHorizontal * 15,
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.all(1),
            duration: Duration(milliseconds: (700 / _animScale).round()),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? primaryColor.withOpacity(0.3)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: BottomBarContent(
                iconAnimController: _iconAnimController,
                widget: widget,
                uiHelpers: uiHelpers,
              ),
            )),
      ),
    );
  }

  void _startAnimIfSelectedChanged(bool isSelected) {
    if (_wasSelected != widget.isSelected) {
      widget.isSelected
          ? _iconAnimController.forward()
          : _iconAnimController.reverse();
    }
    _wasSelected = widget.isSelected;
  }
}

class BottomBarContent extends StatelessWidget {
  const BottomBarContent({
    Key key,
    @required AnimationController iconAnimController,
    @required this.widget,
    this.uiHelpers,
  })  : _iconAnimController = iconAnimController,
        super(key: key);

  final AnimationController _iconAnimController;
  final NavbarButton widget;
  final UIHelpers uiHelpers;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Rotation3d(
          rotationY: 180 * _iconAnimController.value,
          child: Icon(
            widget.isSelected
                ? widget.data.activeIcon
                : widget.data.inactiveIcon,
            size: 20,
            color: widget.isSelected ? primaryColor : textSecondaryColor,
          ),
        ),
        SizedBox(
          width: uiHelpers.blockSizeHorizontal,
        ),
        widget.isSelected
            ? Text(
                widget.data.title,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: primaryColor),
              )
            : SizedBox(),
      ],
    );
  }
}
