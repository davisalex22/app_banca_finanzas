import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistroEmpresaScreen extends StatelessWidget {
  const RegistroEmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0, // hides leading widget
          )),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MainHeader(
              titlePage: 'Registro Empresa',
            )
          ],
        ),
      ),
    );
  }
}
