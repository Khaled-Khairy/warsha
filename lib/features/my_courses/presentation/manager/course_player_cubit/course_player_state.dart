part of 'course_player_cubit.dart';

@immutable
sealed class CoursePlayerState {}

final class CoursePlayerInitial extends CoursePlayerState {}

final class CoursePlayerLoaded extends CoursePlayerState {
  final String videoUrl;

  CoursePlayerLoaded(this.videoUrl);
}
