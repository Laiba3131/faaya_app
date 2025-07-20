import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/room_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          automaticallyImplyLeading: false,
          title: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: InputField(
                controller: TextEditingController(),
                label: 'Search rooms',
                borderRadius: 20,
                suffixIcon: SvgPicture.asset(AssetPaths.search),
                fillColor: Color(0xFF936f9b),
                labelColor: AppColors.white,
                boxConstraints: 20,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 13.0),
              child: SvgPicture.asset(AssetPaths.notification),
            )
          ],
        ),
        backgroundColor: AppColors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStoryAvatars(context),
              h2,
              _buildFilterButtons(),
              h2,
              _buildLiveRoomCard(),
              h2,
              _buildRoomGrid(),
            ],
          ),
        ));
  }

  Widget _buildSearchBar() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF0D6F9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search rooms',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          CircleAvatar(radius: 4, backgroundColor: Colors.green),
        ],
      ),
    );
  }

  Widget _buildStoryAvatars(BuildContext context) {
    final users = [
      'Your Story',
      'karenanne',
      'zackJohn',
      'karen_d',
      'craig_love'
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(
                      3), 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors
                          .primaryColor, 
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(AssetPaths.avatarImage),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  users[index],
                  style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      children: [
        _buildFilterChip("Region"),
        const SizedBox(width: 10),
        _buildFilterChip("Category"),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.filter_list),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF05ED0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildLiveRoomCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text("Culture Topic",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.wifi, color: Colors.purple),
              Text(" Live", style: TextStyle(color: Colors.purple)),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Lets Discuss the culture of the north America.",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          const Text("Alyan Alee Khan", style: TextStyle(color: Colors.white)),
          const SizedBox(height: 4),
          const Text("2 Hours Ago",
              style: TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.people, size: 16, color: Colors.white),
              SizedBox(width: 4),
              Text("11", style: TextStyle(color: Colors.white)),
              SizedBox(width: 16),
              Icon(Icons.mic, size: 16, color: Colors.white),
              SizedBox(width: 4),
              Text("3", style: TextStyle(color: Colors.white)),
              SizedBox(width: 16),
              Icon(Icons.chat, size: 16, color: Colors.white),
              SizedBox(width: 4),
              Text("3", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 12),
          const Text("View Room",
              style: TextStyle(
                  color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRoomGrid() {
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (_, index) {
        return RoomCard(
          title: index % 2 == 0 ? "Culture" : "Music",
          subtitle: index % 2 == 0
              ? "Let's Discuss the culture..."
              : "24/7 Music room for chilling...",
          imagePath: index % 2 == 0 ? AssetPaths.culture : AssetPaths.music,
          peopleCount: 11,
          micCount: 3,
          timeAgo: "2 hours ago",
        );
      },
    );
  }
}
