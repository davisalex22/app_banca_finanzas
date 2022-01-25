import 'package:app_banca_finanzas/models/empresa.dart';
import 'package:flutter/material.dart';

class EmpresaFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Empresa empresa;
  EmpresaFormProvider(this.empresa);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
