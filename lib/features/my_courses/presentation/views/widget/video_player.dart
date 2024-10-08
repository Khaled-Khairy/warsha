import 'package:warsha/core/helpers/common_imports.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
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
        showLiveFullscreenButton: false,
        useHybridComposition: true,
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
    return YoutubePlayer(
      progressColors: const ProgressBarColors(
        playedColor: Colors.transparent,
        handleColor: Colors.transparent,
        bufferedColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      controlsTimeOut: const Duration(seconds: 3),
      bottomActions: [
        const CurrentPosition(),
        const ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
            backgroundColor: ColorsManager.mainGrey,
            bufferedColor: ColorsManager.grey,
            handleColor: ColorsManager.mainGreen,
            playedColor: ColorsManager.mainGreen,
          ),
        ),
        ValueListenableBuilder<YoutubePlayerValue>(
          valueListenable: _controller,
          builder: (context, value, child) {
            final duration = value.metaData.duration;
            final durationString = _formatDuration(duration);
            return Text(
              durationString,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            );
          },
        ),
        const PlaybackSpeedButton(),
      ],
      topActions: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.mainGreen,
            size: 12.w,
          ),
        ),
      ],
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
