import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/course_categories/presentation/views/widgets/course_categories_success.dart';

class CourseCategoriesBody extends StatefulWidget {
  const CourseCategoriesBody({super.key});

  @override
  State<CourseCategoriesBody> createState() => _CourseCategoriesBodyState();
}

class _CourseCategoriesBodyState extends State<CourseCategoriesBody> {
  @override
  void initState() {
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    super.initState();
  }

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
              return  CourseCategoriesSuccess(categories: state.categories,);
            } else if (state is CategoriesFailure) {
              return Center(
                child: Text(
                  "Failed",
                  style: TextStyles.font16offWhiteSemiBold,
                ),
              );
            } else {
              return Text(
                "Unhandled Error",
                style: TextStyles.font16offWhiteSemiBold,
              );
            }
          },
        ),
      ),
    );
  }
}
