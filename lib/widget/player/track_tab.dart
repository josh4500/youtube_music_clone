import 'package:flutter/material.dart';
import 'package:youtube_music_clone/util/extensions.dart';

class TrackTab extends StatefulWidget {
  const TrackTab({Key? key}) : super(key: key);

  @override
  State<TrackTab> createState() => _TrackTabState();
}

class _TrackTabState extends State<TrackTab> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        // snapSizes: [(kBottomNavigationBarHeight + 8) / context.screenHeight, 1],
        initialChildSize:
            (kBottomNavigationBarHeight + 8) / context.screenHeight,
        maxChildSize: (context.screenHeight - kBottomNavigationBarHeight) /
            context.screenHeight,
        minChildSize: (kBottomNavigationBarHeight + 8) / context.screenHeight,
        snap: true,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: kBottomNavigationBarHeight,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      // physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          color: Colors.red,
                        ),
                        Container(
                          color: Colors.blue,
                        ),
                        Container(
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
