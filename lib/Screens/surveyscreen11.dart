import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sensing_app/Screens/surveyscreen12.dart';

class Survey11Screen extends StatefulWidget {
  List<int> answer;
  Survey11Screen({required this.answer, super.key});

  @override
  State<Survey11Screen> createState() => _Survey11ScreenState();
}

class _Survey11ScreenState extends State<Survey11Screen> {
  bool option0 = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              color: const Color.fromARGB(255, 162, 175, 255).withOpacity(0.2),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                  child: Text(
                "Sensitivity to Light",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              )),
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              percent: 11 / 17,
              backgroundColor: Colors.lightBlueAccent[10],
              progressColor: Colors.blue,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 7.5,
                right: 7.5,
                bottom: 5,
              ),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 162, 175, 255).withOpacity(0.2),
              child: const Center(
                child: Text(
                  "Q. Choose best that describe your sensitivity to the light.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (option0) {
                    option0 = false;
                  } else {
                    option0 = true;
                    widget.answer[11] = 0;
                    option1 = option2 = option3 = false;
                  }
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 50,
                    color: Colors.black,
                    child: Icon(
                      option0
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 2.5,
                      bottom: 2.5,
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 42, 49)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: const Center(
                      child: Text(
                        "I have no increased sensitivity to light.",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (option1) {
                    option1 = false;
                  } else {
                    option1 = true;
                    widget.answer[11] = 1;
                    option0 = option2 = option3 = false;
                  }
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 50,
                    color: Colors.black,
                    child: Icon(
                      option1
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 2.5,
                      bottom: 2.5,
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 42, 49)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: const Center(
                      child: Text(
                        "I sometimes experience problems with strong light such as sunlight reflected by snow, water or glass or strong lights at home, but I am able to cope with it, for example by wearing sunglasses.",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (option2) {
                    option2 = false;
                  } else {
                    option2 = true;
                    widget.answer[11] = 2;
                    option1 = option0 = option3 = false;
                  }
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 50,
                    color: Colors.black,
                    child: Icon(
                      option2
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 2.5,
                      bottom: 2.5,
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 42, 49)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: const Center(
                      child: Text(
                        "I am so sensitive to light that I prefer to carry out my daily activities in dim light. I find it difficult to leave the house without sunglasses.",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (option3) {
                    option3 = false;
                  } else {
                    option3 = true;
                    widget.answer[11] = 3;
                    option1 = option2 = option0 = false;
                  }
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 50,
                    color: Colors.black,
                    child: Icon(
                      option3
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 2.5,
                      bottom: 2.5,
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 42, 49)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: const Center(
                      child: Text(
                        "My sensitivity to light is so strong that I am unable to leave the house without sunglasses. I keep the blinds (or equivalent) drawn at all times.",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7.5,
            ),
            GestureDetector(
              onTap: () => {
                if (option0 || option1 || option2 || option3)
                  {
                    Get.to(
                      () => Survey12Screen(
                        answer: widget.answer,
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
                width: 130,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [Colors.black, Colors.blue, Colors.black],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Next",
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
      ),
    );
  }
}
