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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              MainHeader(
                titlePage:
                    'Información de la empresa\n${value.empresaNombre} - ${value.empresaDuenio}',
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            CustomCardType2(
              column1: Column(children: [
                CardInformationTable(titleCategory: 'Generales', dataRow: [
                  buildCellTable("Nombre", value.empresaNombre),
                  buildCellTable("Direccion", value.empresaDireccion),
                  buildCellTable("Contactos", value.empresaTelefono),
                  buildCellTable("R.F.C", value.empresaRfc),
                  buildCellTable(
                      "Domicilio\nFiscal", value.empresaDomicilioFiscal),
                ]),
                const LineDivider(),
                CardInformationTable(
                    titleCategory: 'Antiguedad de \nempresa',
                    dataRow: [
                      buildCellTable(
                          "Años desde\ncreación", value.empresaAniosAntiguedad),
                      buildCellTable("Año de inicio", value.empresaAniosInicio),
                    ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Estatus legal', dataRow: [
                  buildCellTable(
                      "Persona\nfísica", value.empEstLegalPersonaFisica),
                  buildCellTable(
                      "Persona\nmoral", value.empEstLegalPersonaMoral),
                  buildCellTable(
                      "Persona\nno registrada", value.empEstLegalNoRegistrada),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Estatus fiscal', dataRow: [
                  buildCellTable(
                      "Empleados\noperativos", value.empTamNumEmpOperativos),
                  buildCellTable("Empleados\nadministrativos",
                      value.empTamNumEmpAdministrativos),
                  buildCellTable("Empleados\notros", value.empTamNumEmpOtros),
                  buildCellTable('Empleados \ntotal', value.empTamNumEmpTotal),
                  buildCellTable('Empleados \ncomentario',
                      value.empTamNumEmpComentarios.toString()),
                  buildCellTable('Ventas diarias', value.empVentasDiarias),
                  buildCellTable('Ventas semanales', value.empVentasSemanales),
                  buildCellTable('Ventas mensuales', value.empVentasSemanales),
                  buildCellTable('Valor terreno', value.empValActivosTerreno),
                  buildCellTable('Valor bienes', value.empValActivosBienes),
                  buildCellTable('Valor otros', value.empValActivosOtros),
                  buildCellTable('Calculo\nVentas/Empleados',
                      value.empCalculosVentasEmpleados),
                  buildCellTable('Calculo\nVentas/Activos',
                      value.empCalculosVentasActivos),
                ]),
                const LineDivider(),
                CardInformationTable(
                    titleCategory: 'Cobertura de mercado',
                    dataRow: [
                      buildCellTable("Local", value.empCobMercadoLocal),
                      buildCellTable("Regional", value.empCobMercadoRegional),
                      buildCellTable(
                          "Internacional", value.empCobMercadoInternacional),
                    ]),
                const LineDivider(),
                CardInformationTable(
                    titleCategory: 'Visión de la empresa',
                    dataRow: [
                      buildCellTable("Corto plazo", value.empVisionCortoPlazo),
                      buildCellTable("Largo plazo", value.empVisionLargoPlazo),
                    ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Comentario ', dataRow: [
                  buildCellTable("Ejecutivo", value.empComentarioEjecutivo),
                ]),
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
              ]),
            ),
          ])),
      bottomNavigationBar: const CustomNavigationBar(
        actualPage: 0,
        iconOption: Icon(Icons.my_library_books_sharp),
        nameOption: 'Registros',
        currentIndex: 0,
        routePage: '/empresa',
      ),
    );
  }
}
