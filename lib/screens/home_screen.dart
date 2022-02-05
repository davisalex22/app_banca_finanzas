import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: const [
              PrincipalTitle(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(height: 32.0),
                CustomCardType1(
                  titleCard: 'Empresarios',
                  description: '',
                  assetImage: 'assets/images/background_empresario.jpg',
                  routePage: '/empresario',
                ),
                SizedBox(height: 80.0),
                CustomCardType1(
                  titleCard: 'Empresas',
                  description: '',
                  assetImage: 'assets/images/background_empresa.jpg',
                  routePage: '/empresa',
                ),
                SizedBox(height: 70.0),
                CustomCardType1(
                  titleCard: 'Subsistemas de Mercado',
                  description: '',
                  assetImage: 'assets/images/background_subM.jpg',
                  routePage: '/subMercado',
                ),
                SizedBox(height: 60.0),
                CustomCardType1(
                  titleCard: 'Subsistemas de Producción',
                  description: '',
                  assetImage: 'assets/images/background_subP.jpg',
                  routePage: '/subProduccion',
                ),
                SizedBox(height: 60.0),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(
        actualPage: 0,
        iconOption: Icon(Icons.my_library_books_sharp),
        nameOption: 'Registros',
        currentIndex: 1,
        routePage: '/home',
      ),
    );
  }
}
