import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/data/models/course_unit_model.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_player_cubit/course_player_cubit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.units});

  final List<CourseUnit> units;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.units[0].lessons[0].videoUrl)!;
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
    return BlocBuilder<CoursePlayerCubit, CoursePlayerState>(
      builder: (context, state) {
        if (state is CoursePlayerLoaded) {
          _loadVideo(state.videoUrl);
        }
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
                if (state is CoursePlayerLoaded) player,
                ListView.builder(
                  itemCount: widget.units.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final unit = widget.units[index];
                    return ExpandableUnit(
                      unit: unit,
                      index: index,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
