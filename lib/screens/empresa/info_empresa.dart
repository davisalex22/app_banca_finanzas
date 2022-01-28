import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class InfoEmpresaScreen extends StatelessWidget {
  const InfoEmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresasService = Provider.of<EmpresasService>(context);
    final value = empresasService.selectedEmpresa;

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
            titlePage: 'Información de la empresa \n${value.empresaNombre}',
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
                  Navigator.pushNamed(context, '/formEmpresa');
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text(
                  'Eliminar',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  empresasService.deleteEmpresa(value);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          CustomCardType2(
            column1: Column(
              children: [
                CardInformationTable(
                  columnVar1: 'Nombre',
                  columnVar2: value.empresaNombre.toString(),
                  titleCategory: 'Generales',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Dirección',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empresaDireccion.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'R.F.C',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empresaRfc.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Dirección',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empresaDireccion.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Años de Antigüedad',
                  columnVar2: value.empresaAniosAntiguedad.toString(),
                  titleCategory: 'Antigüedad de la Empresa',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Año de Inicio de la Empresa',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empresaAniosInicio.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Persona Física',
                  columnVar2: value.empEstLegalPersonaFisica.toString(),
                  titleCategory: 'Estatus legal de la Empresa',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Persona Moral',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empEstLegalPersonaMoral.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Persona\n no registrada',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empEstLegalNoRegistrada.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Estatus Fiscal',
                  columnVar2: value.empEstatusFiscal.toString(),
                  titleCategory: 'Estatus Fiscal de la Empresa',
                  dataRow: const [],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Empleados \nOperativos',
                  columnVar2: value.empTamNumEmpOperativos.toString(),
                  titleCategory: 'Tamaño de la Empresa',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Empleados\nAdministrativos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empTamNumEmpAdministrativos.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Empleados\nOtros',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empTamNumEmpOtros.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Empleados \nTotal',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empTamNumEmpTotal.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Empleados \nComentario',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empTamNumEmpComentarios.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Ventas Diarias',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empVentasDiarias.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Ventas Semanales',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empVentasSemanales.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Ventas Mensuales',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empVentasSemanales.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Valor Terreno',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empValActivosTerreno.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Valor Bienes',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empValActivosBienes.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Valor Otros',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empValActivosOtros.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Calculo\nVentas/Empleados',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empCalculosVentasEmpleados.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Calculo\nVentas/Activos',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empCalculosVentasActivos.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Local',
                  columnVar2: value.empCobMercadoLocal.toString(),
                  titleCategory: 'Cobertura de Mercado',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Cobertura\nRegional',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empCobMercadoRegional.toString())),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Cobertura\nInternacional',
                          style: textStyleColumTitle,
                        )),
                        DataCell(
                            Text(value.empCobMercadoInternacional.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Corto Plazo',
                  columnVar2: value.empVisionCortoPlazo.toString(),
                  titleCategory: 'Visión de la Empresa',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Largo Plazo',
                          style: textStyleColumTitle,
                        )),
                        DataCell(Text(value.empVisionLargoPlazo.toString())),
                      ],
                    ),
                  ],
                ),
                const LineDivider(),
                CardInformationTable(
                  columnVar1: 'Comentario Ejecutivo',
                  columnVar2: value.empComentarioEjecutivo.toString(),
                  titleCategory: 'Comentario Ejecutivo',
                  dataRow: const [],
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

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black,
      height: 20,
      thickness: 2,
      indent: 2,
      endIndent: 2,
    );
  }
}
