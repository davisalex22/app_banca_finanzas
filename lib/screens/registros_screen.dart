import 'package:app_banca_finanzas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistrosScreen extends StatelessWidget {
  final options = const ['Hernan Lopez', 'Santiago Garcia', 'Edgar Fernandez'];
  const RegistrosScreen({Key? key}) : super(key: key);

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
          const MainHeader(titlePage: 'Registros'),
          const CustomCardType2(),
          Expanded(
            child: ListView(
              children: [
                ...options
                    .map((e) => CustomCardType2(
                            column1: Column(
                          children: [
                            ListTile(
                              title: Text(e),
                              trailing:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                              onTap: () {},
                            ),
                          ],
                        )))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
