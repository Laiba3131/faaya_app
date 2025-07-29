import 'package:bkmc/config/routes/nav_router.dart';
import 'package:bkmc/modules/admin_view_room/pages/edit_create_room.dart';
import 'package:bkmc/modules/admin_view_room/widgets/kick_dialogue.dart';
import 'package:bkmc/modules/admin_view_room/widgets/request_join_mic.dart';
import 'package:bkmc/modules/common/widgets/custom_reason_dropdown.dart';
import 'package:bkmc/modules/home/pages/animation_test.dart';
import 'package:bkmc/modules/home/pages/notification_screen.dart';
import 'package:bkmc/modules/home/widgets/action_dropdown_withour_icon.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/asset_paths.dart';
import '../../../ui/button/primary_button.dart';
import '../../../ui/widgets/custom_appbar.dart';
import '../../home/widgets/bottom_sheet/room_bottom_sheet.dart';
import '../../home/widgets/session_lable.dart';

class AdminViewRoomScreen extends StatefulWidget {
  const AdminViewRoomScreen({super.key});

  @override
  State<AdminViewRoomScreen> createState() => _AdminViewRoomScreenState();
}

class _AdminViewRoomScreenState extends State<AdminViewRoomScreen> {
  bool isEmojiVisible = false;

  @override
  Widget build(BuildContext context) {
    String selectedReason = "Bullying";

    List<String> reasonList = [
      'Bullying',
      'Inappropriate content',
      'Harassment',
      'Abuse',
      'Profanity',
      'Child Abuse',
      'Religious abuse',
      'Nudity',
    ];
    final host = {
      'name': 'Julia Andrew',
      'role': 'Culture',
      'desc': 'Culture shapes design, visuals, language, and user behavior.',
      'image': AssetPaths.listen,
    };
    final speakers = [
      {'name': 'Julia Andrew', 'image': AssetPaths.avatarImage, 'isHost': true},
      {'name': 'Mark Albert', 'image': AssetPaths.avatarImage, 'isHost': false},
      {'name': 'Rehana MJ', 'image': AssetPaths.avatarImage, 'isHost': false},
    ];
    final audience = [
      {'name': 'Audrey Blue', 'image': AssetPaths.avatarImage},
      {'name': 'Mariah', 'image': AssetPaths.avatarImage},
      {'name': 'Tomas Euna', 'image': AssetPaths.avatarImage},
      {'name': 'Rendra', 'image': AssetPaths.avatarImage},
      {'name': 'Audrey Blue', 'image': AssetPaths.avatarImage},
      {'name': 'Mariah', 'image': AssetPaths.avatarImage},
      {'name': 'Tomas Euna', 'image': AssetPaths.avatarImage},
      {'name': 'Rendra', 'image': AssetPaths.avatarImage},
    ];

    void _showMenu(BuildContext context, Offset position) {
      final overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;
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
            child: ActionDropdownWithoutIcon(
              actions: [
                DropdownAction(
                    label: "Invite",
                    onTap: () {
                      NavRouter.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            // return KickDialogue();
                            return const RequestJoinMic();
                          });
                    }),
                DropdownAction(
                    label: "Kick",
                    onTap: () {
                      NavRouter.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const KickDialogue();
                            // return const RequestJoinMic();
                          });
                    }),
                DropdownAction(
                    label: "Ban",
                    // onTap: () {
                    //   NavRouter.pop(context);
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return CustomReasonDropdown(
                    //           onItemSelected: (p0) {
                    //             setState(() {
                    //               selectedRegion = p0;
                    //             });
                    //           },
                    //           selectedItem: selectedRegion,
                    //           items: reasonList,
                    //         );
                    //       });
                    // }
                    onTap: () {}),

                DropdownAction(
                    label: "Report",
                    onTap: () {
                      NavRouter.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomReasonDropdown(
                              onItemSelected: (p0) {
                                setState(() {
                                  selectedReason = p0;
                                });
                              },
                              selectedItem: selectedReason,
                              items: reasonList,
                            );
                          });
                    }),
                // DropdownAction(label: "Kick", onTap: () => print("Kick")),
                // You can pass only 1, 2, 3, or 4
              ],
            ),
          ),
        ],
      );
    }

    void _showAdminMenu(BuildContext context, Offset position) {
      final overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;
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
            child: ActionDropdownWithoutIcon(
              actions: [
                DropdownAction(
                    label: "Edit",
                    onTap: () {
                      NavRouter.pop(context);
                      NavRouter.push(context, const EditCreateRoom());
                    }),

                DropdownAction(label: "End Room", onTap: () {}),
                // DropdownAction(label: "Kick", onTap: () => print("Kick")),
                // You can pass only 1, 2, 3, or 4
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(
        title: 'Room',
        titleColor: AppColors.white,
        showBackButton: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B3FA0), Color(0xFF18121E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Admin Host Card
                      Column(
                        spacing: 6.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 12.0,
                                  children: [
                                    Container(
                                      width: 53,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          host['image']!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      spacing: 8.0,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          spacing: 6.0,
                                          children: [
                                            SvgPicture.asset(AssetPaths.prince),
                                            Text(
                                              host['name']!,
                                              style: context
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: AppColors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF05ED0),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            host['role']!,
                                            style: context.textTheme.bodyMedium!
                                                .copyWith(
                                                    color: AppColors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      NavRouter.push(
                                          context,
                                          const NotificationScreen(
                                            isUserRequestPage: true,
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffC637E5),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      padding: const EdgeInsets.all(
                                        6.0,
                                      ),
                                      child: SvgPicture.asset(
                                        AssetPaths.thListIcon,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (iconContext) => OnClick(
                                      onTap: () async {
                                        final RenderBox button = iconContext
                                            .findRenderObject() as RenderBox;
                                        final Offset position =
                                            button.localToGlobal(Offset.zero);
                                        _showAdminMenu(iconContext, position);
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(
                            host['desc']!,
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ).paddingSymmetric(
                        horizontal: 12.0,
                      ),
                      h2,

                      // Pinned Comments view

                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffC637E5).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xff888888).withOpacity(0.15),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            spacing: 12.0,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pinned Comments",
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SvgPicture.asset(AssetPaths.pinIcon),
                                ],
                              ),
                              const ThreeSecondComment(),
                              // const SixSecondsComment(),
                              // const TenSecondsComment(),
                            ],
                          ),
                        ),
                      ),
                      h2,

                      // Speakers
                      const SectionLabel(label: 'Speaker'),

                      h2,
                      SizedBox(
                        height: 89,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: speakers.length,
                          separatorBuilder: (_, index) =>
                              const SizedBox(width: 18),
                          itemBuilder: (context, i) {
                            final s = speakers[i];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: (s['isHost'] == true)
                                                ? BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors.green,
                                                      width: 1.5,
                                                    ),
                                                    shape: BoxShape.circle)
                                                : const BoxDecoration(),
                                            child: CircleAvatar(
                                              radius: 24,
                                              backgroundImage: AssetImage(
                                                  s['image']!.toString()),
                                            ),
                                          ),
                                          if (s['isHost'] == true)
                                            const Positioned(
                                              top: -2,
                                              left: -2,
                                              child: Icon(Icons.star,
                                                  color: Color(0xFFF05ED0),
                                                  size: 18),
                                            ),
                                          Positioned(
                                            bottom: -2,
                                            right: -2,
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: const BoxDecoration(
                                                  color: AppColors.white,
                                                  shape: BoxShape.circle),
                                              child: SvgPicture.asset(
                                                AssetPaths.mic,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ),
                                          if (i == 0)
                                            Positioned(
                                              left: 24 - 14,
                                              // center horizontally (mainRadius - emojiRadius)
                                              top: 24 - 14,
                                              // center vertically
                                              child: isEmojiVisible
                                                  ? const MovingEmojiAvatar(
                                                      imagePath:
                                                          AssetPaths.emoji,
                                                    )
                                                  : const SizedBox(),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        s['name']!.toString(),
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (iconContext) => OnClick(
                                    onTap: () async {
                                      final RenderBox button = iconContext
                                          .findRenderObject() as RenderBox;
                                      final Offset position =
                                          button.localToGlobal(Offset.zero);
                                      _showMenu(iconContext, position);
                                    },
                                    child: const Icon(Icons.more_vert,
                                        color: Colors.white, size: 18),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      h2,
                      // Audience
                      const SectionLabel(label: 'Audience'),
                      h2,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: audience.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          // mainAxisSpacing: 10,
                          // crossAxisSpacing: 10,
                          // childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, i) {
                          final a = audience[i];
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage:
                                              AssetImage(a['image']!),
                                        ),
                                        if (i == 5)
                                          Positioned(
                                            left: 24 - 14,
                                            // center horizontally (mainRadius - emojiRadius)
                                            top: 24 - 14,
                                            // center vertically
                                            child: !isEmojiVisible
                                                ? const MovingEmojiAvatar(
                                                    imagePath: AssetPaths.emoji,
                                                  )
                                                : const SizedBox(),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: 60,
                                      // restrict width for proper ellipsis
                                      child: Text(
                                        a['name']!,
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                          color: AppColors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 12,
                                child: Builder(
                                  builder: (iconContext) => OnClick(
                                    onTap: () async {
                                      final RenderBox button = iconContext
                                          .findRenderObject() as RenderBox;
                                      final Offset position =
                                          button.localToGlobal(Offset.zero);
                                      _showMenu(iconContext, position);
                                    },
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      backgroundColor: Colors.transparent,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => RoomBottomSheet(
                            onEmojiClick: (v) {
                              NavRouter.pop(
                                context,
                              );
                              setState(() {
                                isEmojiVisible = !isEmojiVisible;
                              });
                            },
                          ));
                },
                height: 30,
                borderRadius: 18,
                title: "View More",
                hMargin: 8,
                vMargin: 8,
                fontSize: 10.0,
              ).paddingOnly(right: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

class ThreeSecondComment extends StatelessWidget {
  const ThreeSecondComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(colors: [
          const Color(0xff344BFB).withOpacity(0.6),
          const Color(0xff374BE5),
        ]),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        spacing: 12.0,
        children: [
          CircleAvatar(
            child: ClipOval(
              child: Image.asset(AssetPaths.avatarImage),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mariah",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Culture is more than style, it’s how we connect.",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff000000).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Image.asset(
                  AssetPaths.starIcon,
                  height: 24.0,
                ),
              ),
              Text(
                "3s",
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
