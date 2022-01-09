import 'package:flutter/material.dart';
import 'package:app_banca_finanzas/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? Key}) : super(key: Key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
          )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background_splash.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Image(
                  image: AssetImage('assets/images/splash_finanzas.png'),
                  height: 100,
                ),
              ],
            ),
            const Image(
              image: AssetImage('assets/images/logo_splash.png'),
              height: 300,
            ),
            const Text(
              'Enterprise Forms',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'Administración de Empresas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Image(
              image: AssetImage('assets/images/utpl_logo.png'),
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Image(
                  image: AssetImage('assets/images/under_splash.png'),
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
