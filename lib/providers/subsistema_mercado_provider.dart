import 'package:app_banca_finanzas/models/subsistema_mercado.dart';
import 'package:flutter/material.dart';

class SubMercadoFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SubsistemaMercado subMercado;
  SubMercadoFormProvider(this.subMercado);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
