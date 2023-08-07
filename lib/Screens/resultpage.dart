import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensing_app/Screens/feelingscreen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5.0),
                color:
                    const Color.fromARGB(255, 162, 175, 255).withOpacity(0.2),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Based on your response we generate following Results",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.5,
              ),
              Container(
                color: Colors.pinkAccent.withOpacity(0.2),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Graph",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.pinkAccent[50],
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Percentage : XX %",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const FeelingsScreen()),
                child: Container(
                  width: 140,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Colors.black, Colors.pink, Colors.black],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Return to Home",
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
      ),
    );
  }
}
