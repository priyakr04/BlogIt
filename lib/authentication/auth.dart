import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  Future <void> addData(data) async{
    FirebaseFirestore.instance.collection("register").add(data).catchError((e){
      // ignore: avoid_print
      print(e);
    });
  }

  
}