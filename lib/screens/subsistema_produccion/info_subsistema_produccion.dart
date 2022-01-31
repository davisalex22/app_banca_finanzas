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
    valueNull(String campo) {
      if (campo == "null") {
        return "Vacio";
      } else {
        return campo;
      }
    }

    if (subProduccionService.isLoading) return const HomeScreen();
    const textStyleColumTitle = TextStyle(fontWeight: FontWeight.bold);

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
          titlePage:
              'Información de sub-sistema \n${value.prodCometarioProduccion}',
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
                    CardInformationTable(
                      columnVar1: 'Compras',
                      columnVar2:
                          valueNull(value.prodMatCantidadCompras.toString()),
                      titleCategory: 'Producción',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Inventarios',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodMatCantidadInventarios.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Atributos fisicos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodMatCalidadAtributos.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Inventarios',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodMatCantidadInventarios.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Estandarización',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .prodMatCalidadEstandarizacion
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Trabajabilidad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .prodMatCalidadTrabajabilidad
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Disponibilidad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .prodMatCalidadDisponibilidad
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Tiempo entrega',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodMatCalidadEntregas.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Precio',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodMatCalidadPrecio.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Materia prima',
                      columnVar2:
                          valueNull(value.prodUbiMateriaPrima.toString()),
                      titleCategory: 'Ubicación\nadecuada',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Mano de obra',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.prodUbiManoObra.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Clientes',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.prodUbiClientes.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Medio de ambiente',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodUbiMedioAmbiente.toString()))),
                          ],
                        ),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Económico',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodUbiEconomico.toString()))),
                        ]),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Edificio',
                      columnVar2: valueNull(value.prodLugEdificio.toString()),
                      titleCategory: 'Lugar de\ntrabajo',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Espacio',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.prodLugEspacio.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ambientación\ntemperatura',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodLugAmbTemperatura.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ambientación\nluz',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.prodLugAmbLuz.toString()))),
                          ],
                        ),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Ambientación\nruido',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugAmbRuido.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Ambientación\ncolores',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugAmbColores.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Ambientación\nventilación',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodLugAmbVentilacion.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Ambientación\ninstalaciones\nsanitarias',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodLugAmbSanitarias.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Ambientación\nlockers',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugAmbLockers.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Ambientación\nalimentos',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugAmbAlimentos.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Industrial\nequipo',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodLugAmbSegSeguridad.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Industrial\nbotiquin',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodLugAmbSegBotiquin.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Industrial\nteléfono\nemergencia',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodLugAmbSegTelefono.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Distribución\npor puesto',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugDisPuesto.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Distribución\npor taller',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugDisTaller.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Distribución\npor línea',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodLugDisLinea.toString()))),
                        ]),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Procesos líricos\npor escrito',
                      columnVar2: valueNull(value.prodProcProcesos.toString()),
                      titleCategory: 'Procedimiento\nExisten\nEficientan',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Normas/tiempo\npor escrito',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.prodProcNormas.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Desperdicios',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.prodProcDesperdicios.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocios',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.prodProcOcios.toString()))),
                          ],
                        ),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Costos fijos',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodProcCostosFijos.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Costos variables',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodProcCostosVariables.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Manejo materiales',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodProcMateriales.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Embarques',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodProcEmbarques.toString()))),
                        ]),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Adecuado',
                      columnVar2: valueNull(value.prodMaqAdecuado.toString()),
                      titleCategory: 'Maquinaria',
                      dataRow: [
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Suficiente',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodMaqSuficiente.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Mantenimiento',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodMaqMantenimiento.toString()))),
                        ]),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Estandar',
                      columnVar2: valueNull(value.prodCalEstandar.toString()),
                      titleCategory: 'Calidad',
                      dataRow: [
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Mejoras de\nprocesos',
                            style: textStyleColumTitle,
                          )),
                          DataCell(
                              Text(valueNull(value.prodCalMejoras.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Tecnología',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodCalTecnologia.toString()))),
                        ]),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Calidad\nmateriales',
                      columnVar2:
                          valueNull(value.prodRepCalidadMateriales.toString()),
                      titleCategory: 'Reportes de\nproducción',
                      dataRow: [
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Costos de\nmateriales',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodRepCostosMateriales.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Inventarios\nmateriales',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodRepInventarios.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Desperdicios',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodRepDesperdicios.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Rechazos de\nproductos',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodRepDesperdicios.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Forma\nlirico',
                            style: textStyleColumTitle,
                          )),
                          DataCell(
                              Text(valueNull(value.prodRepLirico.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Forma\nmanual',
                            style: textStyleColumTitle,
                          )),
                          DataCell(
                              Text(valueNull(value.prodRepManual.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Forma\ncomputarizado',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodRepComputarizado.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Forma\npersonal',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(
                              valueNull(value.prodRepPersonal.toString()))),
                        ]),
                        DataRow(cells: <DataCell>[
                          const DataCell(Text(
                            'Forma\norganizacional',
                            style: textStyleColumTitle,
                          )),
                          DataCell(Text(valueNull(
                              value.prodRepOrganizacional.toString()))),
                        ]),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Paramétrico',
                      columnVar2:
                          valueNull(value.prodCometarioProduccion.toString()),
                      titleCategory: 'Comentarios\nproducción',
                      dataRow: const [],
                    ),
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
