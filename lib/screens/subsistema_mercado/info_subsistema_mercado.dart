import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class InfoSubsistemaMScreen extends StatelessWidget {
  const InfoSubsistemaMScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresasService = Provider.of<SubMercadoService>(context);
    final value = empresasService.selectedsubMercado;
    valueNull(String campo) {
      if (campo == "null") {
        return "Vacio";
      } else {
        return campo;
      }
    }

    if (empresasService.isLoading) return const HomeScreen();

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
              'Información de sub-sistema \n${value.merComentariosMercado}',
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
                Navigator.pushNamed(context, '/formSubMercado');
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text(
                'Eliminar',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                empresasService.deleteSubsistema(value);
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
                      columnVar1: 'Rentabilidad de\nProductos',
                      columnVar2:
                          valueNull(value.merPoliticaRentabilidad.toString()),
                      titleCategory: 'Políticas de producto y/o servicio',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Nuevos productos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.merPoliticaNuevos.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Quién es su cliente,\ntipicicar',
                      columnVar2:
                          valueNull(value.merSegmentoCliente.toString()),
                      titleCategory: 'Segmento',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Sabe la distribución y\nproporción de sus\nproductos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merSegmentoDistribucion.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Conoce la magnitud\ndel mercado',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merSegmentoMagnitud.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Indicadores claves\ndel mercado',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merSegmentoTenIndicadores.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Otras fuentes de\ninformación',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merSegmentoTenIndicadores.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Conoce su mercado\npotencial actual',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merSegmentoPotenActual.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Conoce su mercado\npotencial tendencia',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merSegmentoPotenTendencia.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Usuario',
                      columnVar2: valueNull(value.merClienteUsuario.toString()),
                      titleCategory: 'Cliente',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Decisor',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.merClienteDecisor.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Da los recursos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merClienteRecursos.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Productos y/o \nservicios calidad',
                      columnVar2: valueNull(
                          value.merExpectativaCompranCalidad.toString()),
                      titleCategory: 'Expectativa',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Productos y/o \nservicios servicio',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merExpectativaCompranServicio
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Productos y/o \nservicios precio',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merExpectativaCompranPrecio.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Fijan precios de\nmercado',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merExpectativaFijaMercado.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Fijan precios de\nmercado',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merExpectativaFijaMercado.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Fijan precios de\ncompetencia',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merExpectativaFijaCompetencia
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Fijan precios de\ncosto',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merExpectativaFijaCosto.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Fijan precios de\nlírico',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merExpectativaFijaLirico.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Canal de distribución\nOferente 1/2,1/2\nconsumidor',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merExpectativaCanalOferente1
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Canal de distribución\nOferente 1/2\nconsumidor',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merExpectativaCanalOferente2
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Canal de distribución\nOferente - consumidor',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merExpectativaCanalOferente3
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Competencia cantidad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merCompetenciaEvCantidad.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Competencia calidad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merCompetenciaEvCalidad.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Competencia precio',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merCompetenciaEvPrecio.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Conoce competencia\nfuerzas',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.merCompetenciaMenFuerzas.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Conoce competencia\ndebilidades',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merCompetenciasMenDebilidades
                                .toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Anuncian\ninformación\npersonales',
                      columnVar2: valueNull(
                          value.merComercializacionSisPersonales.toString()),
                      titleCategory: 'Comercio',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Anuncian información\nmasivos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionSisMasivos
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Anuncian información\nexpectativa',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionSisExpectativa
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Imagen emblema',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionImEmblema
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Imagen logotipo',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionImLogotipo
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Número de vendedores',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenVendedores
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Reparto de Territorio',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenTerritorio
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Equipo de Ventas',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenEquipo
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Plan de Presentación',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenEquipo
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Entrenamiento',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenEntrenamiento
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Controla sus\nventas cuotas',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenCuotas
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Controla sus\nventas presupuestos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenPresupuestos
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Controla sus\nventas reportes',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenReportes
                                .toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Controla sus\nrentabilidad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(value
                                .merComercializacionVenRentabilidad
                                .toString()))),
                          ],
                        ),
                      ],
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
        routePage: '/subMercado',
      ),
    );
  }
}
