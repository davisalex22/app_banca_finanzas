import 'package:app_banca_finanzas/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String titleCard;
  final String subTitleCard1;
  final String subTitleCard2;
  final String subTitleCard3;
  final String subTitleCard4;
  final Column? column1;
  final Column? column2;
  final Column? column3;
  final Column? column4;
  const CustomCardType2({
    Key? key,
    this.titleCard = '',
    this.column1,
    this.subTitleCard1 = '',
    this.column2,
    this.column3,
    this.subTitleCard2 = '',
    this.subTitleCard3 = '',
    this.subTitleCard4 = '',
    this.column4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: AppTheme.primary.withOpacity(0.5),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              titleCard.isEmpty
                  ? const SizedBox(height: 0)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(titleCard,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
              subTitleCard1.isEmpty
                  ? const SizedBox(height: 0)
                  : ListTile(
                      title: subTitleCard1.isEmpty
                          ? null
                          : Text(subTitleCard1,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                    ),
              Center(child: column1),
              subTitleCard2.isEmpty
                  ? const SizedBox(height: 10)
                  : ListTile(
                      title: subTitleCard2.isEmpty
                          ? null
                          : Text(subTitleCard2,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                    ),
              Center(child: column2),
              subTitleCard3.isEmpty
                  ? const SizedBox(height: 0)
                  : ListTile(
                      title: subTitleCard3.isEmpty
                          ? null
                          : Text(subTitleCard3,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                    ),
              Center(child: column3),
              subTitleCard4.isEmpty
                  ? const SizedBox(height: 0)
                  : ListTile(
                      title: subTitleCard4.isEmpty
                          ? null
                          : Text(subTitleCard4,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                    ),
              Center(child: column4),
            ],
          ),
        ),
      ),
    );
  }
}
