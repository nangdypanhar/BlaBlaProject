import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/models/course.dart';

abstract class CourseRepository {
  List<Course> getCourses();
  void addScore(Course course, CourseScore score);
}