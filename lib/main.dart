import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_music_clone/screens/home.dart';

import 'provider/navigation_provider.dart';

void main() {
  runApp(const ProviderScope(child: YTM()));
}

class YTM extends StatelessWidget {
  const YTM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationProvider.navigatorKey,
      home: const Home(),
    );
  }
}
