import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/presentation/views/widgets/MenuBody.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBody(child: MenuBody()),
    );
  }
}
