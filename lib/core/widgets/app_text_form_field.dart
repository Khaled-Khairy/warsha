import 'package:warsha/core/helpers/common_imports.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.inputTextStyle,
    this.hintTextStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
    this.textInputFormatter,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font16offWhiteMedium,
      cursorColor: ColorsManager.mainGreen,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        if (Form.of(context).validate()) {
          Form.of(context).save();
        }
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: ColorsManager.mainGrey,
        hintText: hintText,
        hintStyle: hintTextStyle ?? TextStyles.font16GreyMedium,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(
          minWidth: 48.w,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 48.w,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        enabledBorder: enabledBorder ?? _defaultEnabledBorder(),
        focusedBorder: focusedBorder ?? _defaultFocusedBorder(),
        errorBorder: errorBorder ?? _defaultErrorBorder(),
        focusedErrorBorder: errorBorder ?? _defaultErrorBorder(),
      ),
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
    );
  }

  OutlineInputBorder _defaultEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.w),
      borderSide: const BorderSide(
        color: ColorsManager.mainGrey,
      ),
    );
  }

  OutlineInputBorder _defaultErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.w),
      borderSide: const BorderSide(
        color: ColorsManager.errorColor,
        width: 1.3,
      ),
    );
  }

  OutlineInputBorder _defaultFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.w),
      borderSide: const BorderSide(
        color: ColorsManager.mainGreen,
        width: 1.3,
      ),
    );
  }
}
