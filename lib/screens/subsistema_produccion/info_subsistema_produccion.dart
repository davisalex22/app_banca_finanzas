import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class InfoSubsistemaPScreen extends StatelessWidget {
  const InfoSubsistemaPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subProduccionService = Provider.of<SubProduccionService>(context);
    final value = subProduccionService.selectedsubProduccion;

    if (subProduccionService.isLoading) return const HomeScreen();
    puntajeFinal = 0;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: const [],
          )),
      body: Column(children: [
        MainHeader(
          titlePage: 'Subsistema ${value.prodCometarioProduccion}',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text(
                'Editar',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/formSubProduccion',
                    arguments: value);
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text(
                'Eliminar',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                subProduccionService.deleteSubsistema(value);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.63,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              CustomCardType2(
                column1: Column(
                  children: [
                    CardInformationTable(titleCategory: 'Producción', dataRow: [
                      buildCellTableSubs(
                          "Compras", value.prodMatCantidadCompras, 2),
                      buildCellTableSubs(
                          'Inventarios', value.prodMatCantidadInventarios, 2),
                      buildCellTableSubs('Atributos fisicos',
                          value.prodMatCalidadAtributos, 1),
                      buildCellTableSubs('Estandarización',
                          value.prodMatCalidadEstandarizacion, 1),
                      buildCellTableSubs('Trabajabilidad',
                          value.prodMatCalidadTrabajabilidad, 1),
                      buildCellTableSubs('Disponibilidad',
                          value.prodMatCalidadDisponibilidad, 1),
                      buildCellTableSubs(
                          'Tiempo entrega', value.prodMatCalidadEntregas, 1),
                      buildCellTableSubs(
                          'Precio', value.prodMatCalidadPrecio, 1),
                    ]),
                    const LineDivider(),
                    CardInformationTable(
                        titleCategory: 'Ubicación adecuada',
                        dataRow: [
                          buildCellTableSubs(
                              "Materia prima", value.prodUbiMateriaPrima, 1),
                          buildCellTableSubs(
                              'Mano de obra', value.prodUbiManoObra, 1),
                          buildCellTableSubs(
                              'Clientes', value.prodUbiClientes, 1),
                          buildCellTableSubs('Medio de ambiente',
                              value.prodUbiMedioAmbiente, 1),
                          buildCellTableSubs(
                              'Económico', value.prodUbiEconomico, 1),
                        ]),
                    const LineDivider(),
                    CardInformationTable(
                        titleCategory: 'Lugar de trabajo',
                        dataRow: [
                          buildCellTableSubs(
                              "Edificio", value.prodLugEdificio, 3),
                          buildCellTableSubs(
                              'Espacio', value.prodLugEspacio, 3),
                          buildCellTableSubs('Ambientación\ntemperatura',
                              value.prodLugAmbTemperatura, 1),
                          buildCellTableSubs(
                              'Ambientación\nluz', value.prodLugAmbLuz, 1),
                          buildCellTableSubs(
                              'Ambientación\nruido', value.prodLugAmbRuido, 1),
                          buildCellTableSubs('Ambientación\ncolores',
                              value.prodLugAmbColores, 1),
                          buildCellTableSubs('Ambientación\nventilación',
                              value.prodLugAmbVentilacion, 1),
                          buildCellTableSubs(
                              'Ambientación\ninstalaciones\nsanitarias',
                              value.prodLugAmbSanitarias,
                              1),
                          buildCellTableSubs('Ambientación\nlockers',
                              value.prodLugAmbLockers, 1),
                          buildCellTableSubs('Ambientación\nalimentos',
                              value.prodLugAmbAlimentos, 1),
                          buildCellTableSubs('Industrial\nequipo',
                              value.prodLugAmbSegSeguridad, 1),
                          buildCellTableSubs('Industrial\nbotiquin',
                              value.prodLugAmbSegBotiquin, 1),
                          buildCellTableSubs('Industrial\nteléfono\nemergencia',
                              value.prodLugAmbSegTelefono, 1),
                          buildCellTableSubs('Distribución\npor puesto',
                              value.prodLugDisPuesto, 1),
                          buildCellTableSubs('Distribución\npor taller',
                              value.prodLugDisTaller, 1),
                          buildCellTableSubs('Distribución\npor línea',
                              value.prodLugDisLinea, 1),
                        ]),
                    const LineDivider(),
                    CardInformationTable(
                        titleCategory: 'Procedimiento\nExisten\nEficientan',
                        dataRow: [
                          buildCellTableSubs("Procesos líricos\npor escrito",
                              value.prodProcProcesos, 3),
                          buildCellTableSubs('Normas/tiempo\npor escrito',
                              value.prodProcNormas, 3),
                          buildCellTableSubs(
                              'Desperdicios', value.prodProcDesperdicios, 2),
                          buildCellTableSubs('Ocios', value.prodProcOcios, 2),
                          buildCellTableSubs('Dispositivos de medición',
                              value.prodProcDispositivos, 1),
                          buildCellTableSubs(
                              'Costos fijos', value.prodProcCostosFijos, 1),
                          buildCellTableSubs('Costos variables',
                              value.prodProcCostosVariables, 1),
                          buildCellTableSubs(
                              'Manejo materiales', value.prodProcMateriales, 1),
                          buildCellTableSubs(
                              'Embarques', value.prodProcEmbarques, 1),
                        ]),
                    const LineDivider(),
                    CardInformationTable(titleCategory: 'Maquinaria', dataRow: [
                      buildCellTableSubs(
                          "Adecuada", value.prodMaqSuficiente, 2),
                      buildCellTableSubs(
                          "Suficiente", value.prodMaqSuficiente, 2),
                      buildCellTableSubs(
                          'Mantenimiento', value.prodMaqMantenimiento, 1),
                    ]),
                    const LineDivider(),
                    CardInformationTable(titleCategory: 'Calidad', dataRow: [
                      buildCellTableSubs("Estandar", value.prodCalEstandar, 3),
                      buildCellTableSubs(
                          "Mejoras de\nprocesos", value.prodCalMejoras, 1),
                      buildCellTableSubs(
                          'Tecnología', value.prodCalTecnologia, 1),
                    ]),
                    const LineDivider(),
                    CardInformationTable(titleCategory: 'Reportes', dataRow: [
                      buildCellTableSubs("Calidad\nmateriales",
                          value.prodRepCalidadMateriales, 5),
                      buildCellTableSubs('Costos de\nmateriales',
                          value.prodRepCostosMateriales, 5),
                      buildCellTableSubs('Inventarios\nmateriales',
                          value.prodRepInventarios, 5),
                      buildCellTableSubs(
                          'Desperdicios', value.prodRepDesperdicios, 5),
                      buildCellTableSubs('Rechazos de\nproductos',
                          value.prodRepDesperdicios, 5),
                      buildCellTableSubs(
                          'Forma\nlirico', value.prodRepLirico, 5),
                      buildCellTableSubs(
                          'Forma\nmanual', value.prodRepManual, 5),
                      buildCellTableSubs('Forma\ncomputarizado',
                          value.prodRepComputarizado, 5),
                      buildCellTableSubs(
                          'Forma\npersonal', value.prodRepPersonal, 5),
                      buildCellTableSubs('Forma\norganizacional',
                          value.prodRepOrganizacional, 5),
                    ]),
                    const LineDivider(),
                    CardInformationTable(
                        titleCategory: 'Comentarios\nproducción',
                        dataRow: [
                          buildCellTableSubs(
                              "Paramétrico", value.prodCometarioProduccion, 5),
                        ]),
                    const LineDivider(),
                    resultadoFinal(context, 85),
                  ],
                ),
              ),
            ]),
          ),
        )
      ]),
      bottomNavigationBar: const CustomNavigationBar(
        actualPage: 0,
        iconOption: Icon(Icons.my_library_books_sharp),
        nameOption: 'Registros',
        currentIndex: 0,
        routePage: '/subProduccion',
      ),
    );
  }
}
