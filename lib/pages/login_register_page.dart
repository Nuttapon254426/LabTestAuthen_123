import 'dart:ffi';

import 'package:authentest_123/pages/auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentest_123/pages/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key:key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

  class _LoginPageState extends State<LoginPage>{
  String? errorMessage = '';
  bool isLogin = true ;

  final TextEditingController _controllerEmail = TextEditingController();
   final TextEditingController _controllerPassword = TextEditingController();
   
   Future<void> signInWithEmailAndPassword()async{
    try {
      await Auth().signWithEmailAndPassword(email: _controllerEmail.text, 
      password:_controllerPassword.text ,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
   }
    Future<void>createUserWithEmailAndPassword()async{
      try {
        await Auth().createUserWithEmailAndPassword(
          email:_controllerEmail.text, 
          password:_controllerPassword.text,
          );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
        });
      }
    }

    Widget _title(){
      return const Text('Firebase Auth');
    }
    Widget _entryField(
      String title,
      TextEditingController controller,
    ){
      return TextField(
        controller: controller,
        decoration:InputDecoration(
        labelText: title,
        ),
      );
    }

    Widget _errorMessage(){
      return Text(errorMessage == '' ?  '' :'Humm? $errorMessage');
    }

    Widget _submitButton(){
      return ElevatedButton(
        onPressed:
        isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
         child: Text(isLogin ? 'Login':'Register'),
         );
    }
    Widget _loginOrRegisterButton(){
      return TextButton(
        onPressed:() {
          setState(() {
            isLogin = !isLogin;
          });
        },
         child:Text(isLogin ? 'Register inster instead':'login instead'),
         );
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: _title(),
        ),
        body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child:Column(
          crossAxisAlignment : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email',_controllerEmail),
            _entryField('password',_controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),

          ],
        )

        ),
      );
    }
  }