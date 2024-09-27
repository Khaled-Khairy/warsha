import 'package:warsha/core/helpers/common_imports.dart';

class BuyNowBody extends StatefulWidget {
  const BuyNowBody({super.key, required this.slug, required this.courseState});

  final String slug, courseState;

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
    return BlocConsumer<BuyNowCubit, SubscribeState>(
      listener: (context, state) {
        if (state is BuyNowLoading) {
          _showLoadingDialog(context);
        } else if (state is BuyNowSuccess) {
          _showSuccessDialog(context);
        } else if (state is BuyNowFailure) {
          _handleFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return AppBody(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UploadImage(onImageSelected: _onImageSelected),
              10.verticalSpace,
              _buildHeaderText(),
              20.verticalSpace,
              _buildForm(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Serial Number",
            controller: _serialNumberController,
            textInputType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the serial number of the receipt";
              }
              return null;
            },
          ),
          10.verticalSpace,
          _buildAppTextButton(),
        ],
      ),
    );
  }

  AppTextButton _buildAppTextButton() {
    final isUnderReview = widget.courseState == "under_review";
    return AppTextButton(
      text: isUnderReview ? "Update Receipt" : "Confirm",
      onPressed: isUnderReview ? _onUpdate : _onSubmit,
    );
  }

  void _onImageSelected(File? image) {
    setState(() {
      selectedImage = image;
    });
  }

  void _onSubmit() {
    _handleFormSubmission(isUpdate: false);
  }

  void _onUpdate() {
    _handleFormSubmission(isUpdate: true);
  }

  void _handleFormSubmission({required bool isUpdate}) {
    closeKeyboard(context);

    if (_formKey.currentState?.validate() ?? false) {
      if (selectedImage == null) {
        showSnackBar(context: context, message: "Please select an image");
        return;
      }

      final buyNowRequest = BuyNowRequest(
        serialNumber: _serialNumberController.text,
        imageFile: selectedImage!,
      );

      final cubit = context.read<BuyNowCubit>();
      if (isUpdate) {
        cubit.updateReceipt(slug: widget.slug, buyNowRequest: buyNowRequest);
      } else {
        cubit.buyCourse(slug: widget.slug, buyNowRequest: buyNowRequest);
      }
    }
  }

  void _showLoadingDialog(BuildContext context) {
    appShowDialog(
      context: context,
      content: const CustomLoading(),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    context.pop();
    appShowDialog(
      context: context,
      content: SuccessDialog(
        title: "Receipt Sent Successfully",
        subTitle: "We’ve received your receipt. Please allow some time for us to review and process it. Check back later for updates on the status of your request.",
        buttonText: "Done",
        onPressed: () {
          context.pushNamedAndRemoveUntil(
            Routes.appNavBar,
            predicate: (route) => false,
          ); // Pop back to main screen
        },
      ),
    );
  }

  void _handleFailure(BuildContext context, String errorMessage) {
    context.pop();
    showSnackBar(context: context, message: errorMessage);
  }
}
