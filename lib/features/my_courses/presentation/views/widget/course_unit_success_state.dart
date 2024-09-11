import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/data/models/course_unit_model.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_player_cubit/course_player_cubit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';

class CoursePlayerSuccess extends StatelessWidget {
  const CoursePlayerSuccess({
    super.key,
    required this.units,
  });

  final List<CourseUnit> units;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursePlayerCubit, CoursePlayerState>(
      builder: (context, state) {
        String videoUrl = '';

        if (state is CoursePlayerLoaded) {
          videoUrl = state.videoUrl;
        }
        return Column(
          children: [
            Text(videoUrl),
            ListView.builder(
              itemCount: units.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final unit = units[index];
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
  }
}
