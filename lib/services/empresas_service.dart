import 'dart:convert';
import 'package:app_banca_finanzas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class EmpresasService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<Empresa> empresas = [];
  final selectedEmpresa = Empresa();
  bool isLoading = true;
  final storage = const FlutterSecureStorage();
  EmpresasService() {
    loadEmpresas();
  }
  //<List<Empresa>>
  Future<List<Empresa>> loadEmpresas() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> empresasMap = json.decode(resp.body);

    empresasMap.forEach((key, value) {
      final tempEmp = Empresa.fromMap(value);
      tempEmp.id = key;
      empresas.add(tempEmp);
    });
    print(empresas);
    isLoading = false;
    notifyListeners();

    return empresas;
  }

  Future<String> createEmpresa(Empresa empresa) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas.json');

    final resp = await http.post(url, body: empresa.toJson());
    final decodedData = json.decode(resp.body);

    empresa.id = decodedData['name'];

    empresas.add(empresa);
    notifyListeners();

    return empresa.id!;
  }
}
