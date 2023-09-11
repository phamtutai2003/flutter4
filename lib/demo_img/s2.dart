import 'package:flutter/material.dart';
import 'package:flutter_ki4/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  
  @override
  Widget build(BuildContext context){
    var title = 'Web Images';
    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Image.network('https://picsum.photos/250?image=9'),
      ),
    );
  }
}