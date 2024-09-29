import 'package:warsha/core/helpers/common_imports.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: "http://13.61.19.152:8000${course.image}",
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 30.w,
        color: ColorsManager.mainGreen,
      ),
    );
  }
}
