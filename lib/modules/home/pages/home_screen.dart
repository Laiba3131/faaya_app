import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildStoryAvatars(),
            const SizedBox(height: 16),
            _buildFilterButtons(),
            const SizedBox(height: 16),
            _buildLiveRoomCard(),
            const SizedBox(height: 16),
            _buildRoomGrid(),
          ],
        ),
      );
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
  Widget _buildStoryAvatars() {
    final users = ['Your Story', 'karenanne', 'zackJohn', 'karen_d', 'craig_love'];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/avatar_${index + 1}.png'),
                ),
                const SizedBox(height: 4),
                Text(
                  users[index],
                  style: const TextStyle(color: Colors.white, fontSize: 12),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
              Text("Culture Topic", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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
          const Text("2 Hours Ago", style: TextStyle(color: Colors.white38, fontSize: 12)),
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
          const Text("View Room", style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
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
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF7F3B94),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    index % 2 == 0
                        ? 'assets/images/culture.jpg'
                        : 'assets/images/music.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                index % 2 == 0 ? "Culture" : "Music",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "Lets Discuss the culture...",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 4),
              const Row(
                children: [
                  Icon(Icons.people, size: 14, color: Colors.white),
                  SizedBox(width: 2),
                  Text("11", style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(width: 8),
                  Icon(Icons.mic, size: 14, color: Colors.white),
                  SizedBox(width: 2),
                  Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(width: 8),
                  Icon(Icons.chat_bubble, size: 14, color: Colors.white),
                  SizedBox(width: 2),
                  Text("2 hours ago", style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
