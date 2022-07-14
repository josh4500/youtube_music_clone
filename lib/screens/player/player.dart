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

class _PlayerState extends ConsumerState<Player> with TickerProviderStateMixin {
  final _playerScrollController = DraggableScrollableController();
  final double _albumControlOpacity = 1;
  final bool _seekerVisible = true;
  late final _animatedController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
    animationBehavior: AnimationBehavior.preserve,
  );
  @override
  void initState() {
    super.initState();
    _playerScrollController.addListener(() {
      // if (_playerScrollController.pixels > 0) {
      //   setState(() {
      //     _albumControlOpacity = _playerScrollController.size;
      //   });
      // } else {
      //   setState(() {
      //     _albumControlOpacity = 1;
      //   });
      // }
    });
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
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Scaffold(
                  extendBody: true,
                  backgroundColor: Colors.teal,
                  bottomSheet: BottomSheet(
                    animationController: _animatedController,
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
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
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
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
