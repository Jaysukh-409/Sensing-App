import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensing_app/Screens/loginscreen.dart';
import 'package:sensing_app/functions/loginsignup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void signupUser() async {
    setState(() {
      isLoading = true;
    });

    await AuthController()
        .signup(email: emailcontroller.text, password: passwordcontroller.text);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue, Colors.pink, Colors.yellow],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 55,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 33),
              child: const Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sensing App',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          children: <Widget>[
                            // E-Mail Field
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 8,
                                        offset: const Offset(1, 1),
                                        color: Colors.purpleAccent
                                            .withOpacity(0.35))
                                  ]),
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    hintText: "Enter E-mail",
                                    // labelText: "E-mail",
                                    prefixIcon: const Icon(
                                      CupertinoIcons.mail_solid,
                                      color: Colors.black,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Password Field
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 8,
                                        offset: const Offset(1, 1),
                                        color: Colors.greenAccent
                                            .withOpacity(0.35))
                                  ]),
                              child: TextField(
                                controller: passwordcontroller,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    // labelText: "Password",
                                    prefixIcon: const Icon(
                                      CupertinoIcons.padlock_solid,
                                      color: Colors.black,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Already have an Account ?",
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                            children: [
                              TextSpan(
                                text: " Login",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => Get.to(() => const LoginScreen()),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: signupUser,
                          child: Container(
                            width: 130,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                colors: [
                                  Colors.black,
                                  Colors.pink,
                                  Colors.yellow,
                                ],
                              ),
                            ),
                            child: !isLoading
                                ? const Center(
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
