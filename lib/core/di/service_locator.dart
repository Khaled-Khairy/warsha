import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/repos/menu_repo_impl.dart';
import 'package:warsha/features/my_courses/data/repos/my_courses_repo/my_courses_repo_impl.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  // Repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CourseUnitRepoImpl>(CourseUnitRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<MenuRepoImpl>(MenuRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<MyCoursesRepoImpl>(MyCoursesRepoImpl(getIt.get<ApiService>()));
}
