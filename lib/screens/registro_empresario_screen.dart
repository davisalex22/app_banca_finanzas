import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistroEmpresarioScreen extends StatelessWidget {
  const RegistroEmpresarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'David',
      'last_name': 'Salazar',
      'email': 'davis.dassr@gmail.com',
      'password': '12345678',
      'role': 'Admin',
    };
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0, // hides leading widget
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const MainHeader(
                  titlePage: 'Registro Empresario',
                ),
                CustomCardType2(
                  titleCard: '1. Generales',
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
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard: '2. Antecedentes del empresario',
                  subTitleCard1: '2.1 El empresario',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Originario',
                        hintText: 'Originario',
                      ),
                      CustomInputField(
                        labelText: 'Lugar',
                        hintText: 'Lugar',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Estado civil',
                        hintText: 'Estado civil',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Escolaridad',
                        hintText: 'Escolaridad',
                      ),
                      CustomInputField(
                        labelText: 'Estado de salud',
                        hintText: 'Estado de salud',
                      ),
                      CustomInputField(
                        labelText: 'Comentarios del Empresario',
                        hintText: 'Comentarios del Empresario',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard2: '2.2 Los padres',
                  column2: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Nombres',
                        hintText: 'Nombres',
                      ),
                      CustomInputField(
                        labelText: 'Originarios',
                        hintText: 'Originarios',
                      ),
                      CustomInputField(
                        labelText: 'Viven',
                        hintText: 'Viven',
                      ),
                      CustomInputField(
                        labelText: 'Lugar',
                        hintText: 'Lugar',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Escolaridad',
                        hintText: 'Estado de salud',
                      ),
                      CustomInputField(
                        labelText: 'Comentarios de los padres',
                        hintText: 'Comentarios de los padres',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard3: '2.3 Número de hermanos nacidos',
                  column3: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Nombres',
                        hintText: 'Nombres',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Lugar dentro de sus hermanos',
                        hintText: 'Lugar dentro de sus hermanos',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard: '3. Antecedentes de la pareja',
                  subTitleCard1: '3.1 La pareja',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Nombre',
                        hintText: 'Nombre',
                      ),
                      CustomInputField(
                        labelText: 'Originaria',
                        hintText: 'Originaria',
                      ),
                      CustomInputField(
                        labelText: 'Vive',
                        hintText: 'Vive',
                      ),
                      CustomInputField(
                        labelText: 'En que Lugar',
                        hintText: 'En que Lugar',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Estado de salud',
                        hintText: 'Estado de salud',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Escolaridad',
                        hintText: 'Escolaridad',
                      ),
                      CustomInputField(
                        labelText: 'Comentarios de la pareja',
                        hintText: 'Comentarios de la pareja',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard2: '3.2 Los suegros',
                  column2: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Nombre',
                        hintText: 'Nombre',
                      ),
                      CustomInputField(
                        labelText: 'Originarios',
                        hintText: 'Originarios',
                      ),
                      CustomInputField(
                        labelText: 'Viven',
                        hintText: 'Viven',
                      ),
                      CustomInputField(
                        labelText: 'En que Lugar',
                        hintText: 'En que Lugar',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Estado de salud',
                        hintText: 'Estado de salud',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Escolaridad',
                        hintText: 'Escolaridad',
                      ),
                      CustomInputField(
                        labelText: 'Comentarios de los suegros',
                        hintText: 'Comentarios de los suegros',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard3: '3.3 Número de cuñados',
                  column3: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Nombres',
                        hintText: 'Nombres',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Lugar dentro de sus hermanos',
                        hintText: 'Lugar dentro de sus hermanos',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard: '4. El matrimonio',
                  subTitleCard1: '4.1 Años de Casado',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Años de Casado',
                        hintText: 'Años de Casado',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard2: '4.2 Situación afectiva del matrimonio',
                  column2: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Situación afectiva del matrimonio',
                        hintText: 'Situación afectiva del matrimonio',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard3: '4.3 Hijos',
                  column3: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Número de hijos',
                        hintText: 'Número de hijos',
                      ),
                      CustomInputField(
                        labelText: 'Edad',
                        hintText: 'Edad',
                      ),
                      CustomInputField(
                        labelText: 'Ocupación',
                        hintText: 'Ocupación',
                      ),
                      CustomInputField(
                        labelText: 'Escolaridad',
                        hintText: 'Escolaridad',
                      ),
                      CustomInputField(
                        labelText: 'Estado de salud',
                        hintText: 'Estado de salud',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard: '5. Filosofía Y/O Carácter',
                  subTitleCard1: '5.1 Hobbies,Color,Personas',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Hobbies,Color,Personas',
                        hintText: 'Hobbies,Color,Personas',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard2: '5.2 Comentarios',
                  column2: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Comentarios',
                        hintText: 'Comentarios',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard: '6. Metas personales',
                  subTitleCard1: '5.1 Hobbies,Color,Personas',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Hobbies,Color,Personas',
                        hintText: 'Hobbies,Color,Personas',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard2: '5.2 Comentarios',
                  column2: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Comentarios',
                        hintText: 'Comentarios',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard: '7. Administración del tiempo',
                  subTitleCard1: '5.1 Hobbies,Color,Personas',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Hobbies,Color,Personas',
                        hintText: 'Hobbies,Color,Personas',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subTitleCard2: '5.2 Comentarios',
                  column2: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Comentarios',
                        hintText: 'Comentarios',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomCardType2(
                  titleCard:
                      '7. Comentario Ejecutivo de antecedendes generales',
                  subTitleCard1: '5.1 Hobbies,Color,Personas',
                  column1: Column(
                    children: const [
                      CustomInputField(
                        labelText: 'Hobbies,Color,Personas',
                        hintText: 'Hobbies,Color,Personas',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
