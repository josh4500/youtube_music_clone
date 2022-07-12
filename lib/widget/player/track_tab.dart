import 'package:flutter/material.dart';
import 'package:youtube_music_clone/util/extensions.dart';

class TrackTab extends StatefulWidget {
  const TrackTab({Key? key}) : super(key: key);

  @override
  State<TrackTab> createState() => _TrackTabState();
}

class _TrackTabState extends State<TrackTab> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        snapSizes: [(kBottomNavigationBarHeight + 8) / context.screenHeight, 1],
        initialChildSize:
            (kBottomNavigationBarHeight + 8) / context.screenHeight,
        maxChildSize: 1,
        minChildSize: (kBottomNavigationBarHeight + 8) / context.screenHeight,
        snap: true,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              color: Colors.blue,
              height: 200,
            ),
          );
        });
  }
}
