import 'package:api_demo/pages/chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/chapter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ChapterProvider(),
        child: const ChapterList(),
      ),
    );
  }
}
