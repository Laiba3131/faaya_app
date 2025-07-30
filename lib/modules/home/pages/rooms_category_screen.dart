import 'package:oxyn_dev/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/asset_paths.dart';
import '../../../ui/widgets/custom_appbar.dart';
import '../widgets/room_card.dart';
import 'package:oxyn_dev/modules/home/pages/room_screen.dart';

class RoomsCategoryScreen extends StatelessWidget {
  const RoomsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rooms = [
      {
        'title': 'Rock music',
        'image': AssetPaths.sound,
        'avatars': [
          AssetPaths.avatarImage,
          AssetPaths.listen,
          AssetPaths.sound
        ],
        'peopleCount': '20+',
      },
      // Add more room data as needed
      {
        'title': 'Rock music',
        'image': AssetPaths.music,
        'avatars': [
          AssetPaths.avatarImage,
          AssetPaths.avatarImage,
          AssetPaths.listen
        ],
        'peopleCount': '20+',
      },
      {
        'title': 'Rock music',
        'image': AssetPaths.youngMan,
        'avatars': [AssetPaths.avatarImage, AssetPaths.avatarImage],
        'peopleCount': '20+',
      },
      {
        'title': 'Rock music',
        'image': AssetPaths.imageMusic,
        'avatars': [
          AssetPaths.avatarImage,
          AssetPaths.avatarImage,
          AssetPaths.listen
        ],
        'peopleCount': '20+',
      },
      {
        'title': 'Rock music',
        'image': AssetPaths.listen,
        'avatars': [AssetPaths.avatarImage, AssetPaths.sound],
        'peopleCount': '20+',
      },
      {
        'title': 'Rock music',
        'image': AssetPaths.imageMusic,
        'avatars': [
          AssetPaths.avatarImage,
          AssetPaths.sound,
          AssetPaths.listen
        ],
        'peopleCount': '20+',
      },
      {
        'title': 'Rock music',
        'image': AssetPaths.listen,
        'avatars': [AssetPaths.avatarImage, AssetPaths.sound],
        'peopleCount': '20+',
      },
      {
        'title': 'Rock music',
        'image': AssetPaths.sound,
        'avatars': [
          AssetPaths.avatarImage,
          AssetPaths.sound,
          AssetPaths.listen
        ],
        'peopleCount': '20+',
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(
        title: 'Rooms Category',
        titleColor: AppColors.white,
        showBackButton: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7B3FA0),
              Color(0xFF18121E),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GridView.builder(
              itemCount: rooms.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final room = rooms[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RoomScreen()),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            room['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        room['title'],
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          ...List.generate(
                            room['avatars'].length,
                            (i) => Transform.translate(
                              offset: Offset(i == 0 ? 0 : -8.0, 0),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: AssetImage(room['avatars'][i]),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            room['peopleCount'],
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
