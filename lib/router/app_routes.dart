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
    '/registroEmpresario': (BuildContext context) =>
        const RegistroEmpresarioScreen(),
    '/empresa': (BuildContext context) => const EmpresaScreen(),
    '/registroEmpresa': (BuildContext context) => const RegistroEmpresaScreen(),
    '/registroEmpresario': (BuildContext context) =>
        const RegistroEmpresarioScreen(),
    '/registros': (BuildContext context) => const RegistrosScreen(),
  };
}
