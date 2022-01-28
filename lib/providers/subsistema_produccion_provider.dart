import 'package:app_banca_finanzas/models/subsistema_produccion.dart';
import 'package:flutter/material.dart';

class SubProduccionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SubsistemaProduccion subProduccion;
  SubProduccionFormProvider(this.subProduccion);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
