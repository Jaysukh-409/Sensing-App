import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addResponse(List<int> answer) async {
  CollectionReference response =
      FirebaseFirestore.instance.collection('response');
  String uid = FirebaseAuth.instance.currentUser!.uid;
  return response.doc(uid).set({
    'Response': answer,
  });
}
