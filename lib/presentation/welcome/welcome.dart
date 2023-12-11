import 'package:apaniot/presentation/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/background.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sweet &\nSmart Home',
                  style: GoogleFonts.bebasNeue(fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Smart Home can change the way you live in the future.',
                  style: GoogleFonts.badScript(
                      fontSize: 18, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return DashboardScreen();
                      // }));
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (
                                BuildContext ctx,
                                Animation<double> animation,
                                Animation<double> secondartAnimation,
                              ) {
                                return DashboardScreen();
                              },
                              transitionsBuilder: (BuildContext ctx,
                                  Animation<double> animation,
                                  Animation<double> secondartAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastLinearToSlowEaseIn);
                                return rotationTransition(animation, child);
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 1000)));
                    },
                    child: Text('get smart'.toUpperCase())),
              ),
            ),
          )
        ],
      ),
    );
  }
}

ScaleTransition scaleTransition(Animation<double> animation, Widget child) {
  return ScaleTransition(
    scale: animation,
    alignment: Alignment.topRight,
    child: child,
  );
}

Align sizeTransition(Animation<double> animation, Widget child) {
  return Align(
    child: SizeTransition(
      sizeFactor: animation,
      child: child,
    ),
  );
}

FadeTransition fadeTransition(Animation<double> animation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

RotationTransition rotationTransition(
    Animation<double> animation, Widget child) {
  return RotationTransition(
    alignment: Alignment.center,
    turns: animation,
    child: ScaleTransition(
      alignment: Alignment.center,
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    ),
  );
}

SlideTransition slideDownTransition(Animation<double> animation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
        .animate(animation),
    child: child,
  );
}

SlideTransition slideLeftTransition(Animation<double> animation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(animation),
    child: child,
  );
}

SlideTransition slideUpTransition(Animation<double> animation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        .animate(animation),
    child: child,
  );
}

SlideTransition slideRightTransition(
    Animation<double> animation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(animation),
    child: child,
  );
}
