import 'package:bkmc/config/config.dart';
import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/home/pages/notification_screen.dart';
import 'package:bkmc/modules/home/pages/room_screen.dart';
import 'package:bkmc/modules/home/pages/rooms_category_screen.dart';
import 'package:bkmc/modules/home/widgets/custom_dropdown.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/country.dart';
import '../widgets/dummy_live_room.dart';
import '../widgets/room_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedRegion;
  Country? selectedCountry;

  List<String> regionList = [
    'Africa',
    'South America',
    'North America',
    'Asia',
    'Europe',
  ];
  final List<LiveRoom> allRooms = [
    LiveRoom(
      title: "Music Vibes",
      description: "Talk about music",
      host: "Ali",
      timeAgo: "2h ago",
      peopleCount: 100,
      micCount: 4,
      chatCount: 10,
    ),
    LiveRoom(
      title: "Tech Talks",
      description: "Discuss latest tech",
      host: "Sara",
      timeAgo: "1h ago",
      peopleCount: 70,
      micCount: 3,
      chatCount: 5,
    ),
    LiveRoom(
      title: "Gaming Room",
      description: "Game lovers hangout",
      host: "Wasif",
      timeAgo: "30m ago",
      peopleCount: 50,
      micCount: 2,
      chatCount: 7,
    ),
  ];
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<LiveRoom> filteredRooms = searchQuery.isEmpty
        ? []
        : allRooms
            .where((room) =>
                room.title.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();

    return Scaffold(
        //  appBar: CustomAppbarForHome(
        //   title: 'Home',
        //   searchController: searchController,
        //   onSearchChange: (value) {
        //     setState(() {
        //       searchQuery = value.trim();
        //     });
        //   },
        // ),
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          automaticallyImplyLeading: false,
          title: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: InputField(
                controller: searchController,
                label: 'Search rooms',
                borderRadius: 20,
                suffixIcon: SvgPicture.asset(AssetPaths.search),
                fillColor: Color(0xFF936f9b),
                labelColor: AppColors.white,
                boxConstraints: 20,
                onChange: (value) {
                  setState(() {
                    searchQuery = value.trim();
                  });
                },
              )),
          actions: [
            OnClick(
              onTap: () {
                NavRouter.push(context, NotificationScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: SvgPicture.asset(AssetPaths.notification),
              ),
            )
          ],
        ),
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: searchQuery.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: filteredRooms.map((room) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child:   SizedBox(
                        height: 260,
                        child: RoomCard(
                                  onTap: () {
                                    NavRouter.push(context, RoomScreen());
                                  },
                                  title: "Culture Topic",
                                  subtitle:  "Lets Discuss the culture of the north America.",
                                  imagePath: AssetPaths.music,
                                  peopleCount: 11,
                                  micCount: 3,
                                  timeAgo: "2 hours ago",
                                ),)
                        //  LiveRoomCard(
                        //   title: room.title,
                        //   description: room.description,
                        //   host: room.host,
                        //   timeAgo: room.timeAgo,
                        //   peopleCount: room.peopleCount,
                        //   micCount: room.micCount,
                        //   chatCount: room.chatCount,
                        //   onTap: () {
                        //     NavRouter.push(context, RoomScreen());
                        //   },
                        // ),
                      );
                    }).toList(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStoryAvatars(context),
                      h2,
                      _buildFilterButtons(context),
                      h2,
                      SizedBox(
                        height: 260,
                        child: RoomCard(
                                  onTap: () {
                                    NavRouter.push(context, RoomScreen());
                                  },
                                  title: "Culture Topic",
                                  subtitle:  "Lets Discuss the culture of the north America.",
                                  imagePath: AssetPaths.music,
                                  peopleCount: 11,
                                  micCount: 3,
                                  timeAgo: "2 hours ago",
                                ),
                      ),
                      // LiveRoomCard(
                      //   title: "Culture Topic",
                      //   description:
                      //       "Lets Discuss the culture of the north America.",
                      //   host: "Alyan Alee Khan",
                      //   timeAgo: "2 Hours Ago",
                      //   peopleCount: 11,
                      //   micCount: 3,
                      //   chatCount: 3,
                      //   onTap: () {
                      //     NavRouter.push(context, RoomScreen());
                      //   },
                      // ),
                      h2,
                      _buildRoomGrid(),
                    ],
                  ),
          ),
        ));
  }

  Widget _buildStoryAvatars(BuildContext context) {
    final users = [
      'John Doe',
      'karenanne',
      'zackJohn',
      'karen d',
      'John hd'
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (_, index) {
            // final isLive = index == 1; // 2nd item (0-based index)

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                 Stack(
  clipBehavior: Clip.none, 
  alignment: Alignment.bottomCenter,
  children: [
    Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: const CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(AssetPaths.avatarImage),
      ),
    ),
    Positioned(
      bottom: -4, 
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color:AppColors.blurColor,
          border: Border.all(color: AppColors.white,width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          'LIVE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ],
),
                  const SizedBox(height: 5),
                  Text(
                    users[index],
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _buildFilterButtons(context) {
    var countries = readCountriesFromList();
    return Row(
      // spacing: 2.0,
      children: [
        // Expanded(
        //   flex: 3,
        //   child: CustomDropdown(
        //     height: 40,
        //     title: 'Region',
        //     hintText: selectedRegion ?? 'Region',
        //     items: regionList,
        //     selectedItem: selectedRegion,
        //     onItemSelected: (value) {
        //       setState(() {
        //         selectedRegion = value;
        //       });
        //     },
        //   ),
        // ),
        Expanded(
          flex: 3,
          child: GenericDropdown<Country>(
            height: 44,
            title: 'Select Country',
            hintText: truncateString(selectedCountry?.name ?? 'Country',
                maxLength: 10),
            items: countries,
            selectedItem: selectedCountry,
            onItemSelected: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
            displayFunction: (v) => v.name,
          ),
        ),
        w1,
        Expanded(flex: 3, child: _buildFilterChip("Category", context))
      ],
    );
  }

  Widget _buildFilterChip(String label, context) {
    return PrefixIconButton(
      onPressed: () {
        if (label == "Category") {
          NavRouter.push(context, const RoomsCategoryScreen());
        }
      },
      title: 'Category',
      prefixIconPath: AssetPaths.category,
      height: 42,
      width: 200,
      backgroundColor: AppColors.primaryColor,
      borderColor: AppColors.transparent,
      borderRadius: 8,
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
          onTap: () {
            NavRouter.push(context, RoomScreen());
          },
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
