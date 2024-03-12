import 'package:pocketbase/pocketbase.dart';

class Post {
  final String text;
  final String username; // Nom d'utilisateur réel
  final String userImage; // Utilisez pour l'URL de l'avatar de l'utilisateur
  final String date;
  final int likes;
  final List<String> commentIds;
  final int nbComments;

  Post({
    required this.text,
    required this.username,
    required this.userImage, // Ceci est maintenant l'URL de l'image de profil
    required this.date,
    required this.likes,
    required this.commentIds,
    required this.nbComments,
  });

  factory Post.fromPocketBaseAndUser(RecordModel record, RecordModel userRecord, String userImageUrl) {
    List<String> commentIds = List<String>.from(record.getDataValue('comment') ?? []);
    return Post(
      text: record.getDataValue('text') ?? 'Pas de texte',
      username: userRecord.getDataValue('username') ?? 'Nom inconnu',
      userImage: userImageUrl,
      date: record.getDataValue('date').toString() ?? 'Date inconnue',
      likes: record.getDataValue('nb_likes') ?? 0,
      commentIds: commentIds,
      nbComments: record.getDataValue('nb_comments') ?? 0, // ou utilisez commentIds.length pour le nombre de commentaires
    );
  }
}