import 'package:app_banca_finanzas/providers/subsistema_mercado_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistroSubMercadoScreen extends StatelessWidget {
  const RegistroSubMercadoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final subMercadoService = Provider.of<SubMercadoService>(context);

    return ChangeNotifierProvider(
      create: (_) =>
          SubMercadoFormProvider(subMercadoService.selectedsubMercado),
      child: _SubMercadoScreenBody(subMercadoService: subMercadoService),
    );
  }
}

class _SubMercadoScreenBody extends StatelessWidget {
  const _SubMercadoScreenBody({
    Key? key,
    required this.subMercadoService,
  }) : super(key: key);

  final SubMercadoService subMercadoService;

  @override
  Widget build(BuildContext context) {
    final subMercadoForm = Provider.of<SubMercadoFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            _SubMercadoForm(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomAlert(
                titleAlert: 'Información',
                contentAlert: '¿Desea guardar los cambios?',
                onPressedValue: subMercadoService.isSaving
                    ? null
                    : () async {
                        if (subMercadoForm.isValidForm()) {
                          Navigator.of(context).pop();
                          await subMercadoService.saveOrCreateSubMercado(
                              subMercadoForm.subMercado);
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.success(
                              message: "Información guardada correctamente",
                            ),
                          );
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "Faltan campos por llenar",
                            ),
                          );
                        }
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubMercadoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subMercadoForm = Provider.of<SubMercadoFormProvider>(context);
    final registroSub = subMercadoForm.subMercado;
    double value_ = 0;

    valueSlider(String? campo) {
      if (campo == null) {
        return value_;
      } else {
        return double.parse(campo);
      }
    }

    return Form(
      key: subMercadoForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const MainHeader(
            titlePage: 'Registrar Sub-sistema Mercado',
          ),
          CustomCardType2(
            titleCard: 'Políticas de Producto y/o Servicio',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (5)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          child: Text(
                            'Rentabilidad \nde los productos',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merPoliticaRentabilidad),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merPoliticaRentabilidad =
                                          '$val';
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Nuevos\nProductos',
                        )),
                        DataCell(inputSlider(
                            registroSub.merPoliticaNuevos, 0.0, 2.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Segmento',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (25)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Quien es su cliente,\ntipificar',
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoCliente, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          child: Text(
                            'Distribución y proporción\npor productos',
                          ),
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoDistribucion, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Conoce magnitud\nde mercado',
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoMagnitud, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Indicadores clave\nde mercado',
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoTenIndicadores, 0.0, 3.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Indicadores clave\nde mercado',
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoTenFuentes, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Mercado potencial\nactual',
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoPotenActual, 0.0, 3.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Mercado potencial\ntendencia',
                        )),
                        DataCell(inputSlider(
                            registroSub.merSegmentoPotenActual, 0.0, 2.0)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Cliente',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (5)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Usuario',
                        )),
                        DataCell(inputSlider(
                            registroSub.merClienteUsuario, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Decisor',
                        )),
                        DataCell(inputSlider(
                            registroSub.merClienteDecisor, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Da los recursos',
                        )),
                        DataCell(inputSlider(
                            registroSub.merClienteRecursos, 0.0, 1.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Expectativa',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (25)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Calidad',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaCompranCalidad,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Servicio',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaCompranServicio,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Precio',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaCompranPrecio, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Mercado',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaFijaMercado, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Competencia',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaFijaCompetencia,
                            0.0,
                            4.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Costo',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaFijaCosto, 0.0, 3.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Liricos',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaFijaLirico, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Oferente 1/2,1/2\nConsumidor',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaCanalOferente1,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Oferente 1/2\nConsumidor',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaCanalOferente2,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Oferente - Consumidor',
                        )),
                        DataCell(inputSlider(
                            registroSub.merExpectativaCanalOferente3,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Tiene identificados',
                        )),
                        DataCell(inputSlider(
                            registroSub.merCompetenciaIdentificador, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Cantidad',
                        )),
                        DataCell(inputSlider(
                            registroSub.merCompetenciaEvCantidad, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Calidad',
                        )),
                        DataCell(inputSlider(
                            registroSub.merCompetenciaEvCalidad, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Precio',
                        )),
                        DataCell(inputSlider(
                            registroSub.merCompetenciaEvPrecio, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Fuerzas',
                        )),
                        DataCell(inputSlider(
                            registroSub.merCompetenciaMenFuerzas, 0.0, 1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Debilidades',
                        )),
                        DataCell(inputSlider(
                            registroSub.merCompetenciasMenDebilidades,
                            0.0,
                            1.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Comercialización',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (20)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Personales',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionSisPersonales,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Masivos',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionSisMasivos,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Expectativa',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionSisExpectativa,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Emblema',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionImEmblema,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Logotipo',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionImLogotipo,
                            0.0,
                            3.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Número de Vendedores',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenVendedores,
                            0.0,
                            1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Reparto Territorio',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenTerritorio,
                            0.0,
                            1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Equipo de Ventas',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenEquipo,
                            0.0,
                            1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Plan de presentación',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenPlan, 0.0, 1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Entrenamiento',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenEntrenamiento,
                            0.0,
                            1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Cuotas',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenCuotas,
                            0.0,
                            1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Presupuestos',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenPresupuestos,
                            0.0,
                            1.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Reportes',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenReportes,
                            0.0,
                            2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Rentabilidad',
                        )),
                        DataCell(inputSlider(
                            registroSub.merComercializacionVenRentabilidad,
                            0.0,
                            1.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Reportes de Mercado',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (5)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Clientes',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesClientes, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Producto y/o Servicio',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesProducto, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Canal de Distribución',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesCanal, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Canal de Distribución',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesCanal, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Precio',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesPrecio, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Competencia',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesCompetencia, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Sistemas de Información\nVentas',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesSistemas, 0.0, 5.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Lírico',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesLirico, 0.0, 2.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Manual',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesManual, 0.0, 4.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Computarizado',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesComputarizado, 0.0, 4.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Personal',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesPersonal, 0.0, 4.0)),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Organizacional',
                        )),
                        DataCell(inputSlider(
                            registroSub.merReportesOrganizacional, 0.0, 5.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Comentarios de Mercado Paramétrico',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroSub.merComentariosMercado,
                  onChangedValue: (value) =>
                      registroSub.merComentariosMercado = value,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios de Mercado Paramétrico',
                  hintText: 'Comentarios de Mercado Paramétrico',
                  valueNullable: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget inputSlider(variable, double min, double max) {
  double value_ = 0;
  return SizedBox(
    width: 130,
    child: StatefulBuilder(
      builder: (context, state) => Center(
        child: Slider(
          activeColor: const Color(0XffA73030),
          value: value_,
          min: min,
          max: max,
          divisions: max.toInt(),
          label: value_.round().toString(),
          onChanged: (val) {
            state(() {
              value_ = val;
              variable = '$val';
            });
          },
        ),
      ),
    ),
  );
}
