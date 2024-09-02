import 'dart:io';

import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/course_details/data/models/subscribe_request.dart';
import 'package:warsha/features/course_details/presentation/manager/subscribe_cubit/subscribe_cubit.dart';
import 'package:warsha/features/course_details/presentation/views/widgets/upload_image.dart';

class SendReceipt extends StatefulWidget {
  const SendReceipt({
    super.key,
  });

  @override
  State<SendReceipt> createState() => _SendReceiptState();
}

class _SendReceiptState extends State<SendReceipt> {
  File? selectedImage;

  void _onImageSelected(File? image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscribeCubit, SubscribeState>(
      listener: (context, state) {
        if (state is SubscribeLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is SubscribeSuccess) {
          context.pop();
          closeKeyboard(context);
          context.pushReplacementNamed(Routes.appNavBar);
        } else if (state is SubscribeFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              duration: const Duration(seconds: 5),
              content: SnackBarContent(
                message: state.errMessage,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
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
                UploadImage(
                  onImageSelected: _onImageSelected,
                ),
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
                  onPressed: ()  {
                     BlocProvider.of<SubscribeCubit>(context)
                        .subscribeToCourse(
                      slug: "e3d8be64-c910-4d03-bff9-f4137aec5ec7",
                      subscribeRequest: SubscribeRequest(
                        serialNumber: "555558",
                        imageFile: selectedImage!,
                      ),
                    );
                  },
                  text: "Upload Image",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
