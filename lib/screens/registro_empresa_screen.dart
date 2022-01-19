import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistroEmpresaScreen extends StatelessWidget {
  const RegistroEmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0, // hides leading widget
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainHeader(
              titlePage: 'Registro Empresa',
            ),
            CustomCardType2(
              titleCard: '1. Generales de la Empresa',
              column1: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Nombre',
                    hintText: 'Nombre',
                  ),
                  CustomInputField(
                    labelText: 'Dirección',
                    hintText: 'Dirección',
                  ),
                  CustomInputField(
                    labelText: 'Teléfono',
                    hintText: 'Teléfono',
                  ),
                  CustomInputField(
                    labelText: 'Domicilio Fiscal',
                    hintText: 'Domicilio Fiscal',
                  ),
                ],
              ),
            ),
            CustomCardType2(
              titleCard: '2. Antigüedad de la Empresa',
              column1: Column(
                children: const [
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Años de la Empresa',
                    hintText: 'Años de la Empresa',
                  ),
                ],
              ),
            ),
            CustomCardType2(
              titleCard: '3. Estatus legal de la Empresa',
              subTitleCard1: '3.1 Persona física',
              column1: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Persona física',
                    hintText: 'Persona física',
                  ),
                ],
              ),
              subTitleCard2: '3.2 Persona moral',
              column2: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Persona moral',
                    hintText: 'Persona moral',
                  ),
                ],
              ),
              subTitleCard3: '3.3 Persona no registrada',
              column3: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Persona no registrada',
                    hintText: 'Persona no registrada',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            CustomCardType2(
              titleCard: '4. Estatus fiscal de la Empresa',
              column1: Column(
                children: const [
                  CustomInputField(
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
                children: const [
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Operativos',
                    hintText: 'Operativos',
                  ),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Administrativos',
                    hintText: 'Administrativos',
                  ),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Otros',
                    hintText: 'Otros',
                  ),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Total',
                    hintText: 'Total',
                  ),
                  CustomInputField(
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
                children: const [
                  CustomInputField(
                    labelText: 'Diarias',
                    hintText: 'Diarias',
                  ),
                  CustomInputField(
                    labelText: 'Semanales',
                    hintText: 'Semanales',
                  ),
                  CustomInputField(
                    labelText: 'Mensuales',
                    hintText: 'Menusales',
                  ),
                ],
              ),
              subTitleCard3: '5.3 Valor de los activos',
              column3: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Terreno',
                    hintText: 'Terreno',
                  ),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Bienes',
                    hintText: 'Bienes',
                  ),
                  CustomInputField(
                    labelText: 'Otros',
                    hintText: 'Otros',
                  ),
                ],
              ),
              subTitleCard4: '5.4 Calculos',
              column4: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Ventas / Empleados',
                    hintText: 'Ventas / Empleados',
                  ),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Ventas / Activos',
                    hintText: 'Venatas / Activos',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            CustomCardType2(
              titleCard: '6. Cobertura de mercado de la empresa',
              subTitleCard1: '6.1 Local',
              column1: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Local',
                    hintText: 'Local',
                  ),
                ],
              ),
              subTitleCard2: '6.2 Regional',
              column2: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Regional',
                    hintText: 'Regional',
                  ),
                ],
              ),
              subTitleCard3: '6.3 Internacional',
              column3: Column(
                children: const [
                  CustomInputField(
                    labelText: 'Internacional',
                    hintText: 'Internacional',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            CustomCardType2(
              titleCard: '7. Visión de la empresa',
              subTitleCard1: '7.1 Corto plazo',
              column1: Column(
                children: const [
                  CustomInputField(
                    minLines: 3,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    labelText: 'Corto plazo',
                    hintText: 'Corto plazo',
                  ),
                ],
              ),
              subTitleCard2: '7.2 Largo plazo',
              column2: Column(
                children: const [
                  CustomInputField(
                    minLines: 3,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    labelText: 'Largo plazo',
                    hintText: 'Largo plazo',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            CustomCardType2(
              titleCard:
                  '8. Comentario Ejecutivo de antecedendes de la empresa',
              column1: Column(
                children: const [
                  CustomInputField(
                    minLines: 4,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    labelText:
                        'Comentario Ejecutivo de antecedendes de la empresa',
                    hintText:
                        'Comentario Ejecutivo de antecedendes de la empresa',
                  ),
                ],
              ),
            ),
            CustomCardType2(
              titleCard: '9. Organigrama de la empresa',
              column1: Column(
                children: const [
                  CustomInputField(
                    minLines: 4,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    labelText: 'Cargar organigrama de la empresa',
                    hintText: 'Cargar organigrama de la empresa',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomAlert(
                  titleAlert: 'Información',
                  contentAlert: 'Información guardada con éxito'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
