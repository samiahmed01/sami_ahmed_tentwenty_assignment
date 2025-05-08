import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constants/app_colors.dart';
import '../domain/entities/movie_detail.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<Result> videoList;
  const VideoPlayerScreen({super.key, required this.videoList});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late String videoKey;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    videoKey = getTrailerKey(widget.videoList);

    _controller = YoutubePlayerController(
      initialVideoId: videoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_controller.value.playerState == PlayerState.ended) {
      context.pop(); // Closes the player screen
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }


  String getTrailerKey(List<Result> videos) {
    final trailer = videos.firstWhere(
          (video) =>
      video.site == 'YouTube' &&
          video.type == 'Trailer',
    );

    return trailer != null ? trailer.key! : 'dQw4w9WgXcQ'; // fallback key
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(title: const Text("Watch Trailer")),
          body: Center(child: player),
        );
      },
    );
  }
}
