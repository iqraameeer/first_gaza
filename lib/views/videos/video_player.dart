import 'package:flutter/material.dart';

import '../../utils/video_player.dart';

class SampleVideoScreen extends StatelessWidget {
  const SampleVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String videoUrl =
        "https://drive.google.com/uc?export=download&id=1x9w_DnF3DhPDhRpvZaI3Db2DYN7PzDtV";
    return Scaffold(
      appBar: AppBar(title: const Text("Sample Video")),
      body: VideoPlayerWidget(videoUrl: videoUrl),
    );
  }
}
