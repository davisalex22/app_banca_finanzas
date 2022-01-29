import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_banca_finanzas/router/app_routes.dart';
import 'package:app_banca_finanzas/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => EmpresasService()),
        ChangeNotifierProvider(create: (_) => EmpresariosService()),
        ChangeNotifierProvider(create: (_) => SubMercadoService()),
        ChangeNotifierProvider(create: (_) => SubProduccionService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0XffA73030), // navigation bar color
        statusBarColor: Color(0XffA73030) // status bar color
        ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const SplashScreen(),
        // initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        // onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.lightTheme);
  }
}
