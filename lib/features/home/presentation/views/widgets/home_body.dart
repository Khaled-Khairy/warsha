import 'package:warsha/core/helpers/common_imports.dart';

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
            child: state.courses.isNotEmpty
                ? CoursesList(
                    courses: state.courses,
                  )
                : const NothingFound(
                    title: "No Courses Available",
                    subTitle: "New courses will be added soon. Stay tuned!",
                  ),
          );
        } else if (state is HomeFailure) {
          return FailureStateError(
            message: state.errMessage,
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
