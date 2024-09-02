import 'package:warsha/core/helpers/common_imports.dart';

class BuyNowView extends StatelessWidget {
  const BuyNowView({super.key});

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: BlocProvider(
        create: (context) => SubscribeCubit(getIt.get<SubscribeRepoImpl>()),
        child: Center(
          child: BuyNowBody(
            slug: slug,
          ),
        ),
      ),
    );
  }
}
