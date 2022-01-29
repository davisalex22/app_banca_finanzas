import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/providers/empresa_form_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistroEmpresaScreen extends StatelessWidget {
  const RegistroEmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresaService = Provider.of<EmpresasService>(context);

    return ChangeNotifierProvider(
      create: (_) => EmpresaFormProvider(empresaService.selectedEmpresa),
      child: _EmpresaScreenBody(empresaService: empresaService),
    );
  }
}

class _EmpresaScreenBody extends StatelessWidget {
  const _EmpresaScreenBody({
    Key? key,
    required this.empresaService,
  }) : super(key: key);

  final EmpresasService empresaService;

  @override
  Widget build(BuildContext context) {
    final empresaForm = Provider.of<EmpresaFormProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            _EmpresaForm(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomAlert(
                titleAlert: 'Información',
                contentAlert: '¿Deseas guardar los cambios?',
                onPressedValue: empresaService.isSaving
                    ? null
                    : () async {
                        if (empresaForm.isValidForm()) {
                          Navigator.of(context).pop();
                          final String? imageUrl =
                              await empresaService.uploadImage();
                          if (imageUrl != null) {
                            empresaForm.empresa.picture = imageUrl;
                          }
                          await empresaService
                              .saveOrCreateProduct(empresaForm.empresa);
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.success(
                              message: "Información guardada correctamente",
                            ),
                          );
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "Faltan completar la información",
                            ),
                          );
                        }

                        // if (imageUrl != null) productForm.product.picture = imageUrl;
                      },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _EmpresaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final empresaForm = Provider.of<EmpresaFormProvider>(context);
    final registroEmp = empresaForm.empresa;
    final empresariosService = Provider.of<EmpresariosService>(context);
    final empresaService = Provider.of<EmpresasService>(context);
    final List<String> nombresEmpresarios = empresariosService.empresarios
        .map((e) => e.empresarioNombre.toString())
        .toList();
    return Form(
      key: empresaForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const MainHeader(titlePage: 'Registro de Empresa'),
          CustomCardType2(
            titleCard: 'Seleccione empresario',
            column1: Column(
              children: [
                DropDownSearchList(
                  labelTextInput: 'Seleccione empresario',
                  labelTextSearch: 'Buscar empresario',
                  titleSearch: 'Empresarios',
                  listOptions: nombresEmpresarios,
                  onChangedValue: (value) => registroEmp.empresaDuenio = value,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Información general',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresaNombre,
                  onChangedValue: (value) => registroEmp.empresaNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaDireccion,
                  onChangedValue: (value) =>
                      registroEmp.empresaDireccion = value,
                  labelText: 'Dirección',
                  hintText: 'Dirección',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaTelefono,
                  onChangedValue: (value) =>
                      registroEmp.empresaTelefono = value,
                  labelText: 'Correo, teléfono, etc',
                  hintText: 'Contactos',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaRfc,
                  onChangedValue: (value) => registroEmp.empresaRfc = value,
                  labelText: 'R.F.C',
                  hintText: 'R.F.C',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaDomicilioFiscal,
                  onChangedValue: (value) =>
                      registroEmp.empresaDomicilioFiscal = value,
                  labelText: 'Domicilio fiscal',
                  valueNullable: true,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Antiguedad de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresaAniosInicio,
                  onChangedValue: (value) =>
                      registroEmp.empresaAniosInicio = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Año de inicio la empresa',
                  hintText: 'Año de inicio la empresa',
                  valueNullable: true,
                ),
              ],
            ),
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresaAniosAntiguedad,
                  onChangedValue: (value) =>
                      registroEmp.empresaAniosAntiguedad = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Años de la empresa',
                  hintText: 'Años de la empresa',
                  valueNullable: true,
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Estatus legal de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empEstLegalPersonaFisica,
                  onChangedValue: (value) =>
                      registroEmp.empEstLegalPersonaFisica = value,
                  labelText: 'Persona física',
                  hintText: 'Persona física',
                  valueNullable: true,
                ),
              ],
            ),
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empEstLegalPersonaMoral,
                  onChangedValue: (value) =>
                      registroEmp.empEstLegalPersonaMoral = value,
                  labelText: 'Persona moral',
                  hintText: 'Persona moral',
                  valueNullable: true,
                ),
              ],
            ),
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empEstLegalNoRegistrada,
                  onChangedValue: (value) =>
                      registroEmp.empEstLegalNoRegistrada = value,
                  labelText: 'Persona no registrada',
                  hintText: 'Persona no registrada',
                  valueNullable: true,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Estatus fiscal de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empEstatusFiscal,
                  onChangedValue: (value) =>
                      registroEmp.empEstatusFiscal = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Estatus fiscal de la empresa',
                  hintText: 'Estatus fiscal de la empresa',
                  valueNullable: true,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Tamaño de la empresa',
            subTitleCard1: 'Número de empleados',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empTamNumEmpOperativos,
                  onChangedValue: (value) =>
                      registroEmp.empTamNumEmpOperativos = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Operativos',
                  hintText: 'Operativos',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empTamNumEmpAdministrativos,
                  onChangedValue: (value) =>
                      registroEmp.empTamNumEmpAdministrativos = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Administrativos',
                  hintText: 'Administrativos',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empTamNumEmpOtros,
                  onChangedValue: (value) =>
                      registroEmp.empTamNumEmpOtros = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Otros',
                  hintText: 'Otros',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empTamNumEmpTotal,
                  onChangedValue: (value) =>
                      registroEmp.empTamNumEmpTotal = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Total',
                  hintText: 'Total',
                  valueNullable: true,
                ),
                CustomInputField(
                    initialValue: registroEmp.empTamNumEmpComentarios,
                    onChangedValue: (value) =>
                        registroEmp.empTamNumEmpComentarios = value,
                    minLines: 3,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    labelText: 'Comentarios',
                    hintText: 'Comentarios',
                    valueNullable: false),
              ],
            ),
            subTitleCard2: 'Ventas',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empVentasDiarias,
                  onChangedValue: (value) =>
                      registroEmp.empVentasDiarias = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Diarias',
                  hintText: 'Diarias',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empVentasSemanales,
                  onChangedValue: (value) =>
                      registroEmp.empVentasSemanales = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Semanales',
                  hintText: 'Semanales',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empVentasMensuales,
                  onChangedValue: (value) =>
                      registroEmp.empVentasMensuales = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Mensuales',
                  hintText: 'Mensuales',
                  valueNullable: true,
                ),
              ],
            ),
            subTitleCard3: 'Valor de los activos',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empValActivosTerreno,
                  onChangedValue: (value) =>
                      registroEmp.empValActivosTerreno = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Terreno',
                  hintText: 'Terreno',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empValActivosBienes,
                  onChangedValue: (value) =>
                      registroEmp.empValActivosBienes = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Bienes',
                  hintText: 'Bienes',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empValActivosOtros,
                  onChangedValue: (value) =>
                      registroEmp.empValActivosOtros = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Otros',
                  hintText: 'Otros',
                  valueNullable: true,
                ),
              ],
            ),
            subTitleCard4: 'Cálculos',
            column4: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empCalculosVentasEmpleados,
                  onChangedValue: (value) =>
                      registroEmp.empCalculosVentasEmpleados = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Ventas / Empleado',
                  hintText: 'Ventas / Empleado',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empCalculosVentasActivos,
                  onChangedValue: (value) =>
                      registroEmp.empCalculosVentasActivos = value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Ventas / Activo',
                  hintText: 'Ventas / Activo',
                  valueNullable: true,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Cobertura de mercado de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empCobMercadoLocal,
                  onChangedValue: (value) =>
                      registroEmp.empCobMercadoLocal = value,
                  labelText: 'Local',
                  hintText: 'Local',
                  valueNullable: true,
                ),
              ],
            ),
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empCobMercadoRegional,
                  onChangedValue: (value) =>
                      registroEmp.empCobMercadoRegional = value,
                  labelText: 'Regional',
                  hintText: 'Regional',
                  valueNullable: false,
                ),
              ],
            ),
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empCobMercadoInternacional,
                  onChangedValue: (value) =>
                      registroEmp.empCobMercadoInternacional = value,
                  labelText: 'Internacional',
                  hintText: 'Internacional',
                  valueNullable: false,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Visión de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empVisionCortoPlazo,
                  onChangedValue: (value) =>
                      registroEmp.empVisionCortoPlazo = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Corto plazo',
                  hintText: 'Corto plazo',
                  valueNullable: false,
                ),
              ],
            ),
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empVisionLargoPlazo,
                  onChangedValue: (value) =>
                      registroEmp.empVisionLargoPlazo = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Largo plazo',
                  hintText: 'Largo plazo',
                  valueNullable: false,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Comentario ejecutivo de antecedendes de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empComentarioEjecutivo,
                  onChangedValue: (value) =>
                      registroEmp.empComentarioEjecutivo = value,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText:
                      'Comentario ejecutivo de antecedendes de la empresa',
                  hintText:
                      'Comentario ejecutivo de antecedendes de la empresa',
                  valueNullable: false,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Organigrama de la empresa',
            column1: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.camera, imageQuality: 100);

                        if (pickedFile == null) {
                          return;
                        }

                        empresaService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                      icon: const Icon(Icons.camera_alt_outlined,
                          size: 40, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.gallery, imageQuality: 100);

                        if (pickedFile == null) {
                          // print('No seleccionó nada');
                          return;
                        }

                        empresaService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                      icon: const Icon(Icons.photo_size_select_large_rounded,
                          size: 40, color: Colors.black),
                    ),
                  ],
                ),
                OrganigramaImage(
                  url: empresaForm.empresa.picture,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
