import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFED4156),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Añadir',
          icon: Icon(Icons.add_box),
        ),
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Registros',
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}
