
import 'package:authentest_123/pages/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async{
 runApp(const MyApp());

}
 class MyApp extends StatefulWidget {
  const MyApp({Key? key }) : super(key:key);

  @override
 Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const WidgetTree(),
  );
 }
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}


