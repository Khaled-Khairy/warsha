import 'package:warsha/core/helpers/common_imports.dart';

bool isLoggedUser = false;

checkIfLoggedUser() async {
  String? userToken =
      await SharedPrefHelper.getString(key: SharedPrefKeys.accessToken);
  if (userToken != null && userToken.isNotEmpty) {
    isLoggedUser = true;
  } else {
    isLoggedUser = false;
  }
}

void closeKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (currentFocus.hasFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

String convertMinToHour(int min) {
  int hours = min ~/ 60;
  int minutes = min % 60;
  return '$hours hours $minutes minutes';
}

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 5),
      content: SnackBarContent(message: message),
    ),
  );
}

appShowDialog({required BuildContext context, required Widget content}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => content,
  );
}
