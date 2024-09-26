import 'package:warsha/core/helpers/common_imports.dart';

class BuyNowView extends StatelessWidget {
  const BuyNowView({super.key, required this.slug});
  final String slug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BuyNowCubit(getIt.get<BuyNowRepoImpl>()),
        child: Center(
          child: BuyNowBody(
            slug: slug,
          ),
        ),
      ),
    );
  }
}
