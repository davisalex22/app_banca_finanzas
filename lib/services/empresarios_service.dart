import 'dart:convert';
import 'dart:io';
import 'dart:math';
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

    final url = Uri.https(_baseUrl, 'RegistroEmpresarios.json');
    final resp = await http.get(url);

    final Map<String, dynamic> empresariosMap = json.decode(resp.body);
    print(empresariosMap);
    empresariosMap.forEach((key, value) {
      final tempEmpresario = Empresario.fromMap(value);
      tempEmpresario.id = key;
      empresarios.add(tempEmpresario);
    });

    isLoading = false;
    notifyListeners();

    return empresarios;
  }

  Future saveOrCreateProduct(Empresario empresario) async {
    isSaving = true;
    notifyListeners();

    if (empresario.id == null) {
      // Es necesario crear
      await createEmpresa(empresario);
    } else {
      // Actualizar
      await updateEmpresa(empresario);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateEmpresa(Empresario empresario) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas/${empresario.id}.json');
    final resp = await http.put(url, body: empresario.toJson());
    final decodeData = resp.body;

    print(decodeData);
    final index =
        empresarios.indexWhere((element) => element.id == empresario.id);
    empresarios[index] = empresario;

    return empresario.id!;
  }

  Future<String> createEmpresa(Empresario empresario) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas.json');

    final resp = await http.post(url, body: empresario.toJson());
    final decodedData = json.decode(resp.body);

    print(decodedData);
    empresario.id = decodedData['name'];

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
