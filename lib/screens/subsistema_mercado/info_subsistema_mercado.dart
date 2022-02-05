import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class InfoSubsistemaMScreen extends StatelessWidget {
  const InfoSubsistemaMScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subMercadoService = Provider.of<SubMercadoService>(context);
    final value = subMercadoService.selectedsubMercado;
    if (subMercadoService.isLoading) return const HomeScreen();
    puntajeFinal = 0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              MainHeader(
                titlePage: 'Subsistema de mercado\n${value.empresaDuenio}',
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
                      subMercadoService.deleteSubsistema(value);
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
                CardInformationTable(
                    titleCategory: 'Políticas producto y/o servicio',
                    dataRow: [
                      buildCellTableSubs(
                          "Rentabilidad", value.merPoliticaRentabilidad, 3),
                      buildCellTableSubs(
                          "Nuevos\nproductos", value.merPoliticaNuevos, 2),
                    ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Segmento', dataRow: [
                  buildCellTableSubs("Quién es su cliente,\ntipicicar",
                      value.merSegmentoCliente, 5),
                  buildCellTableSubs("Conoce la distribución por producto",
                      value.merSegmentoDistribucion, 5),
                  buildCellTableSubs("Conoce la magnitud\ndel mercado",
                      value.merSegmentoMagnitud, 5),
                  buildCellTableSubs("Indicadores claves\ndel mercado",
                      value.merSegmentoTenIndicadores, 3),
                  buildCellTableSubs("Otras fuentes de\ninformación",
                      value.merSegmentoTenIndicadores, 2),
                  buildCellTableSubs("Conoce su mercado\npotencial actual",
                      value.merSegmentoPotenActual, 3),
                  buildCellTableSubs("Conoce su mercado\npotencial tendencia",
                      value.merSegmentoPotenTendencia, 2),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Cliente', dataRow: [
                  buildCellTableSubs("Usuario", value.merClienteUsuario, 2),
                  buildCellTableSubs("Decisor", value.merClienteDecisor, 2),
                  buildCellTableSubs(
                      "Da los recursos", value.merClienteRecursos, 1),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Expectativa', dataRow: [
                  buildCellTableSubs("Productos y/o \nservicios calidad",
                      value.merExpectativaCompranCalidad, 2),
                  buildCellTableSubs("Productos y/o \nservicios servicio",
                      value.merExpectativaCompranServicio, 2),
                  buildCellTableSubs("Productos y/o \nservicios precio",
                      value.merExpectativaCompranPrecio, 1),
                  buildCellTableSubs("Fijan precios de\nmercado",
                      value.merExpectativaFijaMercado, 5),
                  buildCellTableSubs("Fijan precios de\ncompetencia",
                      value.merExpectativaFijaCompetencia, 4),
                  buildCellTableSubs("Fijan precios de\ncosto",
                      value.merExpectativaFijaCosto, 3),
                  buildCellTableSubs("Fijan precios de\nlirico",
                      value.merExpectativaFijaLirico, 2),
                  buildCellTableSubs(
                      "Canal de distribución\nOferente 1/2,1/2\nconsumidor",
                      value.merExpectativaCanalOferente1,
                      5),
                  buildCellTableSubs(
                      "Canal de distribución\nOferente 1/2\nconsumidor",
                      value.merExpectativaCanalOferente2,
                      5),
                  buildCellTableSubs(
                      "Canal de distribución\nOferente - consumidor",
                      value.merExpectativaCanalOferente3,
                      5),
                  buildCellTableSubs("Competencia identificados",
                      value.merCompetenciaIdentificador, 2),
                  buildCellTableSubs("Competencia cantidad",
                      value.merCompetenciaEvCantidad, 2),
                  buildCellTableSubs(
                      "Competencia calidad", value.merCompetenciaEvCalidad, 2),
                  buildCellTableSubs(
                      "Competencia precio", value.merCompetenciaEvPrecio, 2),
                  buildCellTableSubs("Conoce fuerzas\ncompetencia",
                      value.merCompetenciaMenFuerzas, 1),
                  buildCellTableSubs("Conoce debilidades\ncompetencia",
                      value.merCompetenciasMenDebilidades, 1),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Comercio', dataRow: [
                  buildCellTableSubs("Anuncian información personal",
                      value.merComercializacionSisPersonales, 1),
                  buildCellTableSubs('Anuncian información\nmasivos',
                      value.merComercializacionSisMasivos, 2),
                  buildCellTableSubs('Anuncian información\nexpectativa',
                      value.merComercializacionSisExpectativa, 2),
                  buildCellTableSubs(
                      'Imagen emblema', value.merComercializacionImEmblema, 2),
                  buildCellTableSubs('Imagen logotipo',
                      value.merComercializacionImLogotipo, 3),
                  buildCellTableSubs('Número de vendedores',
                      value.merComercializacionVenVendedores, 1),
                  buildCellTableSubs('Reparto de territorio',
                      value.merComercializacionVenTerritorio, 1),
                  buildCellTableSubs('Equipo de ventas',
                      value.merComercializacionVenEquipo, 1),
                  buildCellTableSubs('Plan de presentación',
                      value.merComercializacionVenEquipo, 1),
                  buildCellTableSubs('Entrenamiento',
                      value.merComercializacionVenEntrenamiento, 1),
                  buildCellTableSubs('Controla sus\nventas cuotas',
                      value.merComercializacionVenCuotas, 1),
                  buildCellTableSubs('Controla sus\nventas presupuestos',
                      value.merComercializacionVenPresupuestos, 1),
                  buildCellTableSubs('Controla sus\nventas reportes',
                      value.merComercializacionVenReportes, 2),
                  buildCellTableSubs('Controla sus\nrentabilidad',
                      value.merComercializacionVenRentabilidad, 1),
                ]),
                const LineDivider(),
                CardInformationTable(titleCategory: 'Reportes', dataRow: [
                  buildCellTableSubs("Clientes", value.merReportesClientes, 5),
                  buildCellTableSubs(
                      "Productos y/o servicio", value.merReportesProducto, 5),
                  buildCellTableSubs(
                      "Canales distribución", value.merReportesCanal, 5),
                  buildCellTableSubs("Precio", value.merReportesPrecio, 5),
                  buildCellTableSubs(
                      "Competencia", value.merReportesCompetencia, 5),
                  buildCellTableSubs(
                      "Sistemas información", value.merReportesSistemas, 5),
                  buildCellTableSubs("Ventas", value.merReportesVentas, 5),
                  buildCellTableSubs(
                      "Forma lírica", value.merReportesLirico, 2),
                  buildCellTableSubs(
                      "Forma manual", value.merReportesManual, 4),
                  buildCellTableSubs(
                      "Forma computarizada", value.merReportesComputarizado, 5),
                  buildCellTableSubs(
                      "Forma personal", value.merReportesPersonal, 4),
                  buildCellTableSubs("Forma organizacional",
                      value.merReportesOrganizacional, 5),
                ]),
                const LineDivider(),
                resultadoFinal(context, 115),
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
        routePage: '/subMercado',
      ),
    );
  }
}
