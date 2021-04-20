import 'package:flutter/material.dart';

/// Base screen
class ScreenWidget extends StatelessWidget {
  /// Constructor
  const ScreenWidget(
      {Key key,
        this.body,
        this.backgroundColor,
        this.bottomNavigationBar,
        this.unfocus,
        this.isShowBackground})
      : super(key: key);

  /// `body` a child widget as body
  final Widget body;
  /// `backgroundColor` to define full color of background
  final Color backgroundColor;
  /// `bottomNavigationBar` a bottom navigation bar
  final Widget bottomNavigationBar;
  /// `unfocus` remove focus of any childs
  final Function() unfocus;
  /// `isShowBackground` condition to show or hide background color
  final bool isShowBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (unfocus != null) {
          unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor ?? Colors.white,
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          top: true,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: body),
        )
      ),
    );
  }
}
