import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/watch_course/presentation/views/widgets/course_player.dart';

class WatchCourseView extends StatelessWidget {
  const WatchCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CoursePlayer(),
      ),
    );
  }
}
