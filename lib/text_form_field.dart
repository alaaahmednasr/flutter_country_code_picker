// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_country_code_picker/model/phone.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.needSuffixIcon = false,
    this.needPrefixIcon = false,
    this.isObscure = false,
    this.readOnly = false,
    this.needMatchPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.controller,
    this.matchPasswordController,
    this.textFielsStyle,
    this.validator,
    this.onChanged,
    this.countries,
    this.onCountryChanged,
    this.onSaved,
    this.showDropdownIcon = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.inputFormatters,
    this.enabled = true,
    this.keyboardAppearance = Brightness.light,
    required this.searchText,
    this.countryCodeTextColor,
    this.backgroundColor,
    this.modalSizePercent = 100,
    this.dropDownArrowColor,
    this.autofocus = false,
    this.textInputAction,
    this.maxLength,
    this.onSubmit,
    this.fontFamily,
    this.onEditingComplete,
  });

  String? hintText;
  bool? needSuffixIcon, needPrefixIcon;
  Widget? suffixIcon;
  Widget? prefixIcon;
  BoxConstraints? suffixIconConstraints;
  BoxConstraints? prefixIconConstraints;
  late bool isObscure;
  late bool readOnly;
  late bool needMatchPassword;
  late TextEditingController? controller;
  TextEditingController? matchPasswordController;
  TextStyle? textFielsStyle;
  TextAlign? textAlign;
  VoidCallback? onTap;
  FormFieldSetter<PhoneNumber>? onSaved;
  ValueChanged<PhoneNumber>? onChanged;
  ValueChanged<PhoneNumber>? onCountryChanged;
  VoidCallback? onEditingComplete;
  FormFieldValidator<String>? validator;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  void Function(String)? onSubmitted;
  bool? enabled;
  Brightness? keyboardAppearance;
  String? initialValue;
  int? maxLength;
  String? initialCountryCode;
  List<String>? countries;
  TextStyle? style;
  bool? showDropdownIcon;
  BoxDecoration? dropdownDecoration;
  List<TextInputFormatter>? inputFormatters;
  String? searchText;
  String? fontFamily;
  Color? countryCodeTextColor;
  Color? dropDownArrowColor;
  Color? backgroundColor;
  double? modalSizePercent;
  bool? autofocus;
  TextInputAction? textInputAction;
  Function? onSubmit;
  String? noDataText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isPassword;

  @override
  void initState() {
    super.initState();
    isPassword = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: widget.textFielsStyle,
      keyboardType: TextInputType.number,
      controller: widget.controller,
      maxLength: widget.maxLength,
      validator: widget.validator,
      onFieldSubmitted: (data) {},
      readOnly: widget.readOnly,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        isDense: true,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: const TextStyle(color: Color(0xff009BF2)),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Color(0xff009BF2))),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        suffixIcon: widget.needSuffixIcon! ? widget.suffixIcon : null,
        prefixIcon: widget.needPrefixIcon! ? widget.prefixIcon : null,
        suffixIconConstraints: widget.suffixIconConstraints,
        prefixIconConstraints: widget.prefixIconConstraints,
      ),
    ).keyboardDismissed(context);
  }
}

extension KeyboardDismissed on Widget {
  Widget keyboardDismissed(context) => GestureDetector(
      child: this,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      });
}