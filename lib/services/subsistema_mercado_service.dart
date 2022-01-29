import 'dart:convert';
import 'package:app_banca_finanzas/models/subsistema_mercado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SubMercadoService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<SubsistemaMercado> subSistemasMercadosList = [];
  late SubsistemaMercado selectedsubMercado;

  final storage = const FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;

  SubMercadoService() {
    loadsubSistemasMercadosList();
  }

  Future loadsubSistemasMercadosList() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'RegistrosSubistemasMercado.json');
    final resp = await http.get(url);

    final Map<String, dynamic> subSistemasMercadosListMap =
        json.decode(resp.body);

    subSistemasMercadosListMap.forEach((key, value) {
      final tempsub = SubsistemaMercado.fromMap(value);
      tempsub.id = key;
      subSistemasMercadosList.add(tempsub);
    });

    isLoading = false;
    notifyListeners();

    return subSistemasMercadosList;
  }

  Future saveOrCreateSubMercado(SubsistemaMercado subMercado) async {
    isSaving = true;
    notifyListeners();

    if (subMercado.id == null) {
      // Es necesario crear
      await createSubMercado(subMercado);
    } else {
      // Actualizar
      await updatesubMercado(subMercado);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updatesubMercado(SubsistemaMercado subMercado) async {
    final url =
        Uri.https(_baseUrl, 'RegistrosSubistemasMercado/${subMercado.id}.json');
    final resp = await http.put(url, body: subMercado.toJson());
    final decodeData = resp.body;

    final index = subSistemasMercadosList
        .indexWhere((element) => element.id == subMercado.id);
    this.subSistemasMercadosList[index] = subMercado;

    return subMercado.id!;
  }

  Future<String> createSubMercado(SubsistemaMercado subMercado) async {
    final url = Uri.https(_baseUrl, 'RegistrosSubistemasMercado.json');

    final resp = await http.post(url, body: subMercado.toJson());
    final decodedData = json.decode(resp.body);

    subMercado.id = decodedData['name'];

    // empresas.add(empresa);

    // return empresa.id!;
    return '';
  }

  Future deleteSubsistema(SubsistemaMercado subMercado) async {
    isLoading = true;
    notifyListeners();
    final url =
        Uri.https(_baseUrl, 'RegistrosSubistemasMercado/${subMercado.id}.json');
    final resp = await http.delete(url);
    final decodeData = resp.body;
    isLoading = false;
    notifyListeners();
    print("eliminado");
  }
}
