import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/config/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();

  List<Map<String, dynamic>> groceries = [];

  Future<void> getGroceries() async {
    try {
      final response = await dio.get('https://68b0bdb33b8db1ae9c04ca73.mockapi.io/groceries');
      inspect(response.data);
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(response.data);
      setState(() {
        groceries = data;
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [Text("default text"), Text("gilroy text")]),
      floatingActionButton: FloatingActionButton(
        onPressed: getGroceries,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
