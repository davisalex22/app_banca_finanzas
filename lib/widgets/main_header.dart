import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  final String titlePage;

  const MainHeader({
    Key? key,
    required this.titlePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/logo_app.png'),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Enterprise Forms",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(titlePage,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8E3939))),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
