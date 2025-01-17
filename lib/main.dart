import 'package:flutter/material.dart';
import 'package:latihan/home_page.dart';
import 'package:latihan/provider/todo_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TodoProvider(), child: MaterialApp(home: HomePage(),),);
  }
}
