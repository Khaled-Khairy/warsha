import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/home_view.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int currentIndex = 0;
  List<Widget> body = [
    const HomeView(),
    const Icon(Iconsax.category_2_outline),
    const Icon(Clarity.search_line),
    const Icon(Bootstrap.collection),
    const Icon(Clarity.settings_line),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[currentIndex],
      ),
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
              icon: Clarity.search_line,
              text: "Search",
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