import 'package:flutter/material.dart';
import 'package:new_app37/API.dart';
import 'package:new_app37/home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: false,
                      ),
                      TextFormField(
                        obscureText: false,
                      ),
                      ElevatedButton(
                        onPressed:() {
                                      Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new home()),
              );
                        },
                         child:Text("Submit")),
                          ElevatedButton(
                        onPressed:() {
                                      Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new API()),
              );
                        },
                         child:Text("Submit for API")),
                    ],
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
