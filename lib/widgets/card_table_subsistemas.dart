import 'package:flutter/material.dart';

class CardTableSubsistemas extends StatelessWidget {
  final String columnVar1;
  final String columnVar2;

  final List<DataRow> dataRow;
  const CardTableSubsistemas({
    Key? key,
    required this.dataRow,
    required this.columnVar1,
    required this.columnVar2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DataTable(
          columnSpacing: 20,
          columns: <DataColumn>[
            DataColumn(
              label: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  columnVar1,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                columnVar2,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          ],
          rows: dataRow,
        ),
      ],
    );
  }
}
