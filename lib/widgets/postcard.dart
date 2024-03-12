import 'package:flutter/material.dart';
import 'package:marvelhouse/models/post.dart';
import 'package:marvelhouse/screen/postdetailpage.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PostDetailsPage(post: post),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.userImage),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(width: 10),
                  Text(post.username),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                post.text,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              ),
              // Ajoutez d'autres éléments de l'UI ici si nécessaire
            ],
          ),
        ),
      ),
    );
  }
}
