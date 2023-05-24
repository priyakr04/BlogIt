// ignore_for_file: body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';

class CrudeMethods {
  Future <void> addData(blogData) async{
    FirebaseFirestore.instance.collection("blogs").add(blogData).catchError((e){
      // ignore: avoid_print
      print(e);
    });
  }

  getData() async{

    return FirebaseFirestore.instance.collection("blogs").doc();
  }
}