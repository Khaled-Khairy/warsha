import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/subscribed_courses/presentation/views/widgets/subscribed_courses_body.dart';

class SubscribedCoursesView extends StatelessWidget {
  const SubscribedCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBody(child: SubscribedCoursesBody()),
    );
  }
}
