import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_music_clone/provider/provider.dart';
import 'package:youtube_music_clone/util/extensions.dart';
import 'package:youtube_music_clone/widget/player/album_art_control.dart';
import 'package:youtube_music_clone/widget/player/track_control.dart';
import 'package:youtube_music_clone/widget/player/track_tab.dart';

class Player extends ConsumerStatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  ConsumerState<Player> createState() => _PlayerState();
}

class _PlayerState extends ConsumerState<Player> {
  final _playerScrollController = DraggableScrollableController();
  final double _albumControlOpacity = 1;
  final bool _seekerVisible = true;
  @override
  void initState() {
    super.initState();
    _playerScrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(navigationProvider);
    return DraggableScrollableSheet(
      controller: _playerScrollController,
      expand: false,
      snapSizes: [(kBottomNavigationBarHeight + 8) / context.screenHeight, 1],
      initialChildSize: (kBottomNavigationBarHeight + 8) / context.screenHeight,
      maxChildSize: 1,
      minChildSize: (kBottomNavigationBarHeight + 8) / context.screenHeight,
      snap: true,
      builder: (context, scrollController) {
        return Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Scaffold(
                  extendBody: true,
                  bottomSheet: BottomSheet(
                    builder: (context) => const TrackTab(),
                    onClosing: () {},
                  ),
                  body: ListView(
                    children: List.generate(
                      20,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Color(20 * index).withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            Positioned(
              top: 0,
              width: context.screenWidth,
              height: kBottomNavigationBarHeight + 4,
              child: SingleChildScrollView(
                controller: scrollController,
                child: TrackControl(
                  opacity: _albumControlOpacity,
                  seekerVisible: _seekerVisible,
                ),
              ),
            ),
            Positioned(
              left: 4.5,
              width: value.playerAlbumSize,
              height: value.playerAlbumSize,
              child: const AlbumArtControl(),
            )
          ],
        );
      },
    );
  }
}
