import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';

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
              return CategoriesGridView(
                categories: state.categories,
              );
            } else if (state is CategoriesFailure) {
              return const FailureStateError();
            } else {
              return const FailureStateError();
            }
          },
        ),
      ),
    );
  }
}
