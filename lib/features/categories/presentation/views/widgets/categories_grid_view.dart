import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/animate_list.dart';
import 'package:warsha/features/categories/presentation/views/widgets/categories_grid_view_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.categories});

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoriesCubit>().getCategories();
      },
      backgroundColor: ColorsManager.mainGrey,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 16 / 9,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return AnimateWidget(
              index: index,
              child: CategoriesGridViewItem(category: categories[index]));
        },
      ),
    );
  }
}
