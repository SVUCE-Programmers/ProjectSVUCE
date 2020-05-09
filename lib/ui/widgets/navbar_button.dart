import 'dart:core';

import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/widgets/bottom_navigation.dart';
import 'package:svuce_app/ui/widgets/rotation.dart';


class NavbarButton extends StatefulWidget {
  final BarItem data;
  final bool isSelected;
  final VoidCallback onTap;

  const NavbarButton(this.data, this.isSelected, {@required this.onTap });

  @override
  _NavbarButtonState createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> with SingleTickerProviderStateMixin {
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
    var content = 
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Rotation3d(
          rotationY: 180 * _iconAnimController.value,
          child: Icon(
            widget.data.iconData,
            size: 20,
            color: widget.isSelected ? primaryColor : Colors.white,
          ),
        ),
        SizedBox(width: 10),
        widget.isSelected?Text(
          widget.data.text,
          style: TextStyle(color: primaryColor, fontFamily: "Quicksand",fontSize: 10),
        ):SizedBox(),
      ],
    );

    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 4, left: 4),
        child: AnimatedContainer(
          alignment: Alignment.center,
          width: widget.isSelected ? widget.data.width : 56,
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.all(1),
          duration: Duration(milliseconds: (700 / _animScale).round()),
          decoration: BoxDecoration(
            color: widget.isSelected ? primaryColor.withOpacity(0.3) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: content,
          )
        ),
      ),
    );
  }

  void _startAnimIfSelectedChanged(bool isSelected) {
    if (_wasSelected != widget.isSelected) {
      widget.isSelected ? _iconAnimController.forward() : _iconAnimController.reverse();
    }
    _wasSelected = widget.isSelected;
  }
}