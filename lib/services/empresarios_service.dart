import 'dart:convert';
import 'package:app_banca_finanzas/models/empresario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class EmpresariosService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<Empresario> empresarios = [];
  final selectedEmpresario = Empresario();
  bool isLoading = true;
  final storage = const FlutterSecureStorage();
  EmpresariosService() {
    loadEmpresarios();
  }
  //<List<Empresario>>
  Future<List<Empresario>> loadEmpresarios() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'RegistrosEmpresarios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> empresariosMap = json.decode(resp.body);

    empresariosMap.forEach((key, value) {
      final tempEmp = Empresario.fromMap(value);
      tempEmp.id = key;
      empresarios.add(tempEmp);
    });
    print(empresarios);
    isLoading = false;
    notifyListeners();

    return empresarios;
  }

  Future<String> createEmpresario(Empresario empresario) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresarios.json');

    final resp = await http.post(url, body: empresario.toJson());
    final decodedData = json.decode(resp.body);

    empresario.id = decodedData['name'];
    print("object");
    empresarios.add(empresario);
    notifyListeners();

    return empresario.id!;
  }
}
