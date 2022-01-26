import 'package:app_banca_finanzas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:app_banca_finanzas/theme/app_theme.dart';

class CustomCardType3 extends StatelessWidget {
  final Empresa empresa;

  const CustomCardType3({
    Key? key,
    required this.empresa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: InkWell(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 50,
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    child: Image.asset('assets/images/logo_empresa.png',
                        fit: BoxFit.cover),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      empresa.empresaNombre.toString(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
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
