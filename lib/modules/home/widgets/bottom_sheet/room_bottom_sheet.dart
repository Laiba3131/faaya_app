import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/home/model/comment_model.dart';
import 'package:bkmc/modules/home/widgets/coin_button.dart';
import 'package:bkmc/modules/home/widgets/nested_comment_tile.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class RoomBottomSheet extends StatefulWidget {
  @override
  State<RoomBottomSheet> createState() => RoomBottomSheetState();
}

class RoomBottomSheetState extends State<RoomBottomSheet> {
  int? replyingToCommentId;
  String? replyingToUserName;
  List<CommentModel> comments = [
    CommentModel(
      id: 1,
      avatar: AssetPaths.avatarImage,
      name: 'Audrey Blue',
      time: '1h ago',
      comment: 'Love this Topic',
      likes: 1,
      replies: [
        CommentModel(
          id: 2,
          avatar: AssetPaths.avatarImage,
          name: 'Mariah',
          time: '32m ago',
          comment: 'Yes, That is an interesting topic',
          likes: 0,
          replies: [
            CommentModel(
              id: 3,
              avatar: AssetPaths.avatarImage,
              name: 'Julia Andrew',
              time: '18m ago',
              comment: 'Appreciate it',
              likes: 0,
            ),
          ],
        ),
      ],
    ),
    CommentModel(
      id: 4,
      avatar: AssetPaths.avatarImage,
      name: 'Mark Albert',
      time: '1h ago',
      comment: 'Love this Topic',
      likes: 0,
      replies: [
        CommentModel(
          id: 5,
          avatar: AssetPaths.avatarImage,
          name: 'Mariah',
          time: '32m ago',
          comment: 'Appreciate it',
          likes: 0,
        ),
        CommentModel(
          id: 5,
          avatar: AssetPaths.avatarImage,
          name: 'Mariah',
          time: '32m ago',
          comment: 'Appreciate it',
          likes: 0,
        ),
      ],
    ),
  ];

  void onLike(int id) {
    setState(() {
      void likeRecursive(List<CommentModel> list) {
        for (var c in list) {
          if (c.id == id) {
            c.likes++;
            return;
          }
          likeRecursive(c.replies);
        }
      }

      likeRecursive(comments);
    });
  }

  void onReply(int id, String userName) {
    setState(() {
      replyingToCommentId = id;
      replyingToUserName = userName;
    });
  }

  void onCancelReply() {
    setState(() {
      replyingToCommentId = null;
      replyingToUserName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF18121E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ...comments.map((c) => NestedCommentTile(
                          comment: c,
                          onLike: onLike,
                          onReply: onReply,
                        )),
                    const Divider(color: Colors.white24, height: 32),
                    // Coin Buttons
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CoinButton(
                            label: '3s', coins: 5, color: Color(0xFF3B3BFF)),
                        CoinButton(
                            label: '6s', coins: 20, color: Color(0xFF2ECC71)),
                        CoinButton(
                            label: '10s', coins: 50, color: Color(0xFFFF3B3B)),
                      ],
                    ),
                    h2,
                    // Emoji Row
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('👏'),
                          Text('💪'),
                          Text('👌'),
                          Text('🥳'),
                          Text('😊'),
                          Text('😍'),
                          Text('😎'),
                          Text('🔥'),
                        ],
                      ),
                    ),
                    h2,
                    SuffixIconButton(
                      onPressed: () {
                        // NavRouter.push(context, LoginScreen());
                      },
                      title: 'Request to Speak',
                      suffixIconWidget: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                      ),
                      backgroundColor: AppColors.primaryColor,
                      height: 55,
                      borderColor: Colors.transparent,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      hPadding: 18,
                      borderRadius: 16,
                    ),
                    h2,
                    // Reply Bar
                    if (replyingToUserName != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF7B3FA0).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFFF05ED0), width: 1),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              backgroundImage:
                                  AssetImage(AssetPaths.avatarImage),
                            ),
                            w1,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Replying to $replyingToUserName',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: onCancelReply,
                              child: const Icon(Icons.close,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    h2,
                    // Message Input
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Type a thought here.',
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.send, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        w1,
                        Icon(Icons.emoji_emotions,
                            color: Colors.white, size: 32),
                        w1,
                        Icon(Icons.pan_tool,
                            color: Colors.pinkAccent, size: 32),
                      ],
                    ),
                    h2,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
