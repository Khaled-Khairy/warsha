import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/core/widgets/nothing_found.dart';

class CourseCategoriesBody extends StatelessWidget {
  const CourseCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const CircularProgressIndicator(
                color: ColorsManager.mainGreen,
              );
            } else if (state is CategoriesSuccess) {
              return state.categories.isNotEmpty
                  ? CategoriesGridView(
                      categories: state.categories,
                    )
                  : const NothingFound(
                title: "No Categories Available",
                subTitle: "Stay tuned! New categories will be added soon.",
                    );
            } else if (state is CategoriesFailure) {
              return FailureStateError(
                message: state.errMessage,
              );
            } else {
              return const FailureStateError(
                message: "Unhandled Error",
              );
            }
          },
        ),
      ),
    );
  }
}
