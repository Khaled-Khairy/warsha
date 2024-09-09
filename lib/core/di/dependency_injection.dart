import 'package:warsha/core/helpers/common_imports.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  // Repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<BuyNowRepoImpl>(BuyNowRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CourseUnitRepoImpl>(CourseUnitRepoImpl(getIt.get<ApiService>()));
}
