import 'dart:convert';
import 'package:app_banca_finanzas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmpresasService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<Empresa> empresas = [];
  bool isLoading = true;

  EmpresasService() {
    loadEmpresas();
  }
  //<List<Empresa>>
  Future loadEmpresas() async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> empresasMap = json.decode(resp.body);

    empresasMap.forEach((key, value) {
      final tempEmp = Empresa.fromMap(value);
      tempEmp.id = key;
      empresas.add(tempEmp);
    });
    print(empresas[0].empresaNombre);
    // isLoading = false;
    // notifyListeners();

    // return empresas;
  }
}
