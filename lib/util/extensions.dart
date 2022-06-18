import 'package:flutter/material.dart';

extension BuildContexthelper on BuildContext {
  /// Returns the [Size] of the screen.
  /// This is the size of the screen in pixels, excluding the system UI.
  Size get size => MediaQuery.of(this).size;

  /// Returns the [EdgeInsets] of the screen.
  /// This is the padding of the screen in pixels, excluding the system UI.
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Returns the [TextTheme] of the screen.
  /// This is the text theme of the screen.
  TextTheme get textTheme => Theme.of(this).textTheme;

  ///Returns the height of the status bar.
  ///This is the height of the status bar in pixels.
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  ///Returns the height of the navigation bar.
  ///This is the height of the navigation bar in pixels.
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  ///Returns the height of the screen
  ///This is the height of the screen in pixels.
  double get screenHeight => size.height;

  ///Returns the width of the screen
  ///This is the width of the screen in pixels.
  double get screenWidth => size.width;
}
