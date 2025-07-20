class CommentModel {
  final int id;
  final String avatar;
  final String name;
  final String time;
  final String comment;
  int likes;
  List<CommentModel> replies;
  CommentModel({
    required this.id,
    required this.avatar,
    required this.name,
    required this.time,
    required this.comment,
    this.likes = 0,
    this.replies = const [],
  });
}
