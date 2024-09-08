import 'package:warsha/core/helpers/common_imports.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem({
    super.key,
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.categoryCoursesView,
          arguments: category.name,
        );
      },
      borderRadius: BorderRadius.circular(12.w),
      splashColor: ColorsManager.darkerGrey,
      highlightColor: ColorsManager.darkerGrey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: ColorsManager.mainGreen,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              category.name,
              style: TextStyles.font18offWhiteSemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
