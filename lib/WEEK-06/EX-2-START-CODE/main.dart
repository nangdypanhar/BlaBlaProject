import 'package:bla_bla_project/WEEK-06/EX-2-START-CODE/repository/http_posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  // PostRepository postRepo = MockPostRepository();
  PostHttpRepository httpRepository = PostHttpRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: httpRepository),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
