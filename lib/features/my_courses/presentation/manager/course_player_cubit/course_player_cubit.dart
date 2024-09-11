import '../../../../../core/helpers/common_imports.dart';

part 'course_player_state.dart';

class CoursePlayerCubit extends Cubit<CoursePlayerState> {
  CoursePlayerCubit() : super(CoursePlayerInitial());

  void updateVideoUrl(String videoUrl) {
    emit(CoursePlayerLoaded(videoUrl));
  }
}
