import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:app_banca_finanzas/models/models.dart';

class EmpresariosService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<Empresario> empresarios = [];
  late Empresario selectedEmpresario;

  final storage = const FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  EmpresariosService() {
    loadEmpresarios();
  }

  Future loadEmpresarios() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'RegistrosEmpresarios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> empresariosMap = json.decode(resp.body);

    empresariosMap.forEach((key, value) {
      final tempEmpresario = Empresario.fromMap(value);
      tempEmpresario.id = key;
      empresarios.add(tempEmpresario);
    });

    isLoading = false;
    notifyListeners();

    return empresarios;
  }

  Future saveOrCreateEmpresario(Empresario empresario) async {
    isSaving = true;
    notifyListeners();

    if (empresario.id == null) {
      // Es necesario crear
      await createEmpresario(empresario);
    } else {
      // Actualizar
      await updateEmpresario(empresario);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateEmpresario(Empresario empresario) async {
    final url =
        Uri.https(_baseUrl, 'RegistrosEmpresarios/${empresario.id}.json');
    final resp = await http.put(url, body: empresario.toJson());
    final decodeData = resp.body;

    final index =
        empresarios.indexWhere((element) => element.id == empresario.id);
    this.empresarios[index] = empresario;

    return empresario.id!;
  }

  Future deleteEmpresario(Empresario empresario) async {
    final url =
        Uri.https(_baseUrl, 'RegistrosEmpresarios/${empresario.id}.json');
    final resp = await http.delete(url);
    final decodeData = resp.body;
  }

  Future<String> createEmpresario(Empresario empresario) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresarios.json');

    final resp = await http.post(url, body: empresario.toJson());
    final decodedData = json.decode(resp.body);

    empresario.id = decodedData['name'];

    empresarios.add(empresario);

    return empresario.id!;
  }
}
