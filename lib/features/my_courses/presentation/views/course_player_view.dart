import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_player_body.dart';

class CoursePlayerView extends StatelessWidget {
  const CoursePlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)!.settings.arguments as String;
    return const Scaffold(
      body: CoursePlayerBody(),
    );
  }
}
