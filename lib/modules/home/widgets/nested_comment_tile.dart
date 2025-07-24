import 'package:bkmc/modules/home/model/comment_model.dart';
import 'package:bkmc/modules/home/widgets/action_dropdown_menu.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:flutter/material.dart';

class NestedCommentTile extends StatelessWidget {
  final CommentModel comment;
  final void Function(int id) onLike;
  final void Function(int id, String userName) onReply;
  final int depth;
  const NestedCommentTile({
    required this.comment,
    required this.onLike,
    required this.onReply,
    this.depth = 0,
    super.key,
  });

  void _showMenu(BuildContext context, Offset position) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(position, position),
        Offset.zero & overlay.size,
      ),
      color: Colors.transparent,
      elevation: 0,
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ActionDropdownMenu(
            onReply: () => print("Reply clicked"),
            onCopy: () => print("Copy clicked"),
            onReport: () => print("Report clicked"),
            onDelete: () => print("Delete clicked"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 24.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(comment.avatar),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          comment.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          comment.time,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Builder(
                          builder: (iconContext) => OnClick(
                            onTap: () async {
                              final RenderBox button =
                                  iconContext.findRenderObject() as RenderBox;
                              final Offset position =
                                  button.localToGlobal(Offset.zero);
                              _showMenu(iconContext, position);
                            },
                            child: const Icon(Icons.more_vert,
                                color: Colors.white54, size: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      comment.comment,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => onLike(comment.id),
                          child: Row(
                            children: [
                              const Icon(Icons.favorite, color: Colors.red, size: 16),
                              const SizedBox(width: 2),
                              Text(
                                comment.likes.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => onReply(comment.id, comment.name),
                          child: const Text(
                            'Reply',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Render replies
          ...comment.replies.map((r) => NestedCommentTile(
                comment: r,
                onLike: onLike,
                onReply: onReply,
                depth: depth + 1,
              )),
        ],
      ),
    );
  }
}
