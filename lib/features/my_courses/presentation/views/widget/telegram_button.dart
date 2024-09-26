import 'package:url_launcher/url_launcher.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class TelegramButton extends StatelessWidget {
  const TelegramButton({
    super.key, required this.telegramUrl,
  });
  final String telegramUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Brand(
          Brands.telegram_app,
          size: 50.r,
        ),
        TextButton(
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(telegramUrl))) {
              await launchUrl(Uri.parse(telegramUrl));
            } else {
              throw 'Could not launch $telegramUrl';
            }
          },
          style: TextButton.styleFrom(
            overlayColor: const Color(0xff24A1DE),
          ),
          child: Text(
            "Join Telegram Group",
            style: TextStyle(
              fontSize: 20.sp,
              color: const Color(0xff24A1DE),
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
