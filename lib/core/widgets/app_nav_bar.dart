import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/manager/update_nav_index/update_nav_index_cubit.dart';
import 'package:warsha/features/menu/presentation/views/menu_view.dart';
import 'package:warsha/features/my_courses/presentation/views/my_courses_view.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateNavIndexCubit, UpdateNavIndexState>(
      builder: (context, state) {
        final currentIndex = (state is UpdateIndex) ? state.index : 0;
        const List<Widget> pages = [
          HomeView(),
          CourseCategoriesView(),
          MyCoursesView(),
          MenuView(),
        ];
        return WillPopScope(
          onWillPop: () async {
            if (currentIndex != 0) {
              context.read<UpdateNavIndexCubit>().updateIndex(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: ColorsManager.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.w),
                  topLeft: Radius.circular(12.w),
                ),
              ),
              child: GNav(
                onTabChange: (index) {
                  context.read<UpdateNavIndexCubit>().updateIndex(index);
                },
                selectedIndex: currentIndex,
                haptic: false,
                rippleColor: ColorsManager.mainGrey,
                hoverColor: ColorsManager.mainGrey,
                backgroundColor: ColorsManager.mainGrey,
                duration: const Duration(milliseconds: 300),
                color: ColorsManager.grey,
                activeColor: ColorsManager.offWhite,
                textStyle: TextStyles.font14offWhiteBold,
                iconSize: 26.r,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                gap: 6.w,
                tabs: const [
                  GButton(
                    icon: Iconsax.home_outline,
                    text: "Home",
                    curve: Curves.decelerate,
                    backgroundColor: ColorsManager.mainGrey,
                    rippleColor: ColorsManager.mainGrey,
                    hoverColor: ColorsManager.mainGrey,
                  ),
                  GButton(
                    icon: Iconsax.category_2_outline,
                    text: "Category",
                    curve: Curves.decelerate,
                    backgroundColor: ColorsManager.mainGrey,
                    rippleColor: ColorsManager.mainGrey,
                    hoverColor: ColorsManager.mainGrey,
                  ),
                  GButton(
                    icon: Bootstrap.collection,
                    text: "My Courses",
                    curve: Curves.decelerate,
                    backgroundColor: ColorsManager.mainGrey,
                    rippleColor: ColorsManager.mainGrey,
                    hoverColor: ColorsManager.mainGrey,
                  ),
                  GButton(
                    icon: Clarity.menu_line,
                    text: "Menu",
                    curve: Curves.decelerate,
                    backgroundColor: ColorsManager.mainGrey,
                    rippleColor: ColorsManager.mainGrey,
                    hoverColor: ColorsManager.mainGrey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
