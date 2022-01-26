import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/providers/empresa_form_provider.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
            elevation: 0, // hides leading widget
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
                contentAlert: '¿Desea guardar los cambios?',
                onPressedValue: empresaService.isSaving
                    ? null
                    : () async {
                        if (empresaForm.isValidForm()) {
                          Navigator.of(context).pop();
                          await empresaService
                              .saveOrCreateProduct(empresaForm.empresa);
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.success(
                              message: "Información guardada correctamente",
                            ),
                          );
                        } else {
                          Navigator.of(context).pop();
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "Faltan campos por llenar",
                            ),
                          );
                        }

                        // final String? imageUrl = await productService.uploadImage();

                        // if (imageUrl != null) productForm.product.picture = imageUrl;
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
            titleCard: 'Seleccione Empresario',
            column1: Column(
              children: [
                ///Menu Mode with no searchBox
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Select a country",
                    labelText: "Menu mode *",
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  mode: Mode.MENU,
                  showSelectedItems: true,
                  items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                  showClearButton: true,
                  onChanged: print,
                  popupItemDisabled: (String? s) => s?.startsWith('I') ?? false,
                  clearButtonSplashRadius: 20,
                  selectedItem: "Tunisia",
                  onBeforeChange: (a, b) {
                    if (b == null) {
                      AlertDialog alert = AlertDialog(
                        title: Text("Are you sure..."),
                        content: Text("...you want to clear the selection"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                          TextButton(
                            child: Text("NOT OK"),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                        ],
                      );

                      return showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    }

                    return Future.value(true);
                  },
                ),
                Divider(),

                ///Menu Mode with no searchBox

                ///Menu Mode with overriden icon and dropdown buttons

                ///BottomSheet Mode with no searchBox
                DropdownSearch<String>(
                  mode: Mode.BOTTOM_SHEET,
                  items: [
                    "Brazil",
                    "Italia",
                    "Tunisia",
                    'Canada',
                    'Zraoua',
                    'France',
                    'Belgique'
                  ],
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Custom BottomShet mode",
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: print,
                  selectedItem: "Brazil",
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                      labelText: "Search a country1",
                    ),
                  ),
                  popupTitle: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Country',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  popupShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '1. Información general',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: registroEmp.empresaNombre,
                  onChangedValue: (value) => registroEmp.empresaNombre = value,
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaDireccion,
                  onChangedValue: (value) =>
                      registroEmp.empresaDireccion = value,
                  labelText: 'Dirección',
                  hintText: 'Dirección',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaTelefono,
                  onChangedValue: (value) =>
                      registroEmp.empresaTelefono = value,
                  labelText: 'Correo, teléfono, etc',
                  hintText: 'Contactos',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaRfc,
                  onChangedValue: (value) => registroEmp.empresaRfc = value,
                  labelText: 'R.F.C',
                  hintText: 'R.F.C',
                  validatorValue: true,
                ),
                CustomInputField(
                  initialValue: registroEmp.empresaDomicilioFiscal,
                  onChangedValue: (value) =>
                      registroEmp.empresaDomicilioFiscal = value,
                  labelText: 'Domicilio fiscal',
                  validatorValue: true,
                ),
              ],
            ),
          ),
          CustomCardType2(
            titleCard: '2. Antigüedad de la Empresa',
            subTitleCard1: 'Año de inicio de la empresa',
            column1: Column(
              children: [
                CustomInputField(
                  initialValue: '${registroEmp.empresaAniosInicio}',
                  onChangedValue: (value) {
                    if (int.tryParse(value) == null) {
                      registroEmp.empresaAniosInicio = 0;
                    } else {
                      registroEmp.empresaAniosInicio = int.parse(value);
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Año de inicio la Empresa',
                  hintText: 'Año de inicio la Empresa',
                  validatorValue: true,
                ),
              ],
            ),
            subTitleCard2: 'Años de la empresa',
            column2: Column(
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Años de la Empresa',
                  hintText: 'Años de la Empresa',
                  validatorValue: true,
                ),
                const SizedBox(height: 10)
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Operativos',
                  hintText: 'Operativos',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Administrativos',
                  hintText: 'Administrativos',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Otros',
                  hintText: 'Otros',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Total',
                  hintText: 'Total',
                  validatorValue: true,
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
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Diarias',
                  hintText: 'Diarias',
                  validatorValue: true,
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
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Mensuales',
                  hintText: 'Mensusales',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Terreno',
                  hintText: 'Terreno',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  labelText: 'Bienes',
                  hintText: 'Bienes',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Otros',
                  hintText: 'Otros',
                  validatorValue: true,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  labelText: 'Ventas / Empleados',
                  hintText: 'Ventas / Empleados',
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
                  validatorValue: true,
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
