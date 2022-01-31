import 'package:flutter/material.dart';

class CardInformationTable extends StatelessWidget {
  final String titleCategory;
  final String columnVar1;
  final String columnVar2;

  final List<DataRow> dataRow;
  const CardInformationTable({
    Key? key,
    required this.titleCategory,
    required this.dataRow,
    required this.columnVar1,
    required this.columnVar2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              titleCategory,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: SizedBox(
            child: DataTable(
              //dataRowHeight: rowHeight,
              //headingRowHeight: rowHeight,
              headingRowHeight: 0,
              border: const TableBorder(
                top: BorderSide.none,
                left: BorderSide.none,
              ),
              columns: <DataColumn>[
                DataColumn(
                  label: Text(columnVar1,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
          ),
        ),
      ],
    );
    /*Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        
        Text(
          titleCategory,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                columnVar1,
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
    );*/
  }
}
