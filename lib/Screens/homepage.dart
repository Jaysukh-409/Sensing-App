import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  bool mfi, psa, pfs;
  HomeScreen(
      {required this.mfi, required this.pfs, required this.psa, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "NOT_EXIST";

  void _getusername() async {
    CollectionReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('users');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> snapshot = await user.doc(uid).get();

    if (snapshot.exists) {
      setState(() {
        username = snapshot.data()!['Username'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getusername();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Fill in Questionnaire",
                style: TextStyle(
                  fontSize: 17.5,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: widget.mfi
                    ? Colors.green.withOpacity(0.85)
                    : const Color.fromARGB(255, 42, 42, 49).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "MFI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: widget.psa
                    ? Colors.green.withOpacity(0.85)
                    : const Color.fromARGB(255, 42, 42, 49).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "PSA",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: widget.pfs
                    ? Colors.green.withOpacity(0.85)
                    : const Color.fromARGB(255, 42, 42, 49).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "PFS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => {
                if (widget.mfi && widget.pfs && widget.psa)
                  {}
                else
                  {
                    Get.snackbar(
                      "Not Answer all Questionnaire",
                      "Please answer all questionnaire first.",
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                    ),
                  }
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Start Sensing",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
