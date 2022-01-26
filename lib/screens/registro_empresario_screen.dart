import 'package:app_banca_finanzas/providers/empresario_form_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        const text = 'Información guardada correctamente';
                        const snackBar = SnackBar(
                          content: Text(text),
                          duration: Duration(seconds: 2),
                        );

                        if (!empresarioForm.isValidForm()) return;

                        // final String? imageUrl = await productService.uploadImage();

                        // if (imageUrl != null) productForm.product.picture = imageUrl;
                        Navigator.of(context).pop();

                        await empresarioService
                            .saveOrCreateEmpresario(empresarioForm.empresario);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmpresarioForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final empresarioForm = Provider.of<EmpresarioFormProvider>(context);
    final registroEmp = empresarioForm.empresario;

    return Form(
      key: empresarioForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const MainHeader(
            titlePage: 'Registrar empresario',
          ),
          CustomCardType2(
            titleCard: '1. Generales',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresarioNombre,
                  onChangedValue: (value) =>
                      registroEmp.empresarioNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioDireccion,
                  onChangedValue: (value) =>
                      registroEmp.empresarioDireccion = value,
                  labelText: 'Dirección',
                  hintText: 'Dirección',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioTelefono,
                  onChangedValue: (value) =>
                      registroEmp.empresarioTelefono = value,
                  labelText: 'Teléfono',
                  hintText: 'Teléfono',
                  validatorValue: true,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '2. Antecedentes del empresarioriorio',
            subTitleCard1: '2.1 El empresarioriorio',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresarioOriginario,
                  onChangedValue: (value) =>
                      registroEmp.empresarioOriginario = value,
                  labelText: 'Originario',
                  hintText: 'Originario',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioLugar,
                  onChangedValue: (value) =>
                      registroEmp.empresarioLugar = value,
                  labelText: 'Lugar',
                  hintText: 'Lugar',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioEdad,
                  onChangedValue: (value) => registroEmp.empresarioEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                // CustomDropDownButtom(
                //   hintText: 'Estado civil',
                //   labelText: 'Estado civil',
                //   formValues: formValues,
                //   listMenu: const [
                //     "Solotero/a",
                //     "Casado/a",
                //     "Divorciado/a",
                //     "Viudo/a"
                //   ],
                // ),
                CustomInputField(
                  initialValue: registroEmp.empresarioOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.empresarioOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.empresarioEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.empresarioEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresarioComentario,
                  onChangedValue: (value) =>
                      registroEmp.empresarioComentario = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentarios del Empresario',
                  hintText: 'Comentarios del Empresariorio',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: '2.2 Los padres',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprPadresNombres,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresNombres = value,
                  labelText: 'Nombres',
                  hintText: 'Nombres',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresOriginarios,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresOriginarios = value,
                  labelText: 'Originarios',
                  hintText: 'Originarios',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresViven,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresViven = value,
                  labelText: 'Viven',
                  hintText: 'Viven',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresLugar,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresLugar = value,
                  labelText: 'Lugar',
                  hintText: 'Lugar',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresEdad,
                  onChangedValue: (value) => registroEmp.emprPadresEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprPadresEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprPadresEstadoSalud = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  validatorValue: true,
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
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard3: '2.3 Número de hermanos nacidos',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprHermanosNombres,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosNombres = value,
                  labelText: 'Nombres',
                  hintText: 'Nombres',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprHermanosEdad,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosEdad = value,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprHermanosOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprHermanosLugarHermanos,
                  onChangedValue: (value) =>
                      registroEmp.emprHermanosLugarHermanos = value,
                  labelText: 'Lugar dentro de sus hermanos',
                  hintText: 'Lugar dentro de sus hermanos',
                  validatorValue: true,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '3. Antecedentes de la pareja',
            subTitleCard1: '3.1 La pareja',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprParejaNombre,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaOriginaria,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaOriginaria = value,
                  labelText: 'Originaria',
                  hintText: 'Originaria',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaVive,
                  onChangedValue: (value) => registroEmp.emprParejaVive = value,
                  labelText: 'Vive',
                  hintText: 'Vive',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaLugar,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaLugar = value,
                  labelText: 'En que Lugar',
                  hintText: 'En que Lugar',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: '${registroEmp.emprParejaEdad}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.emprParejaEdad = 0;
                    } else {
                      registroEmp.emprParejaEdad = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprParejaEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprParejaEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  validatorValue: true,
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
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: '3.2 Los suegros',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosNombre,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosOriginarios,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosOriginarios = value,
                  labelText: 'Originarios',
                  hintText: 'Originarios',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosViven,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosViven = value,
                  labelText: 'Viven',
                  hintText: 'Viven',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosLugar,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosLugar = value,
                  labelText: 'En que Lugar',
                  hintText: 'En que Lugar',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: '${registroEmp.emprSuegrosEdad}',
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprSuegrosEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprSuegrosEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  validatorValue: true,
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
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard3: '3.3 Número de cuñados',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosNombre,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosNombre = value,
                  labelText: 'Nombres',
                  hintText: 'Nombres',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: '${registroEmp.emprCuniadosEdad}',
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosEdad = value,
                  keyboardType: TextInputType.number,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprCuniadosLugarHermanos,
                  onChangedValue: (value) =>
                      registroEmp.emprCuniadosLugarHermanos = value,
                  labelText: 'Lugar dentro de sus hermanos',
                  hintText: 'Lugar dentro de sus hermanos',
                  validatorValue: true,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '4. El matrimonio',
            subTitleCard1: '4.1 Años de Casado',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.emprMatrimonioAniosCasado}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.emprMatrimonioAniosCasado = 0;
                    } else {
                      registroEmp.emprMatrimonioAniosCasado = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Años de Casado',
                  hintText: 'Años de Casado',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: '4.2 Situación afectiva del matrimonio',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioSituacionAfectiva,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioSituacionAfectiva = value,
                  labelText: 'Situación afectiva del matrimonio',
                  hintText: 'Situación afectiva del matrimonio',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard3: '4.3 Hijos',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.emprMatrimonioHNumeroHijos}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.emprMatrimonioHNumeroHijos = 0;
                    } else {
                      registroEmp.emprMatrimonioHNumeroHijos = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Número de hijos',
                  hintText: 'Número de hijos',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHEdad,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHEdad = value,
                  labelText: 'Edad',
                  hintText: 'Edad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHOcupacion,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHOcupacion = value,
                  labelText: 'Ocupación',
                  hintText: 'Ocupación',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHEscolaridad,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHEscolaridad = value,
                  labelText: 'Escolaridad',
                  hintText: 'Escolaridad',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.emprMatrimonioHEstadoSalud,
                  onChangedValue: (value) =>
                      registroEmp.emprMatrimonioHEstadoSalud = value,
                  labelText: 'Estado de salud',
                  hintText: 'Estado de salud',
                  validatorValue: true,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '5. Filosofía Y/O Carácter',
            subTitleCard1: '5.1 Hobbies,Color,Personas',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprFilosofiaHobbies,
                  onChangedValue: (value) =>
                      registroEmp.emprFilosofiaHobbies = value,
                  labelText: 'Hobbies,Color,Personas',
                  hintText: 'Hobbies,Color,Personas',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: '5.2 Comentarios',
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
                  validatorValue: true,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '6. Metas personales',
            subTitleCard1: '6.1 Metas personales',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMetasProfesionales,
                  onChangedValue: (value) =>
                      registroEmp.emprMetasProfesionales = value,
                  labelText: 'Hobbies,Color,Personas',
                  hintText: 'Hobbies,Color,Personas',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: '6.2 Metas Afectivas',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprMetasAfectivas,
                  onChangedValue: (value) =>
                      registroEmp.emprMetasAfectivas = value,
                  labelText: 'Metas Afectivas',
                  hintText: 'Metas Afectivas',
                  validatorValue: true,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '7. Administración del tiempo',
            subTitleCard1: '7.1 Día',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.emprAdmTiempoDia,
                  onChangedValue: (value) =>
                      registroEmp.emprAdmTiempoDia = value,
                  labelText: 'Hobbies,Color,Personas',
                  hintText: 'Hobbies,Color,Personas',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: '7.5 Comentarios',
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
                  validatorValue: true,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '8. Comentario Ejecutivo de antecedendes generales',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresarioComentarioEjecutivo,
                  onChangedValue: (value) =>
                      registroEmp.empresarioComentarioEjecutivo = value,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Comentario Ejecutivo de antecedendes generales',
                  hintText: 'Comentario Ejecutivo de antecedendes generales',
                  validatorValue: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
