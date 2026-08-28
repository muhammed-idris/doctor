import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/back_app_bar.dart';
import '../../doctor/widget/dr_recommendation_widget.dart';
import '../../doctor/widget/dr_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: BackAppBar(
          appBarTitle: "Recommendation Doctor",
          showBackButton: false,

        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: glass.searchColor,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: glass.colorIcons),
                          prefixIcon: Image.asset(
                            "assets/icons/search-normal.png",
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
                                width: 2
                            ),
                          ),
                        ),
                      ),
                    ),
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
                              padding: const EdgeInsets.fromLTRB(2, 2, 2, 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(28),
                                ),
                              ),
                              child:  DrSheet(),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.filter_list),
                    )
                  ],
                ),
                Gap(height * 0.015),
                DrRecommendationWidget(doctors: [],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
