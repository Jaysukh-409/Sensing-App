import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sensing_app/Screens/gyro.dart';
import 'package:sensing_app/Screens/resultpage.dart';
import 'package:sensing_app/functions/answerupload.dart';

class SurveyScreen extends StatefulWidget {
  List<int> answer;
  SurveyScreen({required this.answer, super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  bool option0 = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  int currentQuestionIndex = 0;
  List<QueryDocumentSnapshot> questions = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('questions')
        .orderBy('Index')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        questions = querySnapshot.docs;
      });
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      option0 = false;
      option1 = false;
      option2 = false;
      option3 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

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
              child: Center(
                child: Text(
                  currentQuestion['Question_Text'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              percent: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.lightBlueAccent[10],
              progressColor: Colors.blue,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const GyroSensor(),
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
              child: Center(
                child: Text(
                  currentQuestion['Question'],
                  style: const TextStyle(
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
                    widget.answer[currentQuestionIndex + 1] = 0;
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
                    child: Center(
                      child: Text(
                        currentQuestion['Option'][0],
                        style: const TextStyle(
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
                    widget.answer[currentQuestionIndex + 1] = 1;
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
                    child: Center(
                      child: Text(
                        currentQuestion['Option'][1],
                        style: const TextStyle(
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
                    widget.answer[currentQuestionIndex + 1] = 2;
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
                    child: Center(
                      child: Text(
                        currentQuestion['Option'][2],
                        style: const TextStyle(
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
                    widget.answer[currentQuestionIndex + 1] = 3;
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
                    child: Center(
                      child: Text(
                        currentQuestion['Option'][3],
                        style: const TextStyle(
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
              onTap: () async => {
                if (option0 || option1 || option2 || option3)
                  {
                    if (currentQuestionIndex == questions.length - 1)
                      {
                        await addResponse(widget.answer),
                        Get.to(
                          () => const ResultScreen(),
                        ),
                      }
                    else
                      {
                        nextQuestion(),
                      }
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
                child: Center(
                  child: (currentQuestionIndex == questions.length - 1)
                      ? const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
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
