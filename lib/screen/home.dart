import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:marvelhouse/widgets/postcard.dart'; // Assurez-vous que le chemin soit correct
import 'package:marvelhouse/models/post.dart'; // Assurez-vous que le chemin soit correct
import 'package:marvelhouse/screen/postdetailpage.dart'; // Assurez-vous que le chemin soit correct

class HomePage extends StatefulWidget {
  final PocketBase pb;
  const HomePage({Key? key, required this.pb}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    _refreshPosts();
  }

  Future<void> _refreshPosts() async {
    print('Rafraîchir les posts');
    try {
      final result = await widget.pb.collection('posts').getList(page: 1, perPage: 20);
      print('Résultat: $result');
      List<Post> tempPosts = [];

      for (var record in result.items) {
        String userId = record.getDataValue('username');
        try {
          final userRecord = await widget.pb.collection('users').getOne(userId);
          // Supposons que le champ contenant les images est nommé "avatar" et non "documents"
          final filenames = userRecord.getListValue<String>('avatar');
          Object userImageUrl = filenames.isNotEmpty ?
          widget.pb.files.getUrl(userRecord, filenames[0], thumb: '50x50') :
          'https://via.placeholder.com/150';

          Post post = Post.fromPocketBaseAndUser(record, userRecord, userImageUrl.toString());

          tempPosts.add(post);
        } catch (e) {
          print("Erreur lors de la récupération des détails de l'utilisateur pour l'ID $userId: $e");
        }
      }

      setState(() {
        posts = tempPosts;
      });
    } catch (e) {
      print("Erreur lors de la récupération des posts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshPosts,
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetailsPage(post: post)),
                );
              },
              child: PostCard(post: post),
            );
          },
        ),
      ),
    );
  }
}
