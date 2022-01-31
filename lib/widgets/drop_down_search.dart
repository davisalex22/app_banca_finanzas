import 'package:flutter/material.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class DropDownSearchList extends StatelessWidget {
  final String labelTextInput;
  final String labelTextSearch;
  final String titleSearch;
  final String selectedItem;
  final List<String> listOptions;
  final Function(String?) onChangedValue;

  const DropDownSearchList({
    Key? key,
    required this.labelTextInput,
    required this.labelTextSearch,
    required this.titleSearch,
    required this.listOptions,
    required this.onChangedValue,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
      child: DropdownSearch<String>(
        mode: Mode.BOTTOM_SHEET,
        items: listOptions,
        dropdownSearchDecoration: InputDecoration(
          labelText: labelTextInput,
          contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: const OutlineInputBorder(),
        ),
        onChanged: onChangedValue,
        selectedItem: selectedItem,
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
            labelText: labelTextSearch,
          ),
        ),
        popupTitle: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0XffA73030),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              titleSearch,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        popupShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
