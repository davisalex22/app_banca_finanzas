import 'package:app_banca_finanzas/providers/subsistema_produccion_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistroSubProduccionScreen extends StatelessWidget {
  const RegistroSubProduccionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final subProduccionService = Provider.of<SubProduccionService>(context);

    return ChangeNotifierProvider(
      create: (_) =>
          SubProduccionFormProvider(subProduccionService.selectedsubProduccion),
      child:
          _SubProduccionScreenBody(subProduccionService: subProduccionService),
    );
  }
}

class _SubProduccionScreenBody extends StatelessWidget {
  const _SubProduccionScreenBody({
    Key? key,
    required this.subProduccionService,
  }) : super(key: key);

  final SubProduccionService subProduccionService;

  @override
  Widget build(BuildContext context) {
    final subProduccionForm = Provider.of<SubProduccionFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            _SubProduccionForm(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomAlert(
                titleAlert: 'Información',
                contentAlert: '¿Desea guardar los cambios?',
                onPressedValue: subProduccionService.isSaving
                    ? null
                    : () async {
                        if (subProduccionForm.isValidForm()) {
                          Navigator.of(context).pop();
                          await subProduccionService.saveOrCreateSubProduccion(
                              subProduccionForm.subProduccion);
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

class _SubProduccionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subProduccionForm = Provider.of<SubProduccionFormProvider>(context);
    final registroSub = subProduccionForm.subProduccion;
    double value_ = 0;

    valueSlider(String? campo) {
      if (campo == null) {
        return value_;
      } else {
        return double.parse(campo);
      }
    }

    return Form(
      key: subProduccionForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const MainHeader(
            titlePage: 'Registrar Sub-sistema Producción',
          ),
          CustomCardType2(
            titleCard: 'Materiales',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (10)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          child: Text(
                            'Canditidad de materiales\ncompras',
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
                                      registroSub.prodMatCantidadCompras),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCantidadCompras =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Canditidad de materiales\ninventarios',
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
                                      registroSub.prodMatCantidadInventarios),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCantidadInventarios =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de materiales\natributos físicos',
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
                                      registroSub.prodMatCalidadAtributos),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCalidadAtributos =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de materiales\nestandarización',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub
                                      .prodMatCalidadEstandarizacion),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub
                                              .prodMatCalidadEstandarizacion =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de materiales\ntrabajabilidad',
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
                                      registroSub.prodMatCalidadTrabajabilidad),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCalidadTrabajabilidad =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de materiales\ndisponibilidad',
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
                                      registroSub.prodMatCalidadDisponibilidad),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCalidadDisponibilidad =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de materiales\ntiempo de entregas',
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
                                      registroSub.prodMatCalidadEntregas),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCalidadEntregas =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de materiales\nprecio',
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
                                      registroSub.prodMatCalidadPrecio),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMatCalidadPrecio = '$val';
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
            titleCard: 'Ubicación del lugar de trabajo',
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
                            'Materia prima',
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
                                      registroSub.prodUbiMateriaPrima),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiMateriaPrima = '$val';
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
                            'Mano de obra',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodUbiManoObra),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiManoObra = '$val';
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
                            'Clientes',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodUbiClientes),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiClientes = '$val';
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
                            'Medio ambiente',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodUbiEconomico),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiMedioAmbiente = '$val';
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
            titleCard: 'Ubicación del lugar de trabajo',
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
                            'Materia prima',
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
                                      registroSub.prodUbiMateriaPrima),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiMateriaPrima = '$val';
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
                            'Mano de obra',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodUbiManoObra),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiManoObra = '$val';
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
                            'Clientes',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodUbiClientes),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiClientes = '$val';
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
                            'Medio ambiente',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodUbiEconomico),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodUbiMedioAmbiente = '$val';
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
            titleCard: 'Lugar de Trabajo',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (20)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          child: Text(
                            'Edificio',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodLugEdificio),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugEdificio = '$val';
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
                            'Espacio',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodLugEspacio),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugEspacio = '$val';
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
                            'Ambientacion Temperatura',
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
                                      registroSub.prodLugAmbTemperatura),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbTemperatura =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Ambientación Luz',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub.prodLugAmbLuz),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbLuz = '$val';
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
                            'Ambientación Ruido',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodLugAmbRuido),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbRuido = '$val';
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
                            'Ambientación Colores',
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
                                      registroSub.prodLugAmbColores),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbColores = '$val';
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
                            'Ambientación Ventilación',
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
                                      registroSub.prodLugAmbVentilacion),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbVentilacion =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Ambientación\nInstalaciones sanitarias',
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
                                      registroSub.prodLugAmbSanitarias),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbSanitarias = '$val';
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
                            'Ambientación Lockers',
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
                                      registroSub.prodLugAmbLockers),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbLockers = '$val';
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
                            'Ambientación Alimentos',
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
                                      registroSub.prodLugAmbAlimentos),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbAlimentos = '$val';
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
                            'Seguridad Industrial\nequipos',
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
                                      registroSub.prodLugAmbSegSeguridad),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbSegSeguridad =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Seguridad Industrial\nbotiquín',
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
                                      registroSub.prodLugAmbSegBotiquin),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbSegBotiquin =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Seguridad Industrial\nteléfono de emergencia',
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
                                      registroSub.prodLugAmbSegTelefono),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugAmbSegTelefono =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Dstribución\npor puesto',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodLugDisPuesto),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugDisPuesto = '$val';
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
                            'Dstribución\npor taller',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodLugDisTaller),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugDisTaller = '$val';
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
                            'Dstribución\npor línea',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodLugDisLinea),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodLugDisLinea = '$val';
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
            titleCard: 'Procedimientos de trabajo',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (15)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          child: Text(
                            'Procesos / Tareas',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodProcProcesos),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcProcesos = '$val';
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
                            'Normas / Tiempo',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodProcNormas),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcNormas = '$val';
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
                            'Desperdicios',
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
                                      registroSub.prodProcDesperdicios),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcDesperdicios = '$val';
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
                            'Ocios',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub.prodProcOcios),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcOcios = '$val';
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
                            'Dispositivos de medición',
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
                                      registroSub.prodProcDispositivos),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcDispositivos = '$val';
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
                            'Costos Fijos',
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
                                      registroSub.prodProcCostosFijos),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcCostosFijos = '$val';
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
                            'Costos Variables',
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
                                      registroSub.prodProcCostosVariables),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcCostosVariables =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Manejo de materiales',
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
                                      registroSub.prodProcMateriales),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcMateriales = '$val';
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
                            'Embarques',
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
                                      registroSub.prodProcEmbarques),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodProcEmbarques = '$val';
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
            titleCard: 'Maquinaria y equipo',
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
                            'Adecuado',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodMaqAdecuado),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMaqAdecuado = '$val';
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
                            'Suficiente',
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
                                      registroSub.prodMaqSuficiente),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMaqSuficiente = '$val';
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
                            'Mantenimiento',
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
                                      registroSub.prodMaqMantenimiento),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodMaqMantenimiento = '$val';
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
            titleCard: 'Calidad',
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
                            'Es estándar',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodCalEstandar),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodCalEstandar = '$val';
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
                            'Mejora de Procesos',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodCalMejoras),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodCalMejoras = '$val';
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
                            'Tecnología Actualizada',
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
                                      registroSub.prodCalTecnologia),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodCalTecnologia = '$val';
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
            titleCard: 'Reportes de producción',
            column1: Column(
              children: [
                CardTableSubsistemas(
                  columnVar1: 'Máximo de puntos (25)',
                  columnVar2: '',
                  dataRow: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          child: Text(
                            'Calidad de los\nmateriales',
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
                                      registroSub.prodRepCalidadMateriales),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepCalidadMateriales =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Costos de los\nmateriales',
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
                                      registroSub.prodRepCostosMateriales),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepCostosMateriales =
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
                        const DataCell(SizedBox(
                          child: Text(
                            'Inventarios de\nmateriales',
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
                                      registroSub.prodRepInventarios),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepInventarios = '$val';
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
                            'Desperdicios',
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
                                      registroSub.prodRepDesperdicios),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepDesperdicios = '$val';
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
                            'Rechazo de los\nproductos',
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
                                      registroSub.prodRepRechazados),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepRechazados = '$val';
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
                            'Forma lírico',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub.prodRepLirico),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepLirico = '$val';
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
                            'Forma manual',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value: valueSlider(registroSub.prodRepManual),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepManual = '$val';
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
                            'Forma Computarizado',
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
                                      registroSub.prodRepComputarizado),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepComputarizado = '$val';
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
                            'Forma Personal',
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: 130,
                            child: StatefulBuilder(
                              builder: (context, state) => Center(
                                child: Slider(
                                  activeColor: const Color(0XffA73030),
                                  value:
                                      valueSlider(registroSub.prodRepPersonal),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepPersonal = '$val';
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
                            'Forma Organizal',
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
                                      registroSub.prodRepOrganizacional),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: value_.round().toString(),
                                  onChanged: (val) {
                                    state(() {
                                      value_ = val;
                                      registroSub.prodRepOrganizacional =
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
            titleCard: 'Comentarios de Producción Paramétrico',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroSub.prodCometarioProduccion,
                  onChangedValue: (value) =>
                      registroSub.prodCometarioProduccion = value,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios de Producción Paramétrico',
                  hintText: 'Comentarios de Producción Paramétrico',
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
