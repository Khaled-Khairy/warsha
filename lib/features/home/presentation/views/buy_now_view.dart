import 'package:warsha/core/helpers/common_imports.dart';

class BuyNowView extends StatelessWidget {
  const BuyNowView({super.key, required this.slug, required this.courseState});
  final String slug,courseState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BuyNowCubit(getIt.get<HomeRepoImpl>()),
        child: Center(
          child: BuyNowBody(
            slug: slug, courseState: courseState,
          ),
        ),
      ),
    );
  }
}
