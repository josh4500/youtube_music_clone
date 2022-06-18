import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  static final navigatorKey = GlobalKey<NavigatorState>();
  //////////////////////////////////////////////////////////////////////////////
  ///Player State
  ///
  bool _isPlayerOpen = false;
  bool get isPlayerOpen => _isPlayerOpen;
  final double _playerBottomPosition = kBottomNavigationBarHeight;
  double get playerBottomPosition => _playerBottomPosition;
  final double _playerHeight = kBottomNavigationBarHeight;
  double get playerHeight => _playerHeight;
  final double _playerAlbumSize = kBottomNavigationBarHeight;
  double get playerAlbumSize => _playerAlbumSize;

  void setPlayerOpen(bool value) {
    _isPlayerOpen = value;
    notifyListeners();
  }

  ///
  //////////////////////////////////////////////////////////////////////////////
}
