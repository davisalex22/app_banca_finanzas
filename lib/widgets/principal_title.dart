import 'package:flutter/material.dart';

class PrincipalTitle extends StatelessWidget {
  const PrincipalTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo_app.png",
          width: 60,
        ),
        const SizedBox(width: 20),
        const Text("Enterprise Forms",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
