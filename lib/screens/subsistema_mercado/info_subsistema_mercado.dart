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
            actions: [],
          )),
      body: SingleChildScrollView(
        child: Column(children: [
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
          CustomCardType2(
            column1: Column(
              children: [
                CardInformationTable(
                  columnVar1: 'Rentabilidad de\nProductos',
                  columnVar2: value.merPoliticaRentabilidad.toString(),
                  titleCategory: 'Políticas de producto y/o servicio',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Nuevos productos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merPoliticaNuevos.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Quién es su cliente,\ntipicicar',
                  columnVar2: value.merSegmentoCliente.toString(),
                  titleCategory: 'Segmento',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Sabe la distribución y\nproporción de sus\nproductos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merSegmentoDistribucion.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Conoce la magnitud\ndel mercado',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merSegmentoMagnitud.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Indicadores claves\ndel mercado',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merSegmentoTenIndicadores.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Otras fuentes de\ninformación',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merSegmentoTenIndicadores.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Conoce su mercado\npotencial actual',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merSegmentoPotenActual.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Conoce su mercado\npotencial tendencia',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merSegmentoPotenTendencia.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Usuario',
                  columnVar2: value.merClienteUsuario.toString(),
                  titleCategory: 'Cliente',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Decisor',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merClienteDecisor.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Da los recursos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merClienteRecursos.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Productos y/o \nservicios calidad',
                  columnVar2: value.merExpectativaCompranCalidad.toString(),
                  titleCategory: 'Expectativa',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Productos y/o \nservicios servicio',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merExpectativaCompranServicio.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Productos y/o \nservicios precio',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merExpectativaCompranPrecio.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Fijan precios de\nmercado',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merExpectativaFijaMercado.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Fijan precios de\nmercado',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merExpectativaFijaMercado.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Fijan precios de\ncompetencia',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merExpectativaFijaCompetencia.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Fijan precios de\ncosto',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merExpectativaFijaCosto.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Fijan precios de\nlírico',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merExpectativaFijaLirico.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Canal de distribución\nOferente 1/2,1/2\nconsumidor',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merExpectativaCanalOferente1.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Canal de distribución\nOferente 1/2\nconsumidor',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merExpectativaCanalOferente2.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Canal de distribución\nOferente - consumidor',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merExpectativaCanalOferente3.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Competencia cantidad',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merCompetenciaEvCantidad.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Competencia calidad',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merCompetenciaEvCalidad.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Competencia precio',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merCompetenciaEvPrecio.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Conoce competencia\nfuerzas',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.merCompetenciaMenFuerzas.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Conoce competencia\ndebilidades',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merCompetenciasMenDebilidades.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Anuncian información\npersonales',
                  columnVar2: value.merComercializacionSisPersonales.toString(),
                  titleCategory: 'Comercio',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Anuncian información\nmasivos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionSisMasivos.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Anuncian información\nexpectativa',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merComercializacionSisExpectativa
                            .toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Imagen emblema',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionImEmblema.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Imagen logotipo',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionImLogotipo.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Número de vendedores',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionVenVendedores.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Reparto de Territorio',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionVenTerritorio.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Equipo de Ventas',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionVenEquipo.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Plan de Presentación',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionVenEquipo.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Entrenamiento',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merComercializacionVenEntrenamiento
                            .toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Controla sus\nventas cuotas',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionVenCuotas.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Controla sus\nventas presupuestos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merComercializacionVenPresupuestos
                            .toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Controla sus\nventas reportes',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(
                            value.merComercializacionVenReportes.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Controla sus\nrentabilidad',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.merComercializacionVenRentabilidad
                            .toString())),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
