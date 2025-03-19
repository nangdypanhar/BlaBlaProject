

import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/repository/course_mock_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/course_list_screen.dart';

void main() {
  final CourseMockRepository courseMockRepository = CourseMockRepository();
  runApp(ChangeNotifierProvider(
    create: (context) => CoursesProvider(courseMockRepository),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}