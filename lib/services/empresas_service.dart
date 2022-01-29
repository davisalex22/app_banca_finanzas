import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:app_banca_finanzas/models/models.dart';

class EmpresasService extends ChangeNotifier {
  final String _baseUrl = 'app-banca-finanzas-default-rtdb.firebaseio.com';
  final List<Empresa> empresas = [];
  late Empresa selectedEmpresa;

  final storage = const FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  EmpresasService() {
    loadEmpresas();
  }

  Future loadEmpresas() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'RegistrosEmpresas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> empresasMap = json.decode(resp.body);
    //print(empresasMap);
    empresasMap.forEach((key, value) {
      final tempEmpresa = Empresa.fromMap(value);
      tempEmpresa.id = key;
      empresas.add(tempEmpresa);
    });

    isLoading = false;
    notifyListeners();

    return empresas;
  }

  Future deleteEmpresa(Empresa empresa) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas/${empresa.id}.json');
    final resp = await http.delete(url);
    final decodeData = resp.body;
  }

  Future saveOrCreateProduct(Empresa empresa) async {
    isSaving = true;
    notifyListeners();

    if (empresa.id == null) {
      // Es necesario crear
      await createEmpresa(empresa);
    } else {
      // Actualizar
      await updateEmpresa(empresa);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateEmpresa(Empresa empresa) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas/${empresa.id}.json');
    final resp = await http.put(url, body: empresa.toJson());
    final decodeData = resp.body;

    //print(decodeData);
    final index = empresas.indexWhere((element) => element.id == empresa.id);
    this.empresas[index] = empresa;

    return empresa.id!;
  }

  Future<String> createEmpresa(Empresa empresa) async {
    final url = Uri.https(_baseUrl, 'RegistrosEmpresas.json');

    final resp = await http.post(url, body: empresa.toJson());
    final decodedData = json.decode(resp.body);

    // print(decodedData);
    empresa.id = decodedData['name'];

    // empresas.add(empresa);

    // return empresa.id!;
    return '';
  }

  void updateSelectedProductImage(String path) {
    selectedEmpresa.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/do5rrdvvv/image/upload?upload_preset=tzjq8shc');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      // print('algo salio mal');
      // print(resp.body);
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
