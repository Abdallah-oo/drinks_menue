import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/Home/Presentation/views/widgets/category_taps.dart';
import 'package:drinks_menue/features/Home/Presentation/views/widgets/home_app_bar.dart';
import 'package:drinks_menue/features/Home/Presentation/views/widgets/home_search_bar.dart';
import 'package:drinks_menue/features/Home/Presentation/views/widgets/menu_items_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String _query = '';
  String _selectedTab = '';
  List<ItemModel> get items {
    List<ItemModel> items = ItemModel.items;
    if (_selectedTab == "Hot") {
      items = items.where((i) => i.isHot == true).toList();
    } else if (_selectedTab == "Iced") {
      items = items.where((i) => i.isHot == false).toList();
    }
    if (_query.isNotEmpty) {
      items = items
          .where(
            (i) =>
                i.name.toLowerCase().contains(_query.toLowerCase()) ||
                i.description.toLowerCase().contains(_query.toLowerCase()),
          )
          .toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(),
          const SizedBox(height: AppSpacing.md),
          HomeSearchBar(
            onQueryChanged: (query) => setState(() {
              _query = query;
            }),
          ),
          const SizedBox(height: AppSpacing.md),
          CategoryTabs(
            onCategoryChanged: (category) => setState(() {
         
              _selectedTab = category;
            }),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: ItemList(
              items: items,
              query: _query,
              tabLabel: _selectedTab,
            ),
          ),
        ],
      ),
    );
  }
}
