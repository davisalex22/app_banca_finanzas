import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
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
            const Padding(
              padding: EdgeInsets.all(60),
              child: PrincipalTitle(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CustomCardType5(
                  iconCard: Icons.arrow_forward_ios,
                  titleCard: 'Empresarios',
                  logoCard:
                      'https://img.freepik.com/foto-gratis/empresario-sonriente-anteojos-sentado-junto-mesa-cafeteria-computadora-portatil-mientras-usa-telefono-inteligente-escribe-algo_171337-5589.jpg?size=626&ext=jpg',
                  routePage: '/empresario',
                ),
                SizedBox(height: 20.0),
                CustomCardType5(
                  iconCard: Icons.arrow_forward_ios,
                  titleCard: 'Empresas',
                  logoCard:
                      'https://www.automotivesupplynews.com.mx/wp-content/uploads/2017/10/tipos-de-empresas.jpg',
                  routePage: '/empresa',
                ),
                SizedBox(height: 20.0),
                CustomCardType5(
                  iconCard: Icons.arrow_forward_ios,
                  titleCard: 'Subsistema',
                  logoCard:
                      'https://www.automotivesupplynews.com.mx/wp-content/uploads/2017/10/tipos-de-empresas.jpg',
                  routePage: '/subMercado',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
