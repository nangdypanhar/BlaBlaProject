import '../model/post.dart';
import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  List<Post> posts = [
    Post(id: 1, title: 'Flutter', description: 'Mobile development'),
    Post(id: 2, title: 'Dart', description: 'Programming language'),
    Post(id: 3, title: 'React', description: 'UI library'),
    Post(id: 4, title: 'Node.js', description: 'Backend JavaScript'),
    Post(id: 5, title: 'Machine Learning', description: 'AI subset'),
    Post(id: 6, title: 'Firebase', description: 'App backend services'),
  ];
  @override
  Future<List<Post>> getPosts() {
    return Future.delayed(Duration(seconds: 3), () => posts);
  }
}
