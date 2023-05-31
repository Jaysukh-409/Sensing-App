import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sensing_app/Screens/surveyscreen8.dart';

class Survey7Screen extends StatefulWidget {
  const Survey7Screen({super.key});

  @override
  State<Survey7Screen> createState() => _Survey7ScreenState();
}

class _Survey7ScreenState extends State<Survey7Screen> {
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
                "Slowness of Thinking",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              percent: 7 / 17,
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
                  "Q. Do you feel slow or sluggish when you think about something? Do you feel that it takes an unusually long time to conclude a train of thought or solve a task that requires mental effort?",
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
                        "My thoughts are neither slow nor sluggish regarding work involving mental effort.",
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
                        "My thoughts are a bit slow one or a few times each day when I have to do something that requires serious mental effort.",
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
                        "My thoughts often feel slow and sluggish, even when carrying out everyday activities, for example a conversation with a person or when reading the newspaper.",
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
                        "My thoughts always feel very slow and sluggish.",
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
              onTap: () => Get.to(() => const Survey8Screen()),
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
