import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/asset_paths.dart';
import '../../../ui/widgets/custom_appbar.dart';
import '../widgets/room_info_button.dart';
import '../widgets/session_lable.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(
        title: 'Room',
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
                      w1,
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
                    const Spacer(),
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
                      return Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration:  (s['isHost'] == true)?BoxDecoration(
                                  border: Border.all(color: AppColors.green,width: 1.5,
                                  ),shape: BoxShape.circle
                                ):const BoxDecoration(),
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
                                  decoration: const BoxDecoration(color: AppColors.white,
                                  shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(AssetPaths.mic,color: AppColors.red,),
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
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(a['image']!),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            a['name']!,
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // Join Room Button
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF05ED0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => _RoomBottomSheet(),
                        );
                      },
                      child: const Text(
                        'Join Room',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoomBottomSheet extends StatelessWidget {
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
                    // Comments
                    _CommentTile(
                      avatar: AssetPaths.avatarImage,
                      name: 'Audrey Blue',
                      time: '1h ago',
                      comment: 'Love this Topic',
                    ),
                    _CommentTile(
                      avatar: AssetPaths.avatarImage,
                      name: 'Mark Albert',
                      time: '1h ago',
                      comment: 'Love this Topic',
                    ),
                    const Divider(color: Colors.white24, height: 32),
                    // Coin Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CoinButton(label: '3s', coins: 5, color: Color(0xFF3B3BFF)),
                        _CoinButton(label: '6s', coins: 20, color: Color(0xFF2ECC71)),
                        _CoinButton(label: '10s', coins: 50, color: Color(0xFFFF3B3B)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Emoji Row
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
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
                    const SizedBox(height: 16),
                    // Request to Speak Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF05ED0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.mic, color: Colors.white),
                        label: const Text(
                          'Request to Speak',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Reply Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF7B3FA0).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFF05ED0), width: 1),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage(AssetPaths.avatarImage),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Replying to Abigail Johnson',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Sure thing, I\'ll have a look today.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.close, color: Colors.white70),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Message Input
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Type a thought here.',
                                      hintStyle: TextStyle(color: Colors.white54),
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
                        const SizedBox(width: 8),
                        Icon(Icons.emoji_emotions, color: Colors.white, size: 32),
                        const SizedBox(width: 8),
                        Icon(Icons.pan_tool, color: Colors.pinkAccent, size: 32),
                      ],
                    ),
                    const SizedBox(height: 16),
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

class _CommentTile extends StatelessWidget {
  final String avatar;
  final String name;
  final String time;
  final String comment;
  const _CommentTile({required this.avatar, required this.name, required this.time, required this.comment});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(avatar),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.more_vert, color: Colors.white54, size: 18),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  comment,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Reply',
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CoinButton extends StatelessWidget {
  final String label;
  final int coins;
  final Color color;
  const _CoinButton({required this.label, required this.coins, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.monetization_on, color: Colors.yellowAccent, size: 20),
          const SizedBox(width: 2),
          Text(
            coins.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
