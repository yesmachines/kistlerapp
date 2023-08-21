import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'ENSjcy3eh8U',
      flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          controlsVisibleAtStart: true,
          showLiveFullscreenButton: false,
          hideControls: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    try {
      _controller.dispose();
    } catch (e) {
      print(e);
    }

    super.dispose();
  }
}
