import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_music_clone/provider/provider.dart';
import 'package:youtube_music_clone/theme/ytm_theme.dart';
import 'package:youtube_music_clone/util/extensions.dart';

class Player extends ConsumerStatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  ConsumerState<Player> createState() => _PlayerState();
}

class _PlayerState extends ConsumerState<Player> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(navigationProvider);
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Scaffold(
        extendBody: true,
        backgroundColor: YTMTheme.greyColor,
        bottomSheet: BottomSheet(
          constraints: BoxConstraints(
            maxHeight: context.screenHeight,
            minHeight: 0,
          ),
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 0,
            );
          },
        ),
        body: Row(
          children: [
            SizedBox(
              width: value.playerAlbumSize,
              height: value.playerAlbumSize,
            ),
            const SizedBox(
              width: 9,
              height: kBottomNavigationBarHeight,
            ),
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: YTMTheme.greyColor,
                      blurRadius: 8,
                      offset: Offset(-2, 0),
                    ),
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.transparent,
                      blurRadius: 8,
                      offset: Offset(-2, 0),
                      spreadRadius: 12,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: Column(
                    children: const [],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 9,
              height: kBottomNavigationBarHeight,
            ),
            SizedBox(
              width: (kBottomNavigationBarHeight * 1.5),
              height: kBottomNavigationBarHeight,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.skip_next_sharp),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
