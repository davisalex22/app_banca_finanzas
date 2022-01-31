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
                    column1: Column(children: [
                      CardInformationTable(
                          titleCategory: 'Generales',
                          dataRow: [
                            buildCellTable("Nombre", value.empresaNombre),
                            buildCellTable("Direccion", value.empresaDireccion),
                            buildCellTable("Contactos", value.empresaTelefono),
                            buildCellTable("R.F.C", value.empresaRfc),
                            buildCellTable("Domicilio\nFiscal",
                                value.empresaDomicilioFiscal),
                          ]),
                      const LineDivider(),
                      CardInformationTable(
                          titleCategory: 'Antiguedad de \nantiguedad',
                          dataRow: [
                            buildCellTable("Años desde\ncreación",
                                value.empresaAniosAntiguedad),
                            buildCellTable(
                                "Año de inicio", value.empresaAniosInicio),
                          ]),
                      const LineDivider(),
                      CardInformationTable(
                          titleCategory: 'Estatus legal',
                          dataRow: [
                            buildCellTable("Persona\nfísica",
                                value.empEstLegalPersonaFisica),
                            buildCellTable("Persona\nmoral",
                                value.empEstLegalPersonaMoral),
                            buildCellTable("Persona\nno registrada",
                                value.empEstLegalNoRegistrada),
                          ]),
                      const LineDivider(),
                      CardInformationTable(
                          titleCategory: 'Estatus fiscal',
                          dataRow: [
                            buildCellTable("Empleados\noperativos",
                                value.empTamNumEmpOperativos),
                            buildCellTable("Empleados\nadministrativos",
                                value.empTamNumEmpAdministrativos),
                            buildCellTable(
                                "Empleados\notros", value.empTamNumEmpOtros),
                            buildCellTable(
                                'Empleados \ntotal', value.empTamNumEmpTotal),
                            buildCellTable('Empleados \ncomentario',
                                value.empTamNumEmpComentarios.toString()),
                            buildCellTable(
                                'Ventas diarias', value.empVentasDiarias),
                            buildCellTable(
                                'Ventas semanales', value.empVentasSemanales),
                            buildCellTable(
                                'Ventas mensuales', value.empVentasSemanales),
                            buildCellTable(
                                'Valor terreno', value.empValActivosTerreno),
                            buildCellTable(
                                'Valor bienes', value.empValActivosBienes),
                            buildCellTable(
                                'Valor otros', value.empValActivosOtros),
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
                            buildCellTable(
                                "Regional", value.empCobMercadoRegional),
                            buildCellTable("Internacional",
                                value.empCobMercadoInternacional),
                          ]),
                      const LineDivider(),
                      CardInformationTable(
                          titleCategory: 'Visión de la empresa',
                          dataRow: [
                            buildCellTable(
                                "Corto plazo", value.empVisionCortoPlazo),
                            buildCellTable(
                                "Largo plazo", value.empVisionLargoPlazo),
                          ]),
                      const LineDivider(),
                      CardInformationTable(
                          titleCategory: 'Comentario ',
                          dataRow: [
                            buildCellTable(
                                "Ejecutivo", value.empComentarioEjecutivo),
                          ]),
                    ]),
                  ),
                ])))
      ]),
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
