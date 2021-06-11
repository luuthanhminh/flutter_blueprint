import 'package:flutter/material.dart';

/// Build simple navigation bar
///
/// * `title` is tile widget
/// * `leadingIcon` is left icon on the bar
/// * `hasDivider` show or hide default divider
/// * `leadingTapped` callback when tapping on leading icon
AppBar buildNavigationBar(
    {Widget? title,
    Widget? leadingIcon,
    bool hasDivider = true,
    required VoidCallback? leadingTapped}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
        padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
        icon: leadingIcon ?? Icon(Icons.arrow_back),
        onPressed: leadingTapped),
    title: title ?? Container(),
    elevation: 0,
  );
}
