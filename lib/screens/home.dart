import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_music_clone/provider/provider.dart';
import 'package:youtube_music_clone/screens/player/player.dart';
import 'package:youtube_music_clone/theme/ytm_theme.dart';
import 'package:youtube_music_clone/util/extensions.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with TickerProviderStateMixin {
  final _homeScrollController = ScrollController();
  late final _animatedController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
    animationBehavior: AnimationBehavior.preserve,
  );

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(navigationProvider);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _homeScrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            floating: true,
            pinned: false,
            leading: Container(
              margin: const EdgeInsets.all(4.0),
              width: 150,
              color: Colors.red,
            ),
            leadingWidth: 150,
            actions: [
              IconButton(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.all(4.0),
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.all(4.0),
                icon: const CircleAvatar(
                  radius: 14,
                  backgroundColor: YTMTheme.greyColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Container(
                //   height: 200,
                //   color: Colors.yellow,
                // ),
                // Container(
                //   height: 200,
                //   color: Colors.yellow,
                // ),
                // Container(
                //   height: 200,
                //   color: Colors.yellow,
                // ),
                // Container(
                //   height: 200,
                //   color: Colors.yellow,
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: SafeArea(
        child: BottomSheet(
          animationController: _animatedController,
          onDragStart: (d) {},
          constraints: BoxConstraints(
            maxHeight: context.screenHeight,
            minHeight: kBottomNavigationBarHeight + 4,
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 0.0,
          enableDrag: true,
          backgroundColor: Colors.blue,
          onClosing: () {},
          builder: (context) {
            return const Player();
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        elevation: 0.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          currentIndex: 0,
          backgroundColor: YTMTheme.greyColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined),
              activeIcon: Icon(Icons.library_music),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              activeIcon: Icon(Icons.play_circle),
              label: 'Upgrade',
            ),
          ],
        ),
      ),
    );
  }
}
