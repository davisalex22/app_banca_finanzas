import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class InfoEmpresarioScreen extends StatelessWidget {
  const InfoEmpresarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresariosService = Provider.of<EmpresariosService>(context);
    final value = empresariosService.selectedEmpresario;

    if (empresariosService.isLoading) return const HomeScreen();

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
          titlePage: '${value.empresarioNombre}',
        ),
        //Text('${value.empresaDuenio}'),
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
                Navigator.pushNamed(context, '/formEmpresario');
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text(
                'Eliminar',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                empresariosService.deleteEmpresario(value);
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
                      columnVar2: value.empresarioNombre.toString(),
                      titleCategory: 'General',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Dirección',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.empresarioDireccion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Teléfono',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.empresarioTelefono.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      titleCategory: 'Antecedentes',
                      columnVar1: 'Origen',
                      columnVar2: value.empresarioOriginario.toString(),
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Lugar',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.empresarioLugar.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.empresarioEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Estado civil',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.empresarioEstadoCivil.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupacion',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.empresarioOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Escolaridad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.empresarioEscolaridad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Estado salud',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.empresarioEstadoSalud.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Comentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.empresarioComentario.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Nombres',
                      columnVar2: value.emprPadresNombres.toString(),
                      titleCategory: 'Padres',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Originarios',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprPadresOriginarios.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Viven',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprPadresViven.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Lugar',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprPadresLugar.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprPadresEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupacion',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprPadresOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Escolaridad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprPadresEscolaridad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprPadresEstadoSalud.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Comentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprPadresComentario.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Nombres',
                      columnVar2: value.emprHermanosNombres.toString(),
                      titleCategory: 'Hermanos',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprHermanosEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupación',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprHermanosOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Lugar entre\nhermanos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprHermanosLugarHermanos.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Nombre',
                      columnVar2: value.emprParejaNombre.toString(),
                      titleCategory: 'Pareja',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Originaria',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprParejaOriginaria.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Vive',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprParejaVive.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Lugar',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprParejaLugar.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprParejaEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupacion',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprParejaOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Escolaridad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprParejaEscolaridad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Estado salud',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprParejaEstadoSalud.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprParejaEdad.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Nombres',
                      columnVar2: value.emprSuegrosNombre.toString(),
                      titleCategory: 'Suegros',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Originarios',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprSuegrosOriginarios.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Viven',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprSuegrosViven.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Lugar',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprSuegrosLugar.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprSuegrosEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupacion',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprSuegrosOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Escolaridad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprSuegrosEscolaridad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprSuegrosEstadoSalud.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Comentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprSuegrosComentario.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Nombres',
                      columnVar2: value.emprCuniadosNombre.toString(),
                      titleCategory: 'Cuñados',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprCuniadosEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupación',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprCuniadosOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Lugar entre\nHermanos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprCuniadosLugarHermanos.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Años de casados',
                      columnVar2: value.emprMatrimonioAniosCasado.toString(),
                      titleCategory: 'Matrimonio',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Situación afectiva',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprMatrimonioSituacionAfectiva
                                .toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Numero de hijos',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprMatrimonioHNumeroHijos.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Edad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprMatrimonioHEdad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Ocupación',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprMatrimonioHOcupacion.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Estado civil',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprMatrimonioHEstadoCivil.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Escolaridad',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprMatrimonioHEscolaridad.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Estado de salud',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(
                                value.emprMatrimonioHEstadoSalud.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Hobies, color, personas',
                      columnVar2: value.emprFilosofiaHobbies.toString(),
                      titleCategory: 'Filosofía\nCarácter',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Comentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprFilosofiaComentario.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Profesionales',
                      columnVar2: value.emprMetasProfesionales.toString(),
                      titleCategory: 'Metas\nPersonales',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Afectivas',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprMetasAfectivas.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Físicas',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprMetasFisicas.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Comentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprMetasComentario.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Día',
                      columnVar2: value.emprAdmTiempoDia.toString(),
                      titleCategory: 'Administración\ntiempo',
                      dataRow: [
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Semana',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprAdmTiempoSemana.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Mes',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprAdmTiempoMes.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Año',
                              style: textStyleColumTitle,
                            )),
                            DataCell(Text(value.emprAdmTiempoAnio.toString())),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            const DataCell(Text(
                              'Comentario',
                              style: textStyleColumTitle,
                            )),
                            DataCell(
                                Text(value.emprAdmTiempoComentario.toString())),
                          ],
                        ),
                      ],
                    ),
                    const LineDivider(),
                    CardInformationTable(
                      columnVar1: 'Comentario ejecutivo',
                      columnVar2:
                          value.empresarioComentarioEjecutivo.toString(),
                      titleCategory: 'Comentario ejecutivo',
                      dataRow: const [],
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
