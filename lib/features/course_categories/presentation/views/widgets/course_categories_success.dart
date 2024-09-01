import 'package:warsha/core/helpers/common_imports.dart';

class CourseCategoriesSuccess extends StatelessWidget {
  const CourseCategoriesSuccess({super.key, required this.categories});
  final List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 16 / 9,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsManager.mainGreen,
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Center(
            child: Text(
              categories[index].name,
              style: TextStyles.font20offWhiteSemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
