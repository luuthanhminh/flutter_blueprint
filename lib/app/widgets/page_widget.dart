import 'package:flutter/material.dart';

/// Base screen
class PageWidget extends StatelessWidget {
  /// Constructor
  const PageWidget(
      {Key? key,
      this.body,
      this.backgroundColor = Colors.white,
      this.bottomNavigationBar,
      this.unfocus,
      this.appBar})
      : super(key: key);

  /// `body` a child widget as body
  final Widget? body;

  /// `backgroundColor` to define full color of background
  final Color backgroundColor;

  /// `bottomNavigationBar` a bottom navigation bar
  final Widget? bottomNavigationBar;

  /// `unfocus` remove focus of any childs
  final Function? unfocus;

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (unfocus != null) {
          unfocus!();
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          bottomNavigationBar: bottomNavigationBar,
          appBar: appBar,
          body: SafeArea(
            top: true,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: body),
          )),
    );
  }
}
