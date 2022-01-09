import 'package:flutter/material.dart';
import 'package:app_banca_finanzas/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  final String logoCard;
  final String titleCard;
  final IconData iconCard;
  final String routePage;
  const CustomCardType1({
    Key? key,
    required this.logoCard,
    required this.titleCard,
    required this.iconCard,
    required this.routePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, routePage);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 50,
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    child: Image.asset(logoCard, fit: BoxFit.cover),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      titleCard,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  trailing: Icon(
                    iconCard,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
