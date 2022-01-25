import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final Function(String) onChangedValue;
  final String Function(String?)? validatorValue;
  // final String formProperty;
  //final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    required this.initialValue,
    required this.onChangedValue,
    required this.validatorValue,
    //required this.formProperty,
    //required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChangedValue,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        minLines: minLines,
        maxLines: maxLines,
        validator: validatorValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: hintText,
          hintText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ),
      ),
    );
  }
}
