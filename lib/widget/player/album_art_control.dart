import 'package:flutter/material.dart';

class AlbumArtControl extends StatefulWidget {
  const AlbumArtControl({Key? key}) : super(key: key);

  @override
  State<AlbumArtControl> createState() => _AlbumArtControlState();
}

class _AlbumArtControlState extends State<AlbumArtControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
