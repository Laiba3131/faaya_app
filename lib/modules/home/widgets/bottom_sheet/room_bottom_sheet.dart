import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/common/widgets/mic_request_dialog.dart';
import 'package:bkmc/modules/home/model/comment_model.dart';
import 'package:bkmc/modules/home/widgets/coin_button.dart';
import 'package:bkmc/modules/home/widgets/nested_comment_tile.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/app_colors.dart';
import '../../../../ui/input/input_field.dart';
import '../../../common/widgets/mic_permission_dialog.dart';

class RoomBottomSheet extends StatefulWidget {
  const RoomBottomSheet({super.key, this.onEmojiClick});

  final Function(bool)? onEmojiClick;

  @override
  State<RoomBottomSheet> createState() => RoomBottomSheetState();
}

class RoomBottomSheetState extends State<RoomBottomSheet> {
  int? replyingToCommentId;
  String? replyingToUserName;
  bool emojiClicked = false;
  bool emojiList = false;
  bool hasMicPermission = false;
  bool hasMicPermissionShow = false;
bool isMute=false;
  List<String> emojis = ['👏', '💪', '👌', '🥳', '😊', '😍', '😎', '🔥'];

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
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF18121E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              // controller: scrollController,
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 12.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CoinButton(
                        label: '3s',
                        coins: 5,
                        coinBoxColor: const Color(0xFF3B3BFF),
                        mainBoxColors: [
                          const Color(0xff344BFB).withOpacity(0.6),
                          const Color(0xff374BE5),
                        ],
                      ),
                      CoinButton(
                        label: '6s',
                        coins: 20,
                        coinBoxColor: const Color(0xFF2ECC71),
                        mainBoxColors: [
                          const Color(0xff00CE56).withOpacity(0.6),
                          const Color(0xff37E5AE),
                        ],
                      ),
                      CoinButton(
                        label: '10s',
                        coins: 50,
                        coinBoxColor: const Color(0xFFFF3B3B),
                        mainBoxColors: [
                          const Color(0xffFB3434).withOpacity(0.6),
                          const Color(0xffE53737),
                        ],
                      ),
                    ],
                  ),
                ),
                h2,

                if (emojiList)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: emojis.map((emoji) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              emojiClicked = !emojiClicked;
                            });
                            widget.onEmojiClick!(emojiClicked);
                          },
                          child: Text(emoji, style: TextStyle(fontSize: 24)),
                        );
                      }).toList(),
                    ),
                  ),
                h1,

                // Reply bar
                if (replyingToUserName != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
              ],
            ),
          ),
          Container(
            color: const Color(0xFF18121E),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      emojiList = !emojiList;
                    });
                  },
                  child: SvgPicture.asset(AssetPaths.smileEmoji, height: 30.0),
                ),
                w1,Image.asset(AssetPaths.giftIcon),w1,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff888888).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        
                        // w2,
                        // Image.asset(AssetPaths.divider),
                        // w1,
                        Expanded(
                          child: InputField(
                            boxConstraints: 6,
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
                if (!hasMicPermission)
                  OnClick(
                    onTap: () async {
                      setState(() {
                        hasMicPermissionShow = true;
                      });

                      final accepted = await showDialog<bool>(
                        context: context,
                        builder: (context) => const MicRequestDialog(),
                      );

                      if (accepted == true) {
                        setState(() {
                          hasMicPermission = true;
                        });
                      }
                    },
                    child: SvgPicture.asset(
                      hasMicPermissionShow
                          ? AssetPaths.requestHand
                          : AssetPaths.commentHand,
                      height: 30.0,
                    ),
                  ),
                w1,
                OnClick(
                  onTap: (){
                    setState(() {
                      
                      isMute=!isMute;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                     !isMute? AssetPaths.mic:AssetPaths.microphoneSlash  ,
                      color: AppColors.primaryColor,
                      height: 22,
                    ),
                  ),
                ),
                  w1,
                Container( padding: const EdgeInsets.all(6), decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle),child: SvgPicture.asset(AssetPaths.volumeCross, height: 22.0,  color: AppColors.primaryColor,)),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
