import 'package:app_banca_finanzas/models/subsistema_mercado.dart';
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
    return Form(
      key: subMercadoForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const MainHeader(
            titlePage: 'Registrar Sub-sistema Mercado',
          ),
          CustomCardType2(
              titleCard: 'Generales',
              column1: Column(
                children: [
                  InputSlider3(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  //
                  InputSlider5(registroSub.merClienteDecisor),
                  InputSlider5(registroSub.merClienteDecisor),
                  InputSlider5(registroSub.merClienteDecisor),
                  //
                  InputSlider3(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  //
                  InputSlider3(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  //
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSwitch(
                      "Provee los recursos", registroSub.merClienteDecisor),

                  //
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSwitch("Precio", registroSub.merClienteDecisor),
                  InputSlider5(registroSub.merClienteDecisor),
                  //
                  InputSlider5(registroSub.merClienteDecisor),
                  //
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),
                  InputSlider2(registroSub.merClienteDecisor),

                  InputSwitch("Fuerzas", registroSub.merClienteDecisor),
                  InputSwitch("Debilidades", registroSub.merClienteDecisor),
                ],
              ))
        ],
      ),
    );
  }
}

Widget InputSwitch(str, variable) {
  bool _on = false;
  return StatefulBuilder(
    builder: (context, state) => Center(
      child: SwitchListTile(
        title: Text(str),
        value: _on,
        onChanged: (val) {
          state(() {
            _on = val;
            _on ? variable = 1 : 0;
          });
        },
      ),
    ),
  );
}

Widget InputSlider2(variable) {
  double value_ = 0;
  return StatefulBuilder(
    builder: (context, state) => Center(
      child: Slider(
        value: value_,
        min: 0,
        max: 2,
        divisions: 2,
        label: value_.round().toString(),
        onChanged: (val) {
          state(() {
            value_ = val;
            variable = '$val';
          });
        },
      ),
    ),
  );
}

Widget InputSlider3(variable) {
  double value_ = 0;
  return StatefulBuilder(
    builder: (context, state) => Center(
      child: Slider(
        value: value_,
        min: 0,
        max: 3,
        divisions: 3,
        label: value_.round().toString(),
        onChanged: (val) {
          state(() {
            value_ = val;
            variable = '$val';
          });
        },
      ),
    ),
  );
}

Widget InputSlider5(variable) {
  double value_ = 0;
  return StatefulBuilder(
    builder: (context, state) => Center(
      child: Slider(
        value: value_,
        min: 0,
        max: 5,
        divisions: 5,
        label: value_.round().toString(),
        onChanged: (val) {
          state(() {
            value_ = val;
            variable = '$val';
          });
        },
      ),
    ),
  );
}
