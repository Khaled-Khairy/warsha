import 'package:warsha/core/helpers/common_imports.dart';

class BuyNowBody extends StatefulWidget {
  const BuyNowBody({super.key, required this.slug});

  final String slug;

  @override
  State<BuyNowBody> createState() => _BuyNowBodyState();
}

class _BuyNowBodyState extends State<BuyNowBody> {
  File? selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _serialNumberController = TextEditingController();

  @override
  void dispose() {
    _serialNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscribeCubit, SubscribeState>(
      listener: (context, state) {
        if (state is SubscribeLoading) {
          appShowDialog(
            context: context,
            content: const CustomLoading(),
          );
        } else if (state is SubscribeSuccess) {
          context.pop();
          appShowDialog(
            context: context,
            content: SuccessDialog(
              title: "Receipt Sent Successfully",
              subTitle:
                  "We’ve received your receipt. Please allow some time for us to review and process it. Check back later for updates on the status of your request.",
              buttonText: "Done",
              onPressed: () {
                context.pop();
                context.pop();
                context.pop();
              },
            ),
          );
        } else if (state is SubscribeFailure) {
          context.pop();
          showSnackBar(
            context: context,
            message: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return AppBody(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UploadImage(onImageSelected: _onImageSelected),
              10.verticalSpace,
              Text(
                "Vodafone Cash Receipt",
                style: TextStyles.font26GreenBold,
                textAlign: TextAlign.center,
              ),
              Text(
                "Please upload an image and the serial number of the receipt for the money you transferred via Vodafone Cash:",
                style: TextStyles.font16GreyRegular,
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                        hintText: "Serial Number",
                        controller: _serialNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the serial number of the receipt";
                          }
                        }),
                    10.verticalSpace,
                    AppTextButton(
                      onPressed: _onSubmit,
                      text: "Upload Receipt",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onImageSelected(File? image) {
    setState(() {
      selectedImage = image;
    });
  }

  void _onSubmit() {
    closeKeyboard(context);
    if (_formKey.currentState?.validate() ?? false) {
      if (selectedImage == null) {
        showSnackBar(context: context, message: "Please select an image");
        return;
      }

      final subscribeRequest = SubscribeRequest(
        serialNumber: _serialNumberController.text,
        imageFile: selectedImage!,
      );

      BlocProvider.of<SubscribeCubit>(context).subscribeToCourse(
        slug: widget.slug,
        subscribeRequest: subscribeRequest,
      );
    }
  }
}
