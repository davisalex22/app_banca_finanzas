import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_banca_finanzas/models/models.dart';
import 'package:app_banca_finanzas/screens/screens.dart';

import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class EmpresarioScreen extends StatelessWidget {
  const EmpresarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresariosService = Provider.of<EmpresariosService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (empresariosService.isLoading) return const HomeScreen();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0, // hides leading widget
          )),
      body: Column(children: [
        const MainHeader(titlePage: 'Listado de empresarios'),
        Expanded(
          child: ListView.builder(
              itemCount: empresariosService.empresarios.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      empresariosService.selectedEmpresario =
                          empresariosService.empresarios[index].copy();
                      Navigator.pushNamed(context, '/formEmpresario');
                    },
                    child: CustomCardType4(
                      empresario: empresariosService.empresarios[index],
                    ),
                  )),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0XffA73030),
        label: const Text('Empresario'),
        icon: const Icon(Icons.add),
        onPressed: () {
          empresariosService.selectedEmpresario = Empresario();
          Navigator.pushNamed(context, '/formEmpresario');
        },
      ),
    );
  }
}
