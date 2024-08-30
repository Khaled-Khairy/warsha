import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/watch_course/presentation/views/widgets/course_content_tile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CoursePlayer extends StatefulWidget {
  const CoursePlayer({super.key});

  @override
  State<CoursePlayer> createState() => _CoursePlayerState();
}

class _CoursePlayerState extends State<CoursePlayer> {
  final videoUrl = "https://www.youtube.com/watch?v=DwIYbqzFVKg&t=1371s";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      },
      onExitFullScreen: () {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        aspectRatio: 2.12,
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CourseContentTile();
                },
              ),
            )
          ],
        );
      },
    );
  }
}
