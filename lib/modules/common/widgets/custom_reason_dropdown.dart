import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';

class CustomReasonDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final void Function(String) onItemSelected;

  const CustomReasonDropdown({
    Key? key,
    required this.items,
    this.selectedItem,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<CustomReasonDropdown> createState() => _CustomReasonDropdownState();

  static void show(
    BuildContext context, {
    required List<String> items,
    String? selectedItem,
    required void Function(String) onItemSelected,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => CustomReasonDropdown(
        items: items,
        selectedItem: selectedItem,
        onItemSelected: onItemSelected,
      ),
    );
  }
}

class _CustomReasonDropdownState extends State<CustomReasonDropdown> {
  late TextEditingController searchController;
  late List<String> filteredItems;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    filteredItems = List.from(widget.items);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            isSelected
                                ? const Icon(Icons.check_circle,
                                    color: AppColors.primaryColor)
                                : const Icon(Icons.radio_button_unchecked,
                                    color: AppColors.primaryColor),
                          ],
                        ),
                      ),
                      h1,
                      h0P3,
                      const Divider(color: AppColors.bgGrey),
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
  }
}
