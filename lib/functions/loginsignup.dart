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
      }
    } catch (e) {
      // res = e.toString();
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
        // res = "Please Input Valid Credentials";
      }
    } catch (e) {
      // res = e.toString();
    }
  }

  // Logout User
  void logout() async {
    await auth.signOut();
  }
}
