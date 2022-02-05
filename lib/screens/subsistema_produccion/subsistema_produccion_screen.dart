import 'package:app_banca_finanzas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class SubsistemaProduccionScreen extends StatelessWidget {
  const SubsistemaProduccionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subService = Provider.of<SubProduccionService>(context);
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
        const MainHeader(titlePage: 'Listado subsistemas\nde producción'),
        Expanded(
          child: ListView.builder(
              itemCount: subService.subSistemasProduccionList.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      subService.selectedsubProduccion =
                          subService.subSistemasProduccionList[index].copy();
                      Navigator.pushNamed(context, '/infoSubProduccion');
                    },
                    child: CustomCardSubsistemaP(
                      subsistema: subService.subSistemasProduccionList[index],
                    ),
                  )),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0XffA73030),
        label: const Text('Sub-sistema'),
        icon: const Icon(Icons.add),
        onPressed: () {
          subService.selectedsubProduccion = SubsistemaProduccion();
          Navigator.pushNamed(context, '/formSubProduccion');
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
