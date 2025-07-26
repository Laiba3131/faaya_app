import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/home/model/comment_model.dart';
import 'package:bkmc/modules/home/widgets/coin_button.dart';
import 'package:bkmc/modules/home/widgets/nested_comment_tile.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            // CommentModel(
            //   id: 3,
            //   avatar: AssetPaths.avatarImage,
            //   name: 'Julia Andrew',
            //   time: '18m ago',
            //   comment: 'Appreciate it',
            //   likes: 0,
            // ),
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
          id: 6,
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
      return Stack(
        children: [
          // Scrollable Area
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF18121E),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80), // Space for fixed input
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 16),
                  ...comments.map((c) => NestedCommentTile(
                        comment: c,
                        onLike: onLike,
                        onReply: onReply,
                      )),
                  const Divider(color: Colors.white24, height: 32),

                  // Coin Buttons
                  Row(
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

                  // Emoji bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('👏'), Text('💪'), Text('👌'), Text('🥳'),
                        Text('😊'), Text('😍'), Text('😎'), Text('🔥'),
                      ],
                    ),
                  ),
                  h1,

                  // Reply bar
                  if (replyingToUserName != null)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Replying to $replyingToUserName',
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
                          GestureDetector(
                            onTap: onCancelReply,
                            child: const Icon(Icons.close,
                                color: AppColors.primaryColor),
                          )
                        ],
                      ),
                    ),
                  h2,

                  // Request to Speak
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
                  const SizedBox(height: 10), // Small gap above input
                ],
              ),
            ),
          ),

          // Fixed Input Field at Bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF18121E),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff888888).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
                              label: "Type a thought here",
                            ),
                          ),
                          w1,
                          Image.asset(AssetPaths.sendMessage),
                        ],
                      ),
                    ),
                  ),
                  w1,
                  SvgPicture.asset(AssetPaths.smileEmoji, height: 30.0),
                  w1,
                  SvgPicture.asset(AssetPaths.commentHand, height: 30.0),
                  w1,
                  SvgPicture.asset(AssetPaths.micRequest, height: 30.0),
                ],
              ),
            ),
          )
        ],
      );
    },
  );
}
}