// Dummy room model
class LiveRoom {
  final String title;
  final String description;
  final String host;
  final String timeAgo;
  final int peopleCount;
  final int micCount;
  final int chatCount;

  LiveRoom({
    required this.title,
    required this.description,
    required this.host,
    required this.timeAgo,
    required this.peopleCount,
    required this.micCount,
    required this.chatCount,
  });
}
