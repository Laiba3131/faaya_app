import 'package:oxyn_dev/config/routes/nav_router.dart';
import 'package:oxyn_dev/modules/common/widgets/custom_reason_dropdown.dart';
import 'package:oxyn_dev/modules/home/pages/moving_emoji_avatar.dart';
import 'package:oxyn_dev/modules/home/pages/joined_room_screen.dart';
import 'package:oxyn_dev/modules/home/widgets/action_dropdown_withour_icon.dart';
import 'package:oxyn_dev/ui/button/primary_button.dart';
import 'package:oxyn_dev/ui/widgets/on_click.dart';
import 'package:oxyn_dev/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/asset_paths.dart';
import '../../../ui/widgets/custom_appbar.dart';
import '../widgets/room_info_button.dart';
import '../widgets/session_lable.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedReason = "Abuse";

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
              stops: [
                -50,
                10,
                30,
                60,
                1000,
              ],
              colors: [
                Color(0xFFC637E5),
                Color(0xFF161616),
                Color(0xFF161616),
                Color(0xFF161616),
                Color(0xFF161616),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.decal),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Host Card
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      w3,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AssetPaths.prince),
                                w0P5,
                                Text(
                                  host['name']!,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Color(0xFFF05ED0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                host['role']!,
                                style: context.textTheme.bodyMedium!.copyWith(
                                    color: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              host['desc']!,
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                h2,
                // Room Info Buttons
                Wrap(
                  spacing: 4,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    const RoomInfoButton(label: 'Public Room'),
                    w1,
                    const RoomInfoButton(label: 'Mic & Comments'),
                    const RoomInfoButton(label: '11/20'),
                  ],
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
                    separatorBuilder: (_, __) => const SizedBox(width: 18),
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
                                        backgroundImage:
                                            AssetImage(s['image']!.toString()),
                                      ),
                                    ),
                                    if (s['isHost'] == true)
                                      const Positioned(
                                        top: -2,
                                        left: -2,
                                        child: Icon(Icons.star,
                                            color: Color(0xFFF05ED0), size: 18),
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
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  s['name']!.toString(),
                                  style: context.textTheme.bodyMedium!.copyWith(
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
                                final RenderBox button =
                                    iconContext.findRenderObject() as RenderBox;
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
                Expanded(
                  child: GridView.builder(
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
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundImage: AssetImage(a['image']!),
                                    ),
                                // Stack(
                                //   clipBehavior: Clip.none,
                                //   children: [
                                //     const Positioned(
                                //       left: 24 -
                                //           14, // center horizontally (mainRadius - emojiRadius)
                                //       top: 24 - 14, // center vertically
                                //       child: MovingEmojiAvatar(
                                //         imagePath: AssetPaths.emoji,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                const SizedBox(height: 4),
                                SizedBox(
                                  width:
                                      60, // restrict width for proper ellipsis
                                  child: Text(
                                    a['name']!,
                                    textAlign: TextAlign.center,
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
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
                                  color: Colors.white54,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // Join Room Button
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: PrimaryButton(
                      // onPressed: () {
                      //   showModalBottomSheet(
                      //     context: context,
                      //     isScrollControlled: true,
                      //     backgroundColor: Colors.transparent,
                      //     builder: (context) => RoomBottomSheet(),
                      //   );
                      // },
                      onPressed: () {
                        NavRouter.push(context, JoinedRoomScreen());
                      },
                      title: 'Join Room',
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 16,
                      hMargin: 0,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
