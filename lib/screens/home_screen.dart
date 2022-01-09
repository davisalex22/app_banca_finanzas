import 'package:app_banca_finanzas/widgets/bottom_navigation_bar.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(60),
            child: PrincipalTitle(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CustomCardType1(
                iconCard: Icons.arrow_forward_ios,
                titleCard: 'Registrar Empresario',
                logoCard: 'assets/images/logo_empresario.png',
                routePage: '/registroEmpresario',
              ),
              SizedBox(height: 20.0),
              CustomCardType1(
                iconCard: Icons.arrow_forward_ios,
                titleCard: 'Registrar Empresa',
                logoCard: 'assets/images/logo_empresa.png',
                routePage: '/registroEmpresa',
              ),
              SizedBox(height: 20.0),
              CustomCardType1(
                iconCard: Icons.arrow_forward_ios,
                titleCard: 'Registros',
                logoCard: 'assets/images/logo_registros.png',
                routePage: '/registros',
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
