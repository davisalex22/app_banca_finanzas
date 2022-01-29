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
    valueNull(String campo) {
      if (campo == "null") {
        return "Sin\ninformación";
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
            actions: [],
          )),
      body: Column(children: [
        MainHeader(
          titlePage: '${value.empresaNombre}',
        ),
        Text('${value.empresaDuenio}'),
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
                      columnVar1: 'Nombre',
                      columnVar2: value.empresaNombre.toString(),
                      titleCategory: 'Generales',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(SizedBox(
                                width: 48,
                                child: Text(
                                  'Dirección',
                                  style: textStyleColumTitle,
                                ))),
                            DataCell(SizedBox(
                                width: 95,
                                child: Text(valueNull(
                                    value.empresaDireccion.toString())))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(SizedBox(
                                width: 48,
                                child: Text(
                                  'R.F.C',
                                  style: textStyleColumTitle,
                                ))),
                            DataCell(
                                Text(valueNull(value.empresaRfc.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(SizedBox(
                                width: 48,
                                child: Text(
                                  'Domicilio',
                                  style: textStyleColumTitle,
                                ))),
                            DataCell(Text(
                                valueNull(value.empresaDireccion.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Años de antigüedad',
                      columnVar2:
                          valueNull(value.empresaAniosAntiguedad.toString()),
                      titleCategory: 'Antiguedad de la Empresa',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(SizedBox(
                                width: 80,
                                child: Text(
                                  'Año de inicio',
                                  style: textStyleColumTitle,
                                ))),
                            DataCell(Text(valueNull(
                                value.empresaAniosInicio.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Persona física',
                      columnVar2:
                          valueNull(value.empEstLegalPersonaFisica.toString()),
                      titleCategory: 'Estatus legal de la Empresa',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Persona moral',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empEstLegalPersonaMoral.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Persona\nno registrada',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empEstLegalNoRegistrada.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Fiscal',
                      columnVar2: valueNull(value.empEstatusFiscal.toString()),
                      titleCategory: 'Estatus Fiscal de la empresa',
                      dataRow: const [],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Empleados \nOperativos',
                      columnVar2:
                          valueNull(value.empTamNumEmpOperativos.toString()),
                      titleCategory: 'Tamaño de la Empresa',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Empleados\nAdministrativos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empTamNumEmpAdministrativos.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Empleados\nOtros',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.empTamNumEmpOtros.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Empleados \nTotal',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.empTamNumEmpTotal.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Empleados \nComentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empTamNumEmpComentarios.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ventas Diarias',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                valueNull(value.empVentasDiarias.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ventas Semanales',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empVentasSemanales.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ventas Mensuales',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empVentasSemanales.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Valor Terreno',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empValActivosTerreno.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Valor Bienes',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empValActivosBienes.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Valor Otros',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empValActivosOtros.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Calculo\nVentas/Empleados',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empCalculosVentasEmpleados.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ventas/Activos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empCalculosVentasActivos.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Local',
                      columnVar2:
                          valueNull(value.empCobMercadoLocal.toString()),
                      titleCategory: 'Cobertura de Mercado',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Regional',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empCobMercadoRegional.toString()))),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Internacional',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empCobMercadoInternacional.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Corto plazo',
                      columnVar2:
                          valueNull(value.empVisionCortoPlazo.toString()),
                      titleCategory: 'Visión de la empresa',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Largo plazo',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(valueNull(
                                value.empVisionLargoPlazo.toString()))),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Comentario',
                      columnVar2:
                          valueNull(value.empComentarioEjecutivo.toString()),
                      titleCategory: 'Comentario ejecutivo',
                      dataRow: const [],
                    ),
                    const LineDivider(),
                    const Text(
                      'Organigrama',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    OrganigramaImage(
                      url: value.picture,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )
      ]),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
