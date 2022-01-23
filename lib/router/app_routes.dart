import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/checking': (BuildContext context) => const CheckAuthScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/register': (BuildContext context) => const RegisterScreen(),
    '/home': (BuildContext context) => const HomeScreen(),
    '/registroEmpresario': (BuildContext context) =>
        const RegistroEmpresarioScreen(),
    '/registroEmpresa': (BuildContext context) => const RegistroEmpresaScreen(),
    '/registros': (BuildContext context) => const RegistrosScreen(),
  };
}