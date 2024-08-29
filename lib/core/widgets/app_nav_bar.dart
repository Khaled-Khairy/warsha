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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 6.h,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.mainGreen,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.w),
              topLeft: Radius.circular(12.w),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            backgroundColor: ColorsManager.mainGreen,
            iconSize: 24.w,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsManager.offWhite,
            unselectedItemColor: ColorsManager.background,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.w),
                  child: const Icon(Iconsax.home_outline),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.w),
                  child: const Icon(Iconsax.category_2_outline),
                ),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.w),
                  child: const Icon(Clarity.search_line),
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.w),
                  child: const Icon(Bootstrap.collection),
                ),
                label: "My library",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.w),
                  child: const Icon(Clarity.settings_line),
                ),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
