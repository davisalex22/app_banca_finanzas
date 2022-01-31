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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              MainHeader(
                titlePage:
                    'Información del empresario\n${value.empresarioNombre} - ${value.empresaDuenio}',
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          CustomCardType2(
            column1: Column(
              children: [
                CardInformationTable(titleCategory: 'General', dataRow: [
                  buildCellTable("Nombre", value.empresarioNombre),
                  buildCellTable("Direccion", value.empresarioDireccion),
                  buildCellTable("Contactos", value.empresarioTelefono),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Precedentes', dataRow: [
                  buildCellTable("Origen", value.empresarioOriginario),
                  buildCellTable("Edad", value.empresarioEdad),
                  buildCellTable("Estado civil", value.empresarioEstadoCivil),
                  buildCellTable("Ocupación", value.empresarioOcupacion),
                  buildCellTable("Escolaridad", value.empresarioEscolaridad),
                  buildCellTable("Estado salud", value.empresarioEstadoSalud),
                  buildCellTable("Comentario", value.empresarioComentario),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Padres', dataRow: [
                  buildCellTable("Nombres", value.emprPadresNombres),
                  buildCellTable("Originarios", value.emprPadresOriginarios),
                  buildCellTable("Viven", value.emprPadresViven),
                  buildCellTable("Lugar", value.emprPadresLugar),
                  buildCellTable("Edad", value.emprPadresEdad),
                  buildCellTable("Ocupacion", value.emprPadresOcupacion),
                  buildCellTable("Escolaridad", value.emprPadresEscolaridad),
                  buildCellTable("Estado salud", value.emprPadresEstadoSalud),
                  buildCellTable("Comentario", value.emprPadresComentario),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Hermanos', dataRow: [
                  buildCellTable("Nombres", value.emprHermanosNombres),
                  buildCellTable("Edad", value.emprHermanosEdad),
                  buildCellTable("Ocupación", value.emprHermanosOcupacion),
                  buildCellTable(
                      "Lugar entre\nhermanos", value.emprHermanosLugarHermanos),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Pareja', dataRow: [
                  buildCellTable("Nombre", value.emprParejaNombre),
                  buildCellTable("Originaria", value.emprParejaOriginaria),
                  buildCellTable("Vive", value.emprParejaVive),
                  buildCellTable("Lugar", value.emprParejaLugar),
                  buildCellTable("Edad", value.emprParejaEdad),
                  buildCellTable("Ocupacion", value.emprParejaOcupacion),
                  buildCellTable("Escolaridad", value.emprParejaEscolaridad),
                  buildCellTable("Estado salud", value.emprParejaEstadoSalud),
                  buildCellTable("Comentario", value.emprParejaComentario),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Suegros', dataRow: [
                  buildCellTable("Nombres", value.emprSuegrosNombre),
                  buildCellTable("Originarios", value.emprSuegrosOriginarios),
                  buildCellTable("Viven", value.emprSuegrosViven),
                  buildCellTable("Lugar", value.emprSuegrosLugar),
                  buildCellTable("Edad", value.emprSuegrosEdad),
                  buildCellTable("Ocupacion", value.emprSuegrosOcupacion),
                  buildCellTable("Escolaridad", value.emprSuegrosEscolaridad),
                  buildCellTable("Estado salud", value.emprSuegrosEstadoSalud),
                  buildCellTable("Comentario", value.emprSuegrosComentario),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Cuñados', dataRow: [
                  buildCellTable("Nombres", value.emprCuniadosNombre),
                  buildCellTable("Edad", value.emprCuniadosEdad),
                  buildCellTable("Ocupación", value.emprCuniadosOcupacion),
                  buildCellTable("Lugar entre\nhermanos\npareja",
                      value.emprCuniadosLugarHermanos),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Matrimonio', dataRow: [
                  buildCellTable(
                      "Años casados", value.emprMatrimonioAniosCasado),
                  buildCellTable("Situación afectiva",
                      value.emprMatrimonioSituacionAfectiva),
                  buildCellTable(
                      "Número de hijos", value.emprMatrimonioHNumeroHijos),
                  buildCellTable("Edad\nhijos", value.emprMatrimonioHEdad),
                  buildCellTable(
                      "Ocupación\nhijos", value.emprMatrimonioHOcupacion),
                  buildCellTable(
                      "Estado civil\nhijos", value.emprMatrimonioHEstadoCivil),
                  buildCellTable(
                      "Escolaridadl\nhijos", value.emprMatrimonioHEscolaridad),
                  buildCellTable(
                      "Estado salud\nhijos", value.emprMatrimonioHEstadoSalud),
                ]),
                const LineDivider(),
                CardInformationTable(
                    titleCategory: 'Filosofía\nCarácter',
                    dataRow: [
                      buildCellTable("Hobies, color, personas",
                          value.emprFilosofiaHobbies),
                      buildCellTable(
                          "Comentario", value.emprFilosofiaComentario),
                    ]),
                const LineDivider(),
                CardInformationTable(
                    titleCategory: 'Metas\npersonales',
                    dataRow: [
                      buildCellTable("Afectivas", value.emprMetasAfectivas),
                      buildCellTable("Físicas", value.emprMetasFisicas),
                      buildCellTable("Comentarios", value.emprMetasComentario),
                    ]),
                const LineDivider(),
                CardInformationTable(
                    titleCategory: 'Gestión\ntiempo',
                    dataRow: [
                      buildCellTable("Día", value.emprAdmTiempoDia),
                      buildCellTable("Semana", value.emprAdmTiempoSemana),
                      buildCellTable("Mes", value.emprAdmTiempoMes),
                      buildCellTable("Año", value.emprAdmTiempoAnio),
                      buildCellTable(
                          "Comentarios", value.emprAdmTiempoComentario),
                    ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Comentario', dataRow: [
                  buildCellTable(
                      "Ejecutivo", value.empresarioComentarioEjecutivo),
                ]),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const CustomNavigationBar(
        actualPage: 0,
        iconOption: Icon(Icons.my_library_books_sharp),
        nameOption: 'Registros',
        currentIndex: 0,
        routePage: '/empresario',
      ),
    );
  }
}
