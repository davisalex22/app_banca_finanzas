import 'dart:convert';
import 'package:app_banca_finanzas/models/subsistema_produccion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:app_banca_finanzas/models/models.dart';

class SubProduccionService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<SubsistemaProduccion> subSistemasProduccionList = [];
  late SubsistemaProduccion selectedsubProduccion;

  final storage = const FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;

  SubProduccionService() {
    loadsubSistemasProduccionList();
  }

  Future loadsubSistemasProduccionList() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'RegistrosSubsistemasProduccion.json');
    final resp = await http.get(url);

    final Map<String, dynamic> subSistemasProduccionListMap =
        json.decode(resp.body);

    subSistemasProduccionListMap.forEach((key, value) {
      final tempsub = SubsistemaProduccion.fromMap(value);
      tempsub.id = key;
      subSistemasProduccionList.add(tempsub);
    });

    isLoading = false;
    notifyListeners();

    return subSistemasProduccionList;
  }

  Future saveOrCreateSubProduccion(SubsistemaProduccion subProduccion) async {
    isSaving = true;
    notifyListeners();

    if (subProduccion.id == null) {
      // Es necesario crear
      await createSubProduccion(subProduccion);
    } else {
      // Actualizar
      await updatesubProduccion(subProduccion);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updatesubProduccion(SubsistemaProduccion subProduccion) async {
    final url = Uri.https(
        _baseUrl, 'RegistrosSubistemasProduccion/${subProduccion.id}.json');
    final resp = await http.put(url, body: subProduccion.toJson());
    final decodeData = resp.body;

    final index = subSistemasProduccionList
        .indexWhere((element) => element.id == subProduccion.id);
    this.subSistemasProduccionList[index] = subProduccion;

    return subProduccion.id!;
  }

  Future<String> createSubProduccion(SubsistemaProduccion subProduccion) async {
    final url = Uri.https(_baseUrl, 'RegistrosSubsistemasProduccion.json');

    final resp = await http.post(url, body: subProduccion.toJson());
    final decodedData = json.decode(resp.body);

    subProduccion.id = decodedData['name'];

    subSistemasProduccionList.add(subProduccion);
    return subProduccion.id!;
  }

  Future deleteSubsistema(SubsistemaProduccion subProduccion) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(
        _baseUrl, 'RegistrosSubsistemasProduccion/${subProduccion.id}.json');
    final resp = await http.delete(url);
    final decodeData = resp.body;
    isLoading = false;
    notifyListeners();
  }
}
