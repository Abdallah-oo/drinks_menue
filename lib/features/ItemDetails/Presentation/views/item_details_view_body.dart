import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/views/widgets/drink.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/views/widgets/drinks_dots.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/views/widgets/info_panel.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<Color> _kBgTints = AppColors.drinkBackground;

Color? _tintFor(int index) => _kBgTints[index];

class ItemDetailsViewBody extends StatefulWidget {
  const ItemDetailsViewBody({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<ItemDetailsViewBody> createState() => _ItemDetailsViewBodyState();
}

class _ItemDetailsViewBodyState extends State<ItemDetailsViewBody> {
  static const List<ItemModel> _items = ItemModel.items;

  late final PageController _pageController;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex.toDouble();

    _pageController =
        PageController(initialPage: widget.initialIndex, viewportFraction: 0.50)
          ..addListener(() {
            setState(() => _currentPage = _pageController.page ?? _currentPage);
          });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int current = _currentPage.round();

    final Color bgTint = _tintFor(current) ?? AppColors.surface;

    return AnimatedContainer(
     duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      color: bgTint,
      child: Column(
        children: [
          //app bar
          SafeArea(child: TopBar(current: current, total: _items.length)),
         //drink view
          Expanded(
            child: Drink(
              drinks: _items,
              controller: _pageController,
              curruntPage: _currentPage,
            ),
          ),
         //drinks dots
          DrinksDots(count: _items.length, current: _currentPage),
         //info and and to cart btn
          ChangeNotifierProvider(
            create: (context) => SizeAndQtyProvider(),
            child: InfoPanel(
              items: _items,
              curruntIndex: _currentPage.round(),
            ),
          ),
        ],
      ),
    );
  }
}
