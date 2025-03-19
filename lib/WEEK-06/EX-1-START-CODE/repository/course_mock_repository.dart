import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/models/course.dart';
import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/repository/course_repository.dart';

class CourseMockRepository extends CourseRepository {
  List<Course> courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
    Course(name: 'REACT JS'),
    Course(name: 'LARAVEL'),
  ];

  @override
  List<Course> getCourses() => courses;

  void addScore(Course course, CourseScore score) {
    final index = courses.indexWhere((c) => c.courseId == course.courseId);
    if (index != -1) {
      courses[index].scores.add(score);
    }
  }
}
