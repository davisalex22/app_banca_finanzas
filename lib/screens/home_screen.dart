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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(60),
            child: PrincipalTitle(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.63,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
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
                        titleCard: 'Subsistema Mercado',
                        logoCard:
                            'https://www.macmillandictionaryblog.com/wp-content/uploads/2017/08/enterprise-1024x625.jpg',
                        routePage: '/subMercado',
                      ),
                      SizedBox(height: 20.0),
                      CustomCardType5(
                        iconCard: Icons.arrow_forward_ios,
                        titleCard: 'Subsistema Producción',
                        logoCard:
                            'https://www.macmillandictionaryblog.com/wp-content/uploads/2017/08/enterprise-1024x625.jpg',
                        routePage: '/subProduccion',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
