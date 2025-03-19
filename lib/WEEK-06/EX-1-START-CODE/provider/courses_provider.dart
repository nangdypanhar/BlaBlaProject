import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/models/course.dart';
import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/repository/course_repository.dart';
import 'package:flutter/material.dart';

class CoursesProvider extends ChangeNotifier {
  final CourseRepository _courseRepository;
  CoursesProvider(this._courseRepository);

  List<Course> get getCourses => _courseRepository.getCourses();

}
