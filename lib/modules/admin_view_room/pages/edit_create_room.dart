import 'dart:io';

import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/modules/home/widgets/custom_dropdown.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/routes/nav_router.dart';
import '../../../constants/asset_paths.dart';

class EditCreateRoom extends StatefulWidget {
  const EditCreateRoom({super.key});

  @override
  State<EditCreateRoom> createState() => _EditCreateRoomState();
}

class _EditCreateRoomState extends State<EditCreateRoom> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _filterWordsController = TextEditingController();

  bool _badWordsFilter = false;
  File? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }
  String _privacy = 'Private';
  double _speakerLimit = 17;
  double _audienceLimit = 45;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _filterWordsController.dispose();
    super.dispose();
  }

 String? selectedRegion;
  String? selectedCategory;

  List<String> regionList = [
    'Automatic Selection',
    'Africa',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'South America',
  ];

    List<String> categoryList = [
    'Entertainment',
    'Culture',
    'Music',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Edit Room', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1.1, 0),
            radius: 1.5,
            colors: [
              Color(0xFFC637E5),
              Color(0xFF161616),
              Color(0xFF161616),
            ],
            stops: [0.0, 0.75, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text('Add Room photo',
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                Row(
                  children: [
                     Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Center(
                        child: _pickedImage == null
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: Colors.transparent,
                                ),
                                child: const Icon(Icons.add,
                                    color: Colors.white, size: 20),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _pickedImage!,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                 
                  ],
                ),
                h2,
                PrefixIconButton(
                  onPressed:_pickImage,
                  title: 'Upload Images',
                  prefixIconPath: AssetPaths.galary,
                  backgroundColor: AppColors.primaryColor,
                  height: 55,
                  borderColor: Colors.transparent,
                  mainAxisAlignment: MainAxisAlignment.center,
                  hPadding: 18,
                  borderRadius: 16,
                ),
                h2,
                Text(
                  'Room Name',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h0P5,
                InputField(
                  fontSize: 12,
                  boxConstraints: 20,
                  controller: _nameController,
                  label: "Enter name",
                  labelColor: AppColors.white.withOpacity(0.5),
                  borderRadius: 16,
                  fillColor: AppColors.primaryColor.withOpacity(0.5),
                  borderColor: AppColors.transparent,
                ),
                h1,
                Text(
                  'Room Description',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h0P5,
                Stack(
                  children: [
                    InputField(
                      labelColor: AppColors.white.withOpacity(0.5),
                      boxConstraints: 20,
                      maxLines: 2,
                      fontSize: 12,
                      controller: _descController,
                      label: "Enter description up to 70 characters max.",
                      borderRadius: 16,
                      fillColor: AppColors.primaryColor.withOpacity(0.5),
                      borderColor: AppColors.transparent,
                    ),
                    const Positioned(
                      bottom: 8,
                      right: 8,
                      child: Text(
                        "${22}/${33} max.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                h2,
                Text(
                  'Filter Words',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h0P5,
                Container(
                  height: 55,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetPaths.option),
                      const SizedBox(width: 8),
                      const Text('Enable Bad Words Filter',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      const Spacer(),
                      Switch(
                        thumbColor: WidgetStateProperty.all(AppColors.white),
                        value: _badWordsFilter,
                        onChanged: (val) =>
                            setState(() => _badWordsFilter = val),
                        activeColor: AppColors.primaryColor,
                        inactiveThumbColor: AppColors.white,
                        activeTrackColor: AppColors.primaryColor,
                        inactiveTrackColor:
                            AppColors.primaryColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
                h1,
                Text(
                  'Enter Filter Words',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h0P5,
                Stack(
                  children: [
                    InputField(
                      fontSize: 12,
                      labelColor: AppColors.white.withOpacity(0.5),
                      boxConstraints: 20,
                      maxLines: 2,
                      controller: _filterWordsController,
                      label: 'Enter the words you want to filter.',
                      borderRadius: 16,
                      fillColor: AppColors.primaryColor.withOpacity(0.5),
                      borderColor: AppColors.transparent,
                    ),
                    const Positioned(
                      bottom: 8,
                      right: 8,
                      child: Text(
                        "${22}/${33} max.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                h1,
                Text(
                  'Category',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h0P5,
                 CustomDropdown(
                  height: 50,
                  hintText: selectedCategory??'Select Category ',
                  isPrefixIconVisible: false,
                  title: 'Select Category  ',
                  items: categoryList,
                  selectedItem: selectedCategory,
                  onItemSelected: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                h1,
                Text(
                  'Region',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h0P5,
              CustomDropdown(
                  height: 50,
                  hintText: selectedRegion?? 'Select Category',
                  isPrefixIconVisible: false,
                  title:selectedRegion?? 'Select Category',
                  items: regionList,
                  selectedItem: selectedRegion,
                  onItemSelected: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
                h2,
                Text(
                  'Select Mic Options',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h1,
                Row(
                  children: [
                    Expanded(
                      child: _buildRadioTile('Mic & Comments', _privacy,
                          (val) => setState(() => _privacy = val)),
                    ),
                    w1,
                    Expanded(
                      child: _buildRadioTile('Mic', _privacy,
                          (val) => setState(() => _privacy = val)),
                    ),
                  ],
                ),
                h2,
                Text(
                  'Privacy settings',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                h1,
                Row(
                  children: [
                    Expanded(
                      child: _buildRadioTile('Private', _privacy,
                          (val) => setState(() => _privacy = val)),
                    ),
                    w1,
                    Expanded(
                      child: _buildRadioTile('Public', _privacy,
                          (val) => setState(() => _privacy = val)),
                    ),
                  ],
                ),
                h2,
                _buildSlider('Speaker Limit', _speakerLimit, 0, 20,
                    (val) => setState(() => _speakerLimit = val), context),
                h1,
                _buildSlider('Audience Limit', _audienceLimit, 0, 100,
                    (val) => setState(() => _audienceLimit = val), context),
                const SizedBox(height: 24),
                PrimaryButton(
                  onPressed: () {
                    NavRouter.pop(context);
                  },
                  title: 'Confirm Changes',
                  backgroundColor: AppColors.primaryColor,
                  height: 55,
                  hMargin: 0,
                  borderRadius: 16,
                ),
                PrimaryButton(
                  onPressed: () {
                    NavRouter.pop(context);
                  },
                  title: 'Cancel',
                  titleColor: AppColors.primaryColor,
                  backgroundColor: AppColors.white,
                  height: 55,
                  hMargin: 0,
                  borderRadius: 16,
                ),
                h2,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioTile(
      String label, String groupValue, ValueChanged<String> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: groupValue == label
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max,
      ValueChanged<double> onChanged, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // 👈 Wrap SliderTheme in Expanded
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: const RectangularSliderTrackShape(),
                  trackHeight: 8,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 10),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                ),
                child: Slider(
                  value: value,
                  min: min,
                  max: max,
                  // divisions: (max - min).toInt(),
                  activeColor: AppColors.primaryColor,
                  thumbColor: AppColors.white,
                  inactiveColor: Colors.white,
                  onChanged: onChanged,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value.toInt().toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(min.toInt().toString(),
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 65.0),
              child: Text(max.toInt().toString(),
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
