import 'package:app_banca_finanzas/providers/empresario_form_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistroEmpresarioScreen extends StatelessWidget {
  const RegistroEmpresarioScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final empresarioService = Provider.of<EmpresariosService>(context);
    return ChangeNotifierProvider(
      create: (_) =>
          EmpresarioFormProvider(empresarioService.selectedEmpresario),
      child: _EmpresarioScreenBody(empresarioService: empresarioService),
    );
  }
}

class _EmpresarioScreenBody extends StatelessWidget {
  const _EmpresarioScreenBody({
    Key? key,
    required this.empresarioService,
  }) : super(key: key);

  final EmpresariosService empresarioService;

  @override
  Widget build(BuildContext context) {
    final empresarioForm = Provider.of<EmpresarioFormProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: const [MainHeader(titlePage: 'Registrar Empresario')],
          ),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            _EmpresarioForm(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomAlert(
                titleAlert: 'Información',
                contentAlert: '¿Desea guardar los cambios?',
                onPressedValue: empresarioService.isSaving
                    ? null
                    : () async {
                        if (empresarioForm.isValidForm()) {
                          Navigator.of(context).pop();
                          await empresarioService.saveOrCreateEmpresario(
                              empresarioForm.empresario);
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
                              message: "Faltan campos por llenar",
                            ),
                          );
                        }
                      },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(
        actualPage: 0,
        iconOption: Icon(Icons.my_library_books_sharp),
        nameOption: 'Registros',
        currentIndex: 0,
        routePage: '/empresario',
      ),
    );
  }
}

