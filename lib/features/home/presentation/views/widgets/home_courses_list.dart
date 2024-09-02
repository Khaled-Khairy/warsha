import 'package:warsha/core/helpers/common_imports.dart';

class HomeCoursesList extends StatelessWidget {
  const HomeCoursesList({
    super.key});


  @override
  Widget build(BuildContext context) {
    final courses = BlocProvider.of<HomeCubit>(context).courses;
    return ListView.builder(
      itemCount: courses.length,
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.courseDetailsScreen,
                arguments: courses[index],
              );
            },
            child: CourseContentCard(
              course: courses[index],
            ),
          ),
        );
      },
    );
  }
}
