import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardInformationTable extends StatelessWidget {
  final String titleCategory;

  final List<TableRow> dataRow;
  const CardInformationTable({
    Key? key,
    required this.titleCategory,
    required this.dataRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
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
        Expanded(
          flex: 3,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Table(
              border: const TableBorder(
                  horizontalInside: BorderSide(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              children: dataRow,
            ),
          ),
        ),
      ],
    );
  }
}

valueNull(String campo) {
  if (campo == "null") {
    return "(Vacio)";
  } else {
    return campo;
  }
}

TableRow buildCellTable(str, data) {
  const textStyleColumTitle = TextStyle(fontWeight: FontWeight.bold);

  return TableRow(children: [
    Container(
        margin: const EdgeInsets.all(10),
        child: Text(str, style: textStyleColumTitle)),
    Padding(
        padding: const EdgeInsets.all(6),
        child: Column(children: [
          Text(valueNull(data.toString())),
        ]))
  ]);
}

TableRow buildCellTableSubs(str, data, rang) {
  const textStyleColumTitle = TextStyle(fontWeight: FontWeight.bold);

  return TableRow(children: [
    Container(
        margin: const EdgeInsets.all(10),
        child: Text(str, style: textStyleColumTitle)),
    Padding(
        padding: const EdgeInsets.all(6),
        child: Column(children: [
          Text('${valueNullSubs(data.toString(), rang)}'),
        ]))
  ]);
}

int puntajeFinal = 0;
valueNullSubs(String campo, int rang) {
  if (campo == "null") {
    return "0/$rang";
  } else {
    if (double.tryParse(campo) == null) {
      return campo;
    }
    puntajeFinal = double.parse(campo).round() + puntajeFinal;
    print(puntajeFinal);
    return '${double.parse(campo).round()}/${rang}';
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black,
      height: 20,
      thickness: 2,
      indent: 2,
      endIndent: 2,
    );
  }
}

Widget resultadoFinal(BuildContext context, int max) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Puntaje final",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        Text(
          '$puntajeFinal/$max puntos',
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ]));
}
