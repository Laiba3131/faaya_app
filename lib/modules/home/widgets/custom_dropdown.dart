import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> items;
  final String? selectedItem;
  final String hintText;
  final bool isPrefixIconVisible;
  final double height;
  final ValueChanged<String> onItemSelected;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.hintText,
    required this.height,
    this.isPrefixIconVisible = true,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCustomDialog,
      child: Container(
        height: widget.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.isPrefixIconVisible
                    ? Icon(Icons.public, color: Colors.white)
                    : SizedBox.shrink(),
                SizedBox(width: 8),
                Text(widget.hintText, style: TextStyle(color: Colors.white)),
              ],
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
      ),
    );
  }

  void _showCustomDialog() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredItems = List.from(widget.items);

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputField(
                      controller: searchController,
                      label: "Search",
                      fillColor: AppColors.white,
                      borderColor: AppColors.primaryColor,
                      borderRadius: 16,
                      boxConstraints: 20,
                      labelColor: AppColors.primaryColor,
                      onChange: (value) {
                        setState(() {
                          filteredItems = widget.items
                              .where((item) => item
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    h2,
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredItems.length,
                        itemBuilder: (_, index) {
                          final item = filteredItems[index];
                          final isSelected = item == widget.selectedItem;

                          return Column(
                            children: [
                              OnClick(
                                onTap: () {
                                  Navigator.pop(context);
                                  widget.onItemSelected(item);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    isSelected
                                        ? const Icon(Icons.check_circle,
                                            color: AppColors.primaryColor)
                                        : const Icon(
                                            Icons.radio_button_unchecked,
                                            color: AppColors.primaryColor),
                                  ],
                                ),
                              ),
                              h1,
                              h0P3,
                              const Divider(
                                color: AppColors.bgGrey,
                              ),
                              h1,
                              h0P3,
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
