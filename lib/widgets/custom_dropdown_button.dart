import 'package:flutter/material.dart';

class CustomDropDownButtom extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final List<String> listMenu;

  const CustomDropDownButtom({
    Key? key,
    required this.formValues,
    this.hintText,
    this.labelText,
    this.helperText,
    required this.listMenu,
  }) : super(key: key);

  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: DropdownButtonFormField<String>(
        items: listMenu
            .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
            .toList(),
        decoration: InputDecoration(
          labelText: hintText,
          hintText: labelText,
          helperText: helperText,
        ),
        onChanged: (_) {},
      ),
    );
  }
}
