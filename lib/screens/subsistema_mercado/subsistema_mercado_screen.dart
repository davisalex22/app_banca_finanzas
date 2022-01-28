import 'package:app_banca_finanzas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class SubsistemaMercadoScreen extends StatelessWidget {
  const SubsistemaMercadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subService = Provider.of<SubMercadoService>(context);
    if (subService.isLoading) return const HomeScreen();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0, // hides leading widget
          )),
      body: Column(children: [
        const MainHeader(titlePage: 'Listado de sub-sistemas\nde Mercado'),
        Expanded(
          child: ListView.builder(
              itemCount: subService.subSistemasMercadosList.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      subService.selectedsubMercado =
                          subService.subSistemasMercadosList[index].copy();
                      Navigator.pushNamed(context, '/infoSubMercado');
                    },
                    child: CustomCardSubsistemaM(
                      subsistema: subService.subSistemasMercadosList[index],
                    ),
                  )),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0XffA73030),
        label: const Text('Sub-sistema'),
        icon: const Icon(Icons.add),
        onPressed: () {
          subService.selectedsubMercado = SubsistemaMercado();
          Navigator.pushNamed(context, '/formSubMercado');
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
