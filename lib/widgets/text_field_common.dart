import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool obscureText, isMaxLine;
  final double? vertical, radius, hPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText, prefixIcon;
  final TextStyle? hintStyle;
  final bool? isNumber,isEnabled;

  const TextFieldCommon(
      {Key? key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.radius,
      this.isNumber = false,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.counterText,
      this.hintStyle,
      this.hPadding,
      this.isMaxLine = false, this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text field common
    return TextFormField(
      enabled: isEnabled,
        maxLines: maxLines ?? 1,
        style: appCss.dmDenseMedium14
            .textColor(appColor(context).appTheme.darkText),
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        minLines: minLines,
        maxLength: maxLength,
        decoration: InputDecoration(
            counterText: counterText,
            fillColor: fillColor ?? appColor(context).appTheme.whiteBg,
            filled: true,
            isDense: true,
            disabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? AppRadius.r8)),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? AppRadius.r8)),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? AppRadius.r8)),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? AppRadius.r8)),
                borderSide: BorderSide.none),
            contentPadding: isMaxLine
                ? const EdgeInsets.only(
                    left: Sizes.s45,
                    right: Insets.i15,
                    top: Insets.i15,
                    bottom: Insets.i15)
                : EdgeInsets.symmetric(
                    horizontal: hPadding ?? Insets.i15,
                    vertical: vertical ?? Insets.i15),
            suffixIcon: suffixIcon,
            prefixIcon: isNumber == true
                ? null
                : SvgPicture.asset(prefixIcon!,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                        controller!.text.isEmpty
                            ? appColor(context).appTheme.lightText
                            : appColor(context).appTheme.darkText,
                        BlendMode.srcIn)),
            hintStyle: hintStyle ??
                appCss.dmDenseMedium14
                    .textColor(appColor(context).appTheme.lightText),
            hintText: language(context, hintText)));
  }
}
