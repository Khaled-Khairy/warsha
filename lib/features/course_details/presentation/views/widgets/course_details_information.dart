import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/course_details/presentation/views/widgets/send_receipt.dart';

class CourseDetailsInformation extends StatelessWidget {
  const CourseDetailsInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBody(
      verticalPadding: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comprehensive Guide to Quantum Computing: From Basics to Advanced Applications",
            style: TextStyles.font18offWhiteSemiBold,
          ),
          4.verticalSpace,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Author: ",
                  style: TextStyles.font14GreyRegular,
                ),
                TextSpan(
                  text: "Khaled Mohamed",
                  style: TextStyles.font14GreenMedium,
                ),
              ],
            ),
          ),
          4.verticalSpace,
          Text(
            "This course provides an in-depth exploration of quantum computing, starting with the fundamental principles such as qubits, superposition, and entanglement. You'll learn how quantum gates operate, understand quantum algorithms, and explore real-world applications. By the end of this course, you'll be equipped with the knowledge to understand and potentially contribute to the rapidly evolving field of quantum computing.",
            style: TextStyles.font14GreyRegular,
          ),
          8.verticalSpace,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Bootstrap.collection,
                        size: 16.w,
                        color: ColorsManager.mainGreen,
                      ),
                      4.horizontalSpace,
                      Text(
                        "11 Lessons",
                        style: TextStyles.font14offWhiteMedium,
                      ),
                    ],
                  ),
                  2.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Iconsax.clock_outline,
                        size: 16.w,
                        color: ColorsManager.mainGreen,
                      ),
                      4.horizontalSpace,
                      Text(
                        "5.4 hours",
                        style: TextStyles.font14offWhiteMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "120 LE",
                style: TextStyles.font20GreenBold,
              )
            ],
          ),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const SendReceipt();
                },
              );
            },
            text: "Buy Now",
          ),
        ],
      ),
    );
  }
}

