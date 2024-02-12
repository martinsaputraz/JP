import 'package:flutter/material.dart';
import 'package:go_hadiah/Settings/Constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

Constants constants = Constants();

class LiveStreamHadiah extends StatefulWidget {
  const LiveStreamHadiah({super.key});

  @override
  State<LiveStreamHadiah> createState() => _LiveStreamHadiahState();
}

class _LiveStreamHadiahState extends State<LiveStreamHadiah> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          // constants.videoUrl,
          YoutubePlayer.convertUrlToId(constants.streamHadiah) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: true,
      ),
    );

    _controller.addListener(() {
      if (_controller.value.hasError) {
        print('Error Code: ${_controller.value.errorCode}');
        // Handle error here, display a message, or take appropriate action
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
