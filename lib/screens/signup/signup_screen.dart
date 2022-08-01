import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login/login_screen.dart';
import '../../config/constants.dart';
import '../../config/theme.dart';
import '../../utils/helper.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            Helper.getAssetName("bg-home.jpg", "virtual"),
            fit: BoxFit.contain,
          ),
          htspace40,
          SizedBox(
              child: Text(
            'UAE\' Most Reliable Food \nDelivery and Dining App',
            style: AppTextStyle.boldSpaceBlack(),
            textAlign: TextAlign.center,
          )),
          htspace20,
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Sign Up',
                  style: AppTextStyle.light20(),
                  textAlign: TextAlign.center,
                ),
                htspace20,
                Material(
                  elevation: 12,
                  shadowColor: AppColors.shadowTxt,
                  child: SizedBox(
                    height: 50.0,
                    width: 320,
                    child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: AppColors.txt),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null),
                  ),
                ),
                htspace20,
                Material(
                  elevation: 12,
                  shadowColor: AppColors.shadowTxt,
                  child: SizedBox(
                    height: 50.0,
                    width: 320,
                    child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: AppColors.txt),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min. 6 characters'
                            : null),
                  ),
                ),
                SizedBox(
                  width: 320,
                  child: Row(
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 25),
                            child: const Text('login'),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 284.0,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Radius
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                  strokeWidth: 3, color: Colors.white),
                            )
                          : const Text('Sign up'),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        signUp();
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            if (emailController.text != " " ||
                                passwordController.text != " ") {
                              isLoading = false;
                            } else {
                              isLoading = true;
                            }
                          });
                        });
                      }),
                )
              ],
            ),
          ),
          Text(
            'or',
            style: AppTextStyle.regular14(),
            textAlign: TextAlign.center,
          ),
          htspace20,
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.txt, width: 1.0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Helper.getAssetName("google.png", "virtual"),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.txt, width: 1.0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Helper.getAssetName("apple.png", "virtual"),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.txt, width: 1.0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Stack(children: [
                const Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'By Continuing, you agree to our',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 0.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms of Service',
                          style: AppTextStyle.regular10(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          ' Privacy Policy',
                          style: AppTextStyle.regular10(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Content Policies',
                          style: AppTextStyle.regular10(),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ],
          )
        ],
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
