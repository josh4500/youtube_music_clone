import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_music_clone/provider/provider.dart';
import 'package:youtube_music_clone/theme/ytm_theme.dart';
import 'package:youtube_music_clone/util/extensions.dart';

class TrackControl extends ConsumerStatefulWidget {
  const TrackControl(
      {Key? key, required this.opacity, required this.seekerVisible})
      : super(key: key);
  final double opacity;
  final bool seekerVisible;

  @override
  ConsumerState<TrackControl> createState() => _TrackControlState();
}

class _TrackControlState extends ConsumerState<TrackControl> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(navigationProvider);
    return Container(
      color: Colors.greenAccent,
      height: kBottomNavigationBarHeight + 4,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: widget.opacity,
        child: Column(
          children: [
            Row(
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
            Visibility(
              visible: widget.seekerVisible,
              child: Container(
                height: 1.5,
                width: context.screenWidth,
                color: Colors.yellow,
                child: const LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
