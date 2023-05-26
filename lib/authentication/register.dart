import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? fName,lName,email,password;
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                 decoration:const InputDecoration(hintText: "First Name"), 
                onChanged: (val) {
                  fName=val;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
               TextField(
                  decoration:const InputDecoration(hintText: "Last Name"), 
                  onChanged: (val) {
                  lName=val;
                },
                  ),
              const SizedBox(
                height: 8.0,
              ),
               TextField(
                  decoration:const InputDecoration(hintText: "E-mail"), 
                  onChanged: (val) {
                  email=val;
                },
                  ),
               
              const SizedBox(
                height: 8.0,
              ),
               TextField(
                  decoration:const InputDecoration(hintText: "Password"), 
                  onChanged: (val) {
                  password=val;
                },
                  ),
              const SizedBox(
                height: 24.0,
              ),
               ElevatedButton(onPressed: () { 
                
                },
              child: const Text("Submit"),), 
            ],
          ));
  }
}