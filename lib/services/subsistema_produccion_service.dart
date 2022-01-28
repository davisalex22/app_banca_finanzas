import 'dart:convert';
import 'dart:io';
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

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  SubProduccionService() {
    loadsubSistemasProduccionList();
  }

  Future loadsubSistemasProduccionList() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'RegistrossubSistemasProduccionList.json');
    final resp = await http.get(url);

    final Map<String, dynamic> subSistemasProduccionListMap =
        json.decode(resp.body);
    print(subSistemasProduccionListMap);
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
    final url =
        Uri.https(_baseUrl, 'SubsistemasProduccion/${subProduccion.id}.json');
    final resp = await http.put(url, body: subProduccion.toJson());
    final decodeData = resp.body;

    print(decodeData);
    final index = subSistemasProduccionList
        .indexWhere((element) => element.id == subProduccion.id);
    subSistemasProduccionList[index] = subProduccion;

    return subProduccion.id!;
  }

  Future<String> createSubProduccion(SubsistemaProduccion subProduccion) async {
    final url = Uri.https(_baseUrl, 'SubsistemasProduccion.json');

    final resp = await http.post(url, body: subProduccion.toJson());
    final decodedData = json.decode(resp.body);

    print(decodedData);
    subProduccion.id = decodedData['name'];

    // empresas.add(empresa);

    // return empresa.id!;
    return '';
  }

  // void updateSelectedProductImage(String path) {
  //   selectedE.picture = path;
  //   newPictureFile = File.fromUri(Uri(path: path));

  //   notifyListeners();
  // }

  // Future<String?> uploadImage() async {
  //   if (newPictureFile == null) return null;

  //   isSaving = true;
  //   notifyListeners();

  //   final url = Uri.parse(
  //       'https://api.cloudinary.com/v1_1/dx0pryfzn/image/upload?upload_preset=autwc6pa');

  //   final imageUploadRequest = http.MultipartRequest('POST', url);

  //   final file =
  //       await http.MultipartFile.fromPath('file', newPictureFile!.path);

  //   imageUploadRequest.files.add(file);

  //   final streamResponse = await imageUploadRequest.send();
  //   final resp = await http.Response.fromStream(streamResponse);

  //   if (resp.statusCode != 200 && resp.statusCode != 201) {
  //     // print('algo salio mal');
  //     // print(resp.body);
  //     return null;
  //   }

  //   newPictureFile = null;

  //   final decodedData = json.decode(resp.body);
  //   return decodedData['secure_url'];
  // }
}
