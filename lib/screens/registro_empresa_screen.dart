import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/providers/empresa_form_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

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
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            _EmpresaForm(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomAlert(
                titleAlert: 'Información',
                contentAlert: '¿Desea guardar los cambios?',
                onPressedValue: empresaService.isSaving
                    ? null
                    : () async {
                        const text = 'Información guardada correctamente';
                        const snackBar = SnackBar(
                          content: Text(text),
                          duration: Duration(seconds: 2),
                        );

                        if (!empresaForm.isValidForm()) return;

                        // final String? imageUrl = await productService.uploadImage();

                        // if (imageUrl != null) productForm.product.picture = imageUrl;
                        Navigator.of(context).pop();

                        await empresaService
                            .saveOrCreateProduct(empresaForm.empresa);
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

class _EmpresaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final empresaForm = Provider.of<EmpresaFormProvider>(context);
    final registroEmp = empresaForm.empresa;

    return Form(
      key: empresaForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const MainHeader(titlePage: 'Registro de Empresa'),
          CustomCardType2(
            titleCard: '1. Información general',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresaNombre,
                  onChangedValue: (value) => registroEmp.empresaNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaDireccion,
                  onChangedValue: (value) =>
                      registroEmp.empresaDireccion = value,
                  labelText: 'Dirección',
                  hintText: 'Dirección',
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaTelefono,
                  onChangedValue: (value) =>
                      registroEmp.empresaTelefono = value,
                  labelText: 'Correo, teléfono, etc',
                  hintText: 'Contactos',
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaRfc,
                  onChangedValue: (value) => registroEmp.empresaRfc = value,
                  labelText: 'R.F.C',
                  hintText: 'R.F.C',
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaDomicilioFiscal,
                  onChangedValue: (value) =>
                      registroEmp.empresaDomicilioFiscal = value,
                  labelText: 'Domicilio fiscal',
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '2. Antigüedad de la Empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.empresaAniosAntiguedad}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empresaAniosAntiguedad = 0;
                    } else {
                      registroEmp.empresaAniosAntiguedad = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Años de la Empresa',
                  hintText: 'Años de la Empresa',
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '3. Estatus legal de la Empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empEstLegalPersonaFisica,
                  onChangedValue: (value) =>
                      registroEmp.empEstLegalPersonaFisica = value,
                  labelText: 'Persona física',
                  hintText: 'Persona física',
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
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '4. Estatus fiscal de la Empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empEstatusFiscal,
                  onChangedValue: (value) =>
                      registroEmp.empEstatusFiscal = value,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  labelText: 'Estatus fiscal de la Empresa',
                  hintText: 'Estatus fiscal de la Empresa',
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '5. Tamaño de la Empresa',
            subTitleCard1: '5.1 Número de empleados',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.empTamNumEmpOperativos}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empTamNumEmpOperativos = 0;
                    } else {
                      registroEmp.empTamNumEmpOperativos = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Operativos',
                  hintText: 'Operativos',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empTamNumEmpAdministrativos}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empTamNumEmpAdministrativos = 0;
                    } else {
                      registroEmp.empTamNumEmpAdministrativos =
                          int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Administrativos',
                  hintText: 'Administrativos',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empTamNumEmpOtros}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empTamNumEmpOtros = 0;
                    } else {
                      registroEmp.empTamNumEmpOtros = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Otros',
                  hintText: 'Otros',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empTamNumEmpTotal}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empTamNumEmpTotal = 0;
                    } else {
                      registroEmp.empTamNumEmpTotal = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Total',
                  hintText: 'Total',
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
                ),
              ],
            ),
            subTitleCard2: '5.2 Ventas',
            column2: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.empVentasDiarias}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empVentasDiarias = 0;
                    } else {
                      registroEmp.empVentasDiarias = int.parse(value);
                    }
                  },
                  labelText: 'Diarias',
                  hintText: 'Diarias',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empVentasSemanales}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empVentasSemanales = 0;
                    } else {
                      registroEmp.empVentasSemanales = int.parse(value);
                    }
                  },
                  labelText: 'Semanales',
                  hintText: 'Semanales',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empVentasMensuales}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empVentasMensuales = 0;
                    } else {
                      registroEmp.empVentasMensuales = int.parse(value);
                    }
                  },
                  labelText: 'Mensuales',
                  hintText: 'Mensusales',
                ),
              ],
            ),
            subTitleCard3: '5.3 Valor de los activos',
            column3: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.empValActivosTerreno}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empValActivosTerreno = 0;
                    } else {
                      registroEmp.empValActivosTerreno = int.parse(value);
                    }
                  },
                  labelText: 'Terreno',
                  hintText: 'Terreno',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empValActivosBienes}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empValActivosBienes = 0;
                    } else {
                      registroEmp.empValActivosBienes = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Bienes',
                  hintText: 'Bienes',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empValActivosOtros}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empValActivosOtros = 0;
                    } else {
                      registroEmp.empValActivosOtros = int.parse(value);
                    }
                  },
                  labelText: 'Otros',
                  hintText: 'Otros',
                ),
              ],
            ),
            subTitleCard4: '5.4 Calculos',
            column4: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.empCalculosVentasActivos}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empCalculosVentasActivos = 0;
                    } else {
                      registroEmp.empCalculosVentasActivos = int.parse(value);
                    }
                  },
                  labelText: 'Ventas / Empleados',
                  hintText: 'Ventas / Empleados',
                ),
                CustomInputField(
                  initialValue: '${registroEmp.empCalculosVentasActivos}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empCalculosVentasActivos = 0;
                    } else {
                      registroEmp.empCalculosVentasActivos = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  labelText: 'Ventas / Activos',
                  hintText: 'Ventas / Activos',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '6. Cobertura de mercado de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empCobMercadoLocal,
                  onChangedValue: (value) =>
                      registroEmp.empCobMercadoLocal = value,
                  labelText: 'Local',
                  hintText: 'Local',
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
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '7. Visión de la empresa',
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
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '8. Comentario ejecutivo de antecedendes de la empresa',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
