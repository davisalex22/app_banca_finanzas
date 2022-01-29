import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/checking': (BuildContext context) => const CheckAuthScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/register': (BuildContext context) => const RegisterScreen(),
    '/home': (BuildContext context) => const HomeScreen(),
    // Empresa
    '/empresa': (BuildContext context) => const EmpresaScreen(),
    '/formEmpresa': (BuildContext context) => const RegistroEmpresaScreen(),
    '/infoEmpresa': (BuildContext context) => const InfoEmpresaScreen(),
    // Empresario
    '/empresario': (BuildContext context) => const EmpresarioScreen(),
    '/formEmpresario': (BuildContext context) =>
        const RegistroEmpresarioScreen(),
    '/infoEmpresario': (BuildContext context) => const InfoEmpresarioScreen(),
    // Subsitema Mercado
    '/formSubMercado': (BuildContext context) =>
        const RegistroSubMercadoScreen(),
    '/subMercado': (BuildContext context) => const SubsistemaMercadoScreen(),
    '/infoSubMercado': (BuildContext context) => const InfoSubsistemaMScreen(),
    // Subsistema Produccion
    '/formSubProduccion': (BuildContext context) =>
        const RegistroSubProduccionScreen(),
    '/subProduccion': (BuildContext context) =>
        const SubsistemaProduccionScreen(),
    '/infoSubProduccion': (BuildContext context) =>
        const InfoSubsistemaPScreen(),
  };
}
