import 'package:flutter/material.dart';
import 'package:marvelhouse/models/post.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.username), // Le titre peut être le nom d'utilisateur ou autre
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.userImage),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    post.username,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                post.text,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 20),
              Text(
                'Date: ${post.date}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // TODO: Gérer l'action de like
                    },
                  ),
                  Text('${post.likes}'), // Affichage du nombre de likes
                  SizedBox(width: 10), // Espacement entre les éléments
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      // TODO: Gérer l'action de commentaire
                    },
                  ),
                  Text('${post.nbComments}'), // Affichage du nombre de commentaires
                  SizedBox(width: 10), // Espacement supplémentaire pour la propreté
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // TODO: Gérer l'action de partage
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
