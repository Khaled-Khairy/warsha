import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/courses_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const CircularProgressIndicator(
            color: ColorsManager.mainGreen,
          );
        } else if (state is HomeSuccess) {
          return SafeArea(
            child: CoursesList(
              courses: state.courses,
            ),
          );
        } else if (state is HomeFailure) {
          return Center(
            child: Text(
              "Failed",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        } else {
          return Center(
            child: Text(
              "Unhandled Error",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        }
      },
    );
  }
}
