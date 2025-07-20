import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/asset_paths.dart';
import '../../../ui/widgets/custom_appbar.dart';
import '../widgets/bottom_sheet/room_bottom_sheet.dart';
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
                          builder: (context) => RoomBottomSheet(),
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
