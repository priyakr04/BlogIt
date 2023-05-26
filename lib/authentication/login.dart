// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:newblog/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email,password;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TextField(
                 decoration:InputDecoration(hintText: "E-mail"), 
                 
              ),
              const SizedBox(
                height: 8.0,
              ),
              const TextField(
                  decoration:InputDecoration(hintText: "Password"), 
                  ),
              
               const SizedBox(
                height: 24.0,
              ),

                ElevatedButton(
              onPressed: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
             },
              child: const Text("Submit"),), 
            ],
          )
      );
  }
}