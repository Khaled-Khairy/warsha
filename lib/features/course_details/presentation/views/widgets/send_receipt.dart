import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/course_details/presentation/views/widgets/upload_image.dart';

class SendReceipt extends StatelessWidget {
  const SendReceipt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.background,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UploadImage(),
            10.verticalSpace,
            Text(
              "Vodafone Cash Receipt",
              style: TextStyles.font20GreenBold,
            ),
            Text(
              "Please upload an image of the receipt for the money you transferred via Vodafone Cash to the following number : ",
              style: TextStyles.font16GreyRegular,
            ),
            Text(
              "01025335476",
              style: TextStyles.font26GreenBold,
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            AppTextButton(
              onPressed: () {},
              text: "Upload Image",
            ),
          ],
        ),
      ),
    );
  }
}
