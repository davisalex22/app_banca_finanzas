import 'package:app_banca_finanzas/providers/subsistema_mercado_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: const [
              MainHeader(titlePage: 'Registrar Subsistema Mercado')
            ],
          ),
        ),
      ),
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

class _SubMercadoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subMercadoForm = Provider.of<SubMercadoFormProvider>(context);
    final registroSub = subMercadoForm.subMercado;
    double value_ = 0;

    // Empresa
    final empresaService = Provider.of<EmpresasService>(context);
    final List<String> nombresEmpresas = empresaService.empresas
        .map((e) =>
            '${e.empresaNombre.toString()} - ${e.empresaDuenio.toString()}')
        .toList();
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
          CustomCardType2(
            titleCard: 'Seleccione empresa',
            column1: Column(
              children: [
                DropDownSearchList(
                  labelTextInput: 'Seleccione empresa',
                  labelTextSearch: 'Buscar empresa',
                  titleSearch: 'Empresas',
                  listOptions: nombresEmpresas,
                  onChangedValue: (value) => registroSub.empresaDuenio = value,
                  selectedItem: registroSub.empresaDuenio.toString(),
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Políticas de producto y/o servicio',
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
                            'Rentabilidad \nde productos',
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
                          'Nuevos\nproductos',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merPoliticaNuevos),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merPoliticaNuevos = '$val';
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
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
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merSegmentoCliente),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoCliente = '$val';
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Distribución y proporción\npor productos',
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
                                      registroSub.merSegmentoDistribucion),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoDistribucion =
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
                          'Conoce magnitud\nde mercado',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merSegmentoMagnitud),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoMagnitud = '$val';
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
                          'Indicadores clave\nde mercado',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merSegmentoTenIndicadores),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoTenIndicadores =
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
                          'Otras fuentes de\ninformación',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merSegmentoTenFuentes),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoTenFuentes =
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
                          'Mercado potencial\nactual',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merSegmentoPotenActual),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoPotenActual =
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
                          'Mercado potencial\ntendencia',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merSegmentoPotenTendencia),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merSegmentoPotenTendencia =
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
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merClienteUsuario),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merClienteUsuario = '$val';
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
                          'Decisor',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merClienteDecisor),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merClienteDecisor = '$val';
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
                          'Ofrece los recursos',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merClienteRecursos),
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 1,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merClienteRecursos = '$val';
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
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
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaCompranCalidad),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaCompranCalidad =
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
                          'Servicio',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merExpectativaCompranServicio),
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 1,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merExpectativaCompranServicio =
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
                          'Precio',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaCompranPrecio),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaCompranPrecio =
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
                          'Mercado',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaFijaMercado),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaFijaMercado =
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
                          'Competencia',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merExpectativaFijaCompetencia),
                                  min: 0.0,
                                  max: 4.0,
                                  divisions: 4,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merExpectativaFijaCompetencia =
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
                          'Costo',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaFijaCosto),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaFijaCosto =
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
                          'Liricos',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaFijaLirico),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaFijaLirico =
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
                          'Oferente 1/2,1/2\nConsumidor',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaCanalOferente1),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaCanalOferente1 =
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
                          'Oferente 1/2\nConsumidor',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaCanalOferente2),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaCanalOferente2 =
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
                          'Oferente - Consumidor',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merExpectativaCanalOferente3),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merExpectativaCanalOferente3 =
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
                          'Competencia\nidentificados',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merCompetenciaIdentificador),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merCompetenciaIdentificador =
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
                          'Competencia\ncantidad',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merCompetenciaEvCantidad),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merCompetenciaEvCantidad =
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
                          'Competencia\ncalidad',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merCompetenciaEvCalidad),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merCompetenciaEvCalidad =
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
                          'Competencia\nprecio',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merCompetenciaEvPrecio),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merCompetenciaEvPrecio =
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
                          'Competencia\nventajas',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merCompetenciaMenFuerzas),
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 1,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merCompetenciaMenFuerzas =
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
                          'Competencia\ndebilidades',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(
                                    registroSub.merCompetenciasMenDebilidades),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub.merCompetenciasMenDebilidades =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
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
                          'Anuncios\npersonales',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merComercializacionSisPersonales),
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 1,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merComercializacionSisPersonales =
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
                          'Anuncios\nmasivos',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merComercializacionSisMasivos),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merComercializacionSisMasivos =
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
                          'Anuncios\nExpectativa',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merComercializacionSisExpectativa),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merComercializacionSisExpectativa =
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
                          'Imágen\nemblema',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merComercializacionImEmblema),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merComercializacionImEmblema =
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
                          'Imágen\nlogotipo',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merComercializacionImLogotipo),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merComercializacionImLogotipo =
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
                          'Número de vendedores',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(registroSub
                                    .merComercializacionVenVendedores),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub
                                            .merComercializacionVenVendedores =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Reparto territorio',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(registroSub
                                    .merComercializacionVenTerritorio),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub
                                            .merComercializacionVenTerritorio =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Equipo de ventas',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(
                                    registroSub.merComercializacionVenEquipo),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub.merComercializacionVenEquipo =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Plan de presentación',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merComercializacionVenPlan),
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 1,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merComercializacionVenPlan =
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
                          'Entrenamiento',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(registroSub
                                    .merComercializacionVenEntrenamiento),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub
                                            .merComercializacionVenEntrenamiento =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Cuotas',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(
                                    registroSub.merComercializacionVenCuotas),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub.merComercializacionVenCuotas =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Presupuestos',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(registroSub
                                    .merComercializacionVenPresupuestos),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub
                                            .merComercializacionVenPresupuestos =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Reportes',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merComercializacionVenReportes),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merComercializacionVenReportes =
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
                          'Rentabilidad\nvendedor',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .merComercializacionVenRentabilidad),
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 1,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .merComercializacionVenRentabilidad =
                                          '$val';
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Reportes de mercado',
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
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesClientes),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesClientes = '$val';
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
                          'Producto y/o servicio',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesProducto),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesProducto = '$val';
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
                          'Canal de distribución',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.merReportesCanal),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesCanal = '$val';
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
                          'Precio',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesPrecio),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesPrecio = '$val';
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
                          'Competencia',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesCompetencia),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesCompetencia =
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
                          'Sistemas de información',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesSistemas),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesSistemas = '$val';
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
                          'Ventas',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesVentas),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesVentas = '$val';
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
                          'Forma\nlírico',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesLirico),
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesLirico = '$val';
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
                          'Forma\nmanual',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value:
                                    valueSlider(registroSub.merReportesManual),
                                min: 0.0,
                                max: 4.0,
                                divisions: 4,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub.merReportesManual = '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Forma\ncomputarizado',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(
                                    registroSub.merReportesComputarizado),
                                min: 0.0,
                                max: 1.0,
                                divisions: 1,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub.merReportesComputarizado =
                                        '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Forma\npersonal',
                        )),
                        DataCell(SizedBox(
                          width: 130,
                          child: StatefulBuilder(
                            builder: (context, state) => Center(
                              child: Slider(
                                activeColor: const Color(0XffA73030),
                                value: valueSlider(
                                    registroSub.merReportesPersonal),
                                min: 0.0,
                                max: 4.0,
                                divisions: 4,
                                label: value_.round().toString(),
                                onChanged: (val) {
                                  state(() {
                                    value_ = val;
                                    registroSub.merReportesPersonal = '$val';
                                  });
                                },
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'Forma\norganizacional',
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(
                                      registroSub.merReportesOrganizacional),
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.merReportesOrganizacional =
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
                  ],
                )
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Comentarios de mercado paramétrico',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroSub.merComentariosMercado,
                  onChangedValue: (value) =>
                      registroSub.merComentariosMercado = value,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios de mercado paramétrico',
                  hintText: 'Comentarios de mercado paramétrico',
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
