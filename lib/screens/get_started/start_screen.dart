import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';

import 'package:food_delivery_app/screens/login/login_screen.dart';

import '../../config/constants.dart';
import '../../config/theme.dart';
import '../../utils/helper.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 210,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Helper.getAssetName("bg1.jpg", "virtual"),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // ignore: sized_box_for_whitespace
            child: ClipPath(
              clipper: CustomClip(),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            offset: Offset(5, 5))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'The Fastest in \nDelivery ',
                    style: AppTextStyle.boldSpace(),
                  ),
                  TextSpan(
                    text: 'Food',
                    style: AppTextStyle.boldSpaceRed(),
                  ),
                ],
              ),
            ),
          ),
          htspace20,
          Align(
            alignment: const Alignment(0, 0.66),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Our job is filling your tummy\n with delicious food and delivery',
                    style: AppTextStyle.regular16(),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: const Alignment(0, 0.90),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StreamBuilder<User?>(
                            stream: FirebaseAuth.instance.authStateChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text('something went wrong!!!!!'),
                                );
                              } else if (snapshot.hasData) {
                                return const HomeScreen();
                              } else {
                                return const LoginScreen();
                              }
                            })),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: AppColors.shadow,
                    elevation: 10,
                    fixedSize: const Size(160, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 1.2,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.1951800);
    path.quadraticBezierTo(size.width * 0.1920500, size.height * 0.0182600,
        size.width * 0.5016750, size.height * 0.0149200);
    path.quadraticBezierTo(size.width * 0.8108000, size.height * 0.0272600,
        size.width, size.height * 0.2011800);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
