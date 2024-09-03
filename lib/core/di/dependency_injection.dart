import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/networking/dio_factory.dart';
import 'package:warsha/features/watch_course/data/repos/course_unit_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  // Repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SubscribeRepoImpl>(SubscribeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CourseUnitRepoImpl>(CourseUnitRepoImpl(getIt.get<ApiService>()));
}
