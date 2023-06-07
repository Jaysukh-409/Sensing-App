import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensing_app/Screens/surveyscreen.dart';
import 'package:sensing_app/functions/loginsignup.dart';

class FeelingsScreen extends StatefulWidget {
  const FeelingsScreen({super.key});

  @override
  State<FeelingsScreen> createState() => _FeelingsScreenState();
}

class _FeelingsScreenState extends State<FeelingsScreen> {
  bool good = false;
  bool tired = false;
  List<int> answer = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  void logoutUser() async {
    AuthController().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: const Color.fromARGB(255, 162, 175, 255).withOpacity(0.2),
            child: const Center(
              child: Text(
                "How do you feel Today ?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (good) {
                  good = false;
                } else {
                  good = true;
                  answer[0] = 1;
                  tired = false;
                }
              });
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.black,
                  child: Icon(
                    good
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 49, 47, 42),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: const Center(
                    child: Text(
                      "Good",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (tired) {
                  tired = false;
                } else {
                  tired = true;
                  answer[0] = 1;
                  good = false;
                }
              });
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.black,
                  child: Icon(
                    tired
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 49, 47, 42),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: const Center(
                    child: Text(
                      "Tired",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => {
              if (good || tired)
                {
                  Get.to(
                    () => SurveyScreen(
                      answer: answer,
                    ),
                  ),
                }
              else
                {
                  Get.snackbar(
                    "Insufficient Input",
                    "Please select any one option",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                  ),
                }
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(75),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 10,
                      offset: const Offset(1, 1),
                      color: Colors.blueAccent.withOpacity(0.35))
                ],
              ),
              child: const Center(
                  child: Text(
                "Start Sensing",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: logoutUser,
            child: Container(
              width: 130,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.red, Colors.black],
                ),
              ),
              child: const Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
