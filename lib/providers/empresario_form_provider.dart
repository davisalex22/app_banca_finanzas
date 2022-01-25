import 'package:app_banca_finanzas/models/empresario.dart';
import 'package:flutter/material.dart';

class EmpresarioFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Empresario empresario;
  EmpresarioFormProvider(this.empresario);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
