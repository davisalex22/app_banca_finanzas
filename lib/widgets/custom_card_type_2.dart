import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String titleCard;
  final String subTitleCard1;
  final String subTitleCard2;
  final String subTitleCard3;
  final Column column1;
  final Column? column2;
  final Column? column3;
  const CustomCardType2({
    Key? key,
    required this.titleCard,
    required this.column1,
    this.subTitleCard1 = '',
    this.column2,
    this.column3,
    this.subTitleCard2 = '',
    this.subTitleCard3 = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Center(
                child: Text(titleCard,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              subtitle: subTitleCard1.isEmpty
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(subTitleCard1,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black)),
                    ),
            ),
            column1,
            ListTile(
              subtitle: subTitleCard2.isEmpty
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(subTitleCard2,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black)),
                    ),
            ),
            Center(child: column2),
            ListTile(
              subtitle: subTitleCard3.isEmpty
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(subTitleCard3,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black)),
                    ),
            ),
            Center(child: column3),
          ],
        ),
      ),
    );
  }
}
