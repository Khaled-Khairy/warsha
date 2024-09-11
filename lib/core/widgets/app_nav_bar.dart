import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/presentation/views/menu_view.dart';
import 'package:warsha/features/my_courses/presentation/views/my_courses_view.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const CourseCategoriesView(),
    const MyCoursesView(),
    const MenuView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorsManager.mainGrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.w),
            topLeft: Radius.circular(12.w),
          ),
        ),
        child: GNav(
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedIndex: currentIndex,
          haptic: false,
          rippleColor: Colors.transparent,
          hoverColor: Colors.transparent,
          backgroundColor: ColorsManager.mainGrey,
          duration: const Duration(milliseconds: 300),
          color: ColorsManager.grey,
          activeColor: ColorsManager.offWhite,
          textStyle: TextStyles.font14offWhiteBold,
          iconSize: 24.w,
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
          ),
          gap: 6.w,
          tabs: const [
            GButton(
              icon: Iconsax.home_outline,
              text: "Home",
            ),
            GButton(
              icon: Iconsax.category_2_outline,
              text: "Category",
            ),
            GButton(
              icon: Bootstrap.collection,
              text: "My Courses",
            ),
            GButton(
              icon: Clarity.menu_line,
              text: "Menu",
            ),
          ],
        ),
      ),
    );
  }
}
