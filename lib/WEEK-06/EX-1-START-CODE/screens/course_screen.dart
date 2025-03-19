import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/models/course.dart';
import 'package:bla_bla_project/WEEK-06/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.courseId});

  final String courseId;

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (ctx, courseProvider, _) {
        final course = courseProvider.getCourseFor(courseId);
        final scores = course.scores;

        void _addScore() async {
          CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
            MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
          );

          if (newScore != null) {
            courseProvider.addScore(course, newScore);
          }
        }

        Widget content = const Center(child: Text('No Scores added yet.'));

        if (scores.isNotEmpty) {
          content = ListView.builder(
            itemCount: scores.length,
            itemBuilder: (ctx, index) => ListTile(
              title: Text(scores[index].studentName),
              trailing: Text(
                scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              course.name,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(onPressed: _addScore, icon: const Icon(Icons.add)),
            ],
          ),
          body: content,
        );
      },
    );
  }
}