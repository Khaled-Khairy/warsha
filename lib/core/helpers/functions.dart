import 'package:warsha/core/helpers/common_imports.dart';

bool isLoggedUser = false;

checkIfLoggedUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.accessToken);
  if (userToken != null && userToken.isNotEmpty) {
    isLoggedUser = true;
  } else {
    isLoggedUser = false;
  }
}