import 'package:flutter/material.dart';

class CustomCardType5 extends StatelessWidget {
  final String logoCard;
  final String titleCard;
  final IconData iconCard;
  final String routePage;

  const CustomCardType5({
    Key? key,
    required this.logoCard,
    required this.titleCard,
    required this.iconCard,
    required this.routePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, routePage);
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                      logoCard,
                    ),
                    width: 300,
                    color: Colors.white.withOpacity(0.6),
                    fit: BoxFit.fitWidth,
                    colorBlendMode: BlendMode.modulate,
                  ),
                  SizedBox(
                      child: Text(
                    titleCard,
                    style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              )),
        ));
  }
}
