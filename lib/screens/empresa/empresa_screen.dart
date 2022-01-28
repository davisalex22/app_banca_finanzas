import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/models/models.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class EmpresaScreen extends StatelessWidget {
  const EmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresasService = Provider.of<EmpresasService>(context);

    if (empresasService.isLoading) return const HomeScreen();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0, // hides leading widget
          )),
      body: Column(children: [
        const MainHeader(titlePage: 'Listado de empresas'),
        Expanded(
          child: ListView.builder(
              itemCount: empresasService.empresas.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      empresasService.selectedEmpresa =
                          empresasService.empresas[index].copy();
                      Navigator.pushNamed(context, '/infoEmpresa');
                    },
                    child: CustomCardType3(
                      empresa: empresasService.empresas[index],
                    ),
                  )),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0XffA73030),
        label: const Text('Empresa'),
        icon: const Icon(Icons.add),
        onPressed: () {
          empresasService.selectedEmpresa = Empresa();
          Navigator.pushNamed(context, '/formEmpresa');
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
