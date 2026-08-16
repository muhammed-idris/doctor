import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/constants/app_theme_extension.dart';
import '../features/doctor/widget/dr_sheet.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search',
    this.showFilter = true,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool showFilter;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor:glass.searchColor,

              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: glass.colorIcons,
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.all(13),
                child: Image.asset(
                  "assets/icons/search-normal.png",
                  width: 20,
                  height: 20,
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: glass.primaryBlue,
                  width: 2,
                ),
              ),
            ),
          ),
        ),

        if (widget.showFilter) ...[
          Gap(width * 0.016),

          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(
                      2,
                      2,
                      2,
                      20,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(28),
                      ),
                    ),
                    child: const DrSheet(),
                  );
                },
              );
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ],
    );
  }
}