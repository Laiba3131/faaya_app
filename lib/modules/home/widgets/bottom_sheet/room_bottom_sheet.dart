import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/home/model/comment_model.dart';
import 'package:bkmc/modules/home/widgets/coin_button.dart';
import 'package:bkmc/modules/home/widgets/nested_comment_tile.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_colors.dart';
import '../../../common/widgets/mic_permission_dialog.dart';

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
                    Row(
                      spacing: 8.0,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CoinButton(
                            label: '3s',
                            coins: 5,
                            coinBoxColor: const Color(0xFF3B3BFF),
                            mainBoxColors: [
                              const Color(0xff344BFB).withOpacity(0.6),
                              const Color(0xff374BE5),
                            ],
                          ),
                        ),
                        w1,
                        Expanded(
                          child: CoinButton(
                            label: '6s',
                            coins: 20,
                            coinBoxColor: const Color(0xFF2ECC71),
                            mainBoxColors: [
                              const Color(0xff00CE56).withOpacity(0.6),
                              const Color(0xff37E5AE),
                            ],
                          ),
                        ),
                        w1,
                        Expanded(
                          child: CoinButton(
                            label: '10s',
                            coins: 50,
                            coinBoxColor: const Color(0xFFFF3B3B),
                            mainBoxColors: [
                              const Color(0xffFB3434).withOpacity(0.6),
                              const Color(0xffE53737),
                            ],
                          ),
                        ),
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
                    h1,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Replying to Abigail Johnson ',
                                style: context.textTheme.bodyMedium!.copyWith(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Sure thing, I’ll have a look today.",
                                style: context.textTheme.bodyMedium!.copyWith(
                                    color: AppColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.close,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                    h2,
                    SuffixIconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => MicPermissionDialog(),
                        );
                      },
                      title: 'Request to Speak',
                      suffixIconWidget: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          AssetPaths.mic,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      backgroundColor: AppColors.primaryColor,
                      height: 55,
                      borderColor: Colors.transparent,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          color: const Color(0xFF7B3FA0).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xFFF05ED0), width: 1),
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
                      spacing: 4.0,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff888888).withOpacity(
                                  0.3,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                )),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                            ),
                            child: Row(
                              children: [
                                Image.asset(AssetPaths.giftIcon),
                                w2,
                                Image.asset(AssetPaths.divider),
                                w1,
                                Expanded(
                                  child: InputField(
                                      boxConstraints: 12,
                                      controller: TextEditingController(),
                                      label: "Type a thought here"),
                                ),
                                w1,
                                Image.asset(AssetPaths.sendMessage),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          AssetPaths.smileEmoji,
                          height: 30.0,
                        ),
                        SvgPicture.asset(
                          AssetPaths.commentHand,
                          height: 30.0,
                        ),
                        SvgPicture.asset(
                          AssetPaths.micRequest,
                          height: 30.0,
                        ),
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