class _EmpresarioForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Empresario
    final empresarioForm = Provider.of<EmpresarioFormProvider>(context);
    final registroEmp = empresarioForm.empresario;
    // Empresa
    final empresaService = Provider.of<EmpresasService>(context);
    final List<String> nombresEmpresas =
        empresaService.empresas.map((e) => e.empresaNombre.toString()).toList();

    return Form(
      key: empresarioForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomCardType2(
            titleCard: 'Seleccione empresa',
            column1: Column(
              children: [
                DropDownSearchList(
                  labelTextInput: 'Seleccione empresa',
                  labelTextSearch: 'Buscar empresa',
                  titleSearch: 'Empresas',
                  listOptions: nombresEmpresas,
                  onChangedValue: (value) => registroEmp.empresaDuenio = value,
                  selectedItem: registroEmp.empresaDuenio.toString(),
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Generales',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresarioNombre,
                  onChangedValue: (value) =>
                      registroEmp.empresarioNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioDireccion,
                  onChangedValue: (value) =>
                      registroEmp.empresarioDireccion = value,
                  labelText: 'Dirección',
                  hintText: 'Dirección',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioTelefono,
                  onChangedValue: (value) =>
                      registroEmp.empresarioTelefono = value,
                  labelText: 'Teléfono',
                  hintText: 'Teléfono',
                  valueNullable: true,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Antecedentes del empresario',
            subTitleCard1: 'El empresario',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresarioOriginario,
                  onChangedValue: (value) =>
                      registroEmp.empresarioOriginario = value,
                  labelText: 'Originario',
                  hintText: 'Originario',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioLugar,
                  onChangedValue: (value) =>
                      registroEmp.empresarioLugar = value,
                  labelText: 'Lugar',
                  hintText: 'Lugar',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioEdad,
                  onChangedValue: (value) => registroEmp.empresarioEdad = value,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: DropdownSearch<String>(
                    validator: (v) => v == null ? "required field" : null,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Estado civil",
                      labelText: "Estado civil",
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    onChanged: (value) =>
                        registroEmp.empresarioEstadoCivil = value,
                    items: const [
                      "Soltero/a",
                      "Casado/a",
                      "Divorciado/a",
                      "Viudo/a"
                    ],
                    showClearButton: false,
                    clearButtonSplashRadius: 20,
                    selectedItem: "Soltero/a",
                  ),
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.empresarioOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.empresarioEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  valueNullable: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.empresarioEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioComentario,
                  onChangedValue: (value) =>
                      registroEmp.empresarioComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios del empresario',
                  hintText: 'Comentarios del empresario',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard2: 'Los padres',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprPadresNombres,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresNombres = value,
                  labelText: 'Nombres',
                  hintText: 'Nombres',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresOriginarios,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresOriginarios = value,
                  labelText: 'Originarios',
                  hintText: 'Originarios',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresViven,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresViven = value,
                  labelText: 'Viven',
                  hintText: 'Viven',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresLugar,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresLugar = value,
                  labelText: 'Lugar',
                  hintText: 'Lugar',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresEdad,
                  onChangedValue: (value) => registroEmp.emprPadresEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresComentario,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios de los padres',
                  hintText: 'Comentarios de los padres',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard3: 'Número de hermanos nacidos',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprHermanosNombres,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosNombres = value,
                  labelText: 'Nombres',
                  hintText: 'Nombres',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprHermanosEdad,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosEdad = value,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprHermanosOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprHermanosLugarHermanos,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosLugarHermanos = value,
                  labelText: 'Lugar dentro de sus hermanos',
                  hintText: 'Lugar dentro de sus hermanos',
                  valueNullable: false,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Antecedentes de la pareja',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprParejaNombre,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaOriginaria,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaOriginaria = value,
                  labelText: 'Originaria',
                  hintText: 'Originaria',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaVive,
                  onChangedValue: (value) => registroEmp.emprParejaVive = value,
                  labelText: 'Vive',
                  hintText: 'Vive',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaLugar,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaLugar = value,
                  labelText: 'En que Lugar',
                  hintText: 'En que Lugar',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaEdad,
                  onChangedValue: (value) => registroEmp.emprParejaEdad = value,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaComentario,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios de la pareja',
                  hintText: 'Comentarios de la pareja',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard2: 'Los suegros',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosNombre,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosOriginarios,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosOriginarios = value,
                  labelText: 'Originarios',
                  hintText: 'Originarios',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosViven,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosViven = value,
                  labelText: 'Viven',
                  hintText: 'Viven',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosLugar,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosLugar = value,
                  labelText: 'En que Lugar',
                  hintText: 'En que Lugar',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosEdad,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosComentario,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios de los suegros',
                  hintText: 'Comentarios de los suegros',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard3: 'Número de cuñados',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosNombre,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosNombre = value,
                  labelText: 'Nombres',
                  hintText: 'Nombres',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosEdad,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosLugarHermanos,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosLugarHermanos = value,
                  labelText: 'Lugar dentro de sus hermanos',
                  hintText: 'Lugar dentro de sus hermanos',
                  valueNullable: false,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'El matrimonio',
            subTitleCard1: 'Años de Casado',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioAniosCasado,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioAniosCasado = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Años de Casado',
                  hintText: 'Años de Casado',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard2: 'Situación afectiva del matrimonio',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioSituacionAfectiva,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioSituacionAfectiva = value,
                  labelText: 'Situación afectiva del matrimonio',
                  hintText: 'Situación afectiva del matrimonio',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard3: 'Hijos',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHNumeroHijos,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHNumeroHijos = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Número de hijos',
                  hintText: 'Número de hijos',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHEdad,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHEdad = value,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  valueNullable: false,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  valueNullable: false,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Filosofía Y/O Carácter',
            subTitleCard1: 'Hobbies,Color,Personas',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprFilosofiaHobbies,
                  onChangedValue: (value) =>
                      registroEmp.emprFilosofiaHobbies = value,
                  labelText: 'Hobbies, Color, Personas',
                  hintText: 'Hobbies, Color, Personas',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard2: 'Comentarios',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprFilosofiaComentario,
                  onChangedValue: (value) =>
                      registroEmp.emprFilosofiaComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios',
                  hintText: 'Comentarios',
                  valueNullable: false,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Metas personales',
            subTitleCard1: 'Metas personales',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMetasProfesionales,
                  onChangedValue: (value) =>
                      registroEmp.emprMetasProfesionales = value,
                  labelText: 'Hobbies, Color, Personas',
                  hintText: 'Hobbies, Color, Personas',
                  valueNullable: true,
                ),
              ],
            ),
            subTitleCard2: 'Metas afectivas',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMetasAfectivas,
                  onChangedValue: (value) =>
                      registroEmp.emprMetasAfectivas = value,
                  labelText: 'Metas afectivas',
                  hintText: 'Metas afectivas',
                  valueNullable: false,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Administración del tiempo',
            subTitleCard1: 'Día',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprAdmTiempoDia,
                  onChangedValue: (value) =>
                      registroEmp.emprAdmTiempoDia = value,
                  labelText: 'Hobbies, Color, Personas',
                  hintText: 'Hobbies, Color, Personas',
                  valueNullable: false,
                ),
              ],
            ),
            subTitleCard2: 'Comentarios',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprAdmTiempoComentario,
                  onChangedValue: (value) =>
                      registroEmp.emprAdmTiempoComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios',
                  hintText: 'Comentarios',
                  valueNullable: false,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: 'Comentario ejecutivo de antecedendes generales',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresarioComentarioEjecutivo,
                  onChangedValue: (value) =>
                      registroEmp.empresarioComentarioEjecutivo = value,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentario ejecutivo de antecedendes generales',
                  hintText: 'Comentario ejecutivo de antecedendes generales',
                  valueNullable: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
