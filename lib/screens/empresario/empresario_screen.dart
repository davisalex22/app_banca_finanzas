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
    if (empresariosService.isLoading) return const HomeScreen();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: const [
              MainHeader(titlePage: 'Listado de Empresarios'),
            ],
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: empresariosService.empresarios.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      empresariosService.selectedEmpresario =
                          empresariosService.empresarios[index].copy();
                      Navigator.pushNamed(context, '/infoEmpresario');
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
      bottomNavigationBar: const CustomNavigationBar(
        actualPage: 0,
        iconOption: Icon(Icons.arrow_back_rounded),
        nameOption: 'Atrás',
        currentIndex: 0,
        routePage: '/home',
      ),
    );
  }
}
