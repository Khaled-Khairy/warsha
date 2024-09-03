import 'package:warsha/core/helpers/common_imports.dart';

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
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
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

  void _loadVideo(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId != null) {
      _controller.load(videoId);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CourseUnitsCubit>(context);
    final List<CourseUnit> units = cubit.courseUnits;
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
                itemCount: units.length,
                itemBuilder: (context, index) {
                  return CourseContentTile(
                    unit: units[index],
                    onLessonTap: _loadVideo,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
