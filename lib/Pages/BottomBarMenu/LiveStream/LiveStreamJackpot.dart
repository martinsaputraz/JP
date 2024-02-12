import 'package:flutter/material.dart';
import 'package:go_hadiah/Settings/Constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Constants constants = Constants();

class LiveStreamingJackpot extends StatefulWidget {
  const LiveStreamingJackpot({super.key});

  @override
  State<LiveStreamingJackpot> createState() => _LiveStreamingJackpotState();
}

class _LiveStreamingJackpotState extends State<LiveStreamingJackpot> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          // constants.videoUrl,
          YoutubePlayer.convertUrlToId(constants.streamJackpot) ?? '',
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
