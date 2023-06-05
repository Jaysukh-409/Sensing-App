import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sensing_app/Screens/feelingscreen.dart';
import 'package:sensing_app/Screens/loginscreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    ever(user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const FeelingsScreen());
    }
  }

  // Login User
  Future<void> login({required String email, required String password}) async {
    try {
      if (email.isNotEmpty &&
          email.isEmail &&
          password.isNotEmpty &&
          password.length >= 6) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        // res = "Please Input Valid Credentials";
        if (!email.isNotEmpty || !password.isNotEmpty) {
          Get.snackbar(
            "Login Failed",
            "All fields should be filled.",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (!email.isEmail) {
          Get.snackbar(
            "Login Failed",
            "Entered email isn't valid.",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (password.length < 6) {
          Get.snackbar(
            "Login Failed",
            "Password length should be atleast 6.",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Login Failed",
            "Entered credentials isn't valid. Please check it.",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Signup User
  Future<void> signup({required String email, required String password}) async {
    try {
      if (email.isNotEmpty &&
          email.isEmail &&
          password.isNotEmpty &&
          password.length >= 6) {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        if (!email.isNotEmpty || !password.isNotEmpty) {
          Get.snackbar(
            "Signup Failed",
            "All fields should be filled.",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (!email.isEmail) {
          Get.snackbar(
            "Signup Failed",
            "Entered email isn't valid.",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (password.length < 6) {
          Get.snackbar(
            "Signup Failed",
            "Password length should be atleast 6.",
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Signup Failed",
            "Entered credentials isn't valid. Please check it.",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Signup Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Logout User
  void logout() async {
    await auth.signOut();
  }
}
