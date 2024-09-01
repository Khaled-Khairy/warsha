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
