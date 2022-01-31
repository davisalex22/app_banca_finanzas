import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final int actualPage;
  final int currentIndex;
  final String nameOption;
  final String routePage;
  final Widget iconOption;
  const CustomNavigationBar({
    Key? key,
    required this.actualPage,
    required this.nameOption,
    required this.iconOption,
    required this.currentIndex,
    required this.routePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0XffA73030),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (actualPage) {
        if (actualPage == 0) {
          Navigator.pushNamed(context, routePage);
        }
        if (actualPage == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
        if (actualPage == 2) {
          authService.logout();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          label: nameOption,
          icon: iconOption,
        ),
        const BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home),
        ),
        const BottomNavigationBarItem(
          label: 'Salir',
          icon: Icon(Icons.login_outlined),
        ),
      ],
    );
  }
}
