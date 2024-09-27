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
      listener: _handleStateChanges,
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
            validator: (value) =>
            value == null || value.isEmpty ? "Please enter the serial number of the receipt" : null,
          ),
          10.verticalSpace,
          _buildAppTextButton(),
        ],
      ),
    );
  }

  AppTextButton _buildAppTextButton() {
    final isUpdate = widget.courseState == "under_review" || widget.courseState == "rejected";
    return AppTextButton(
      text: isUpdate ? "Update Receipt" : "Confirm",
      onPressed: () => _handleFormSubmission(isUpdate: isUpdate),
    );
  }

  void _handleStateChanges(BuildContext context, SubscribeState state) {
    if (state is BuyNowLoading) {
      _showLoadingDialog();
    } else if (state is BuyNowSuccess || state is UpdateReceiptSuccess) {
      _showSuccessDialog(isUpdating: state is UpdateReceiptSuccess);
    } else if (state is BuyNowFailure) {
      _handleFailure(state.errMessage);
    }
  }

  void _onImageSelected(File? image) {
    setState(() {
      selectedImage = image;
    });
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

  void _showLoadingDialog() {
    appShowDialog(context: context, content: const CustomLoading());
  }

  void _showSuccessDialog({required bool isUpdating}) {
    context.pop();
    appShowDialog(
      context: context,
      content: SuccessDialog(
        title: isUpdating ? "Receipt Updated Successfully" : "Receipt Sent Successfully",
        subTitle: isUpdating
            ? "We’ve received your updated receipt. Please allow some time for us to review and process it. Check back later for updates."
            : "We’ve received your receipt. Please allow some time for us to review and process it. Check back later for updates.",
        buttonText: "Done",
        onPressed: () => context.pushNamedAndRemoveUntil(
          Routes.appNavBar,
          predicate: (route) => false,
        ),
      ),
    );
  }

  void _handleFailure(String errorMessage) {
    context.pop();
    showSnackBar(context: context, message: errorMessage);
  }
}
