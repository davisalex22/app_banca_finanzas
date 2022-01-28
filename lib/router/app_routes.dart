import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/checking': (BuildContext context) => const CheckAuthScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/register': (BuildContext context) => const RegisterScreen(),
    '/home': (BuildContext context) => const HomeScreen(),
    '/empresario': (BuildContext context) => const EmpresarioScreen(),
    '/formEmpresario': (BuildContext context) =>
        const RegistroEmpresarioScreen(),
    '/empresa': (BuildContext context) => const EmpresaScreen(),
    '/formEmpresa': (BuildContext context) => const RegistroEmpresaScreen(),
    '/infoEmpresa': (BuildContext context) => const InfoEmpresaScreen(),
    '/infoEmpresario': (BuildContext context) => const InfoEmpresarioScreen(),
    '/formSubMercado': (BuildContext context) =>
        const RegistroSubMercadoScreen(),
    '/subMercado': (BuildContext context) => const SubsistemaMercadoScreen(),
    '/infoSubMercado': (BuildContext context) => const InfoSubsistemaMScreen(),
  };
}
