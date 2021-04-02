
import 'package:flutter/material.dart';


class ScreenWidget extends StatelessWidget {
  const ScreenWidget(
      {Key key,
        this.body,
        this.backgroundColor,
        this.bottomNavigationBar,
        this.unFocus,
        this.isShowBackground})
      : super(key: key);

  final Widget body;
  final Color backgroundColor;
  final Widget bottomNavigationBar;
  final Function() unFocus;
  final bool isShowBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (unFocus != null) {
          unFocus();
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
