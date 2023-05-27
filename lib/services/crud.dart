import 'package:cloud_firestore/cloud_firestore.dart';

class CrudeMethods {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance.collection("blogs").add(blogData).catchError((e) {
      print(e);
    });
  }

  Future<QuerySnapshot> getData() async {
    return FirebaseFirestore.instance.collection("blogs").get();
  }
}