import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  final String titleCard;
  final String assetImage;
  final String description;
  final String routePage;
  const CustomCardType1({
    Key? key,
    required this.titleCard,
    required this.assetImage,
    required this.description,
    required this.routePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routePage),
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 100,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.58,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image(
                        image: AssetImage(assetImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, top: 5),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            titleCard,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: 150,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                onSurface: Colors.amber,
                              ),
                              child: const Text('Ver'),
                              onPressed: () =>
                                  Navigator.pushNamed(context, routePage),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
