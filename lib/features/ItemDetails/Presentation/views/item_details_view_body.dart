import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/drink.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/drinks_dots.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/info_panel.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<Color> _kBgTints = [
  Color(0xFFEAF7EE),
  Color(0xFFEAF3FF),
  Color(0xFFFFF4EA),
  Color(0xFFFFEAEA),
  Color(0xFFEAFFF7),
  Color(0xFFF5EAFF),
  Color(0xFFFFFBEA),
  Color(0xFFEAF7EE),
  Color(0xFFEAF3FF),
  Color(0xFFFFF4EA),
  Color(0xFFFFEAEA),
  Color(0xFFEAFFF7),
  Color(0xFFF5EAFF),
  Color(0xFFFFFBEA),
  Color(0xFFEAF7EE),
  Color(0xFFEAF3FF),
  Color(0xFFFFF4EA),
  Color(0xFFFFEAEA),
];

Color _tintFor(int index) => _kBgTints[index % _kBgTints.length];

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

    final Color bgTint = _tintFor(current);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      color: bgTint,
      child: SafeArea(
        child: Column(
          children: [
            TopBar(current: current, total: _items.length),

            Expanded(
              child: Drink(
                drinks: _items,
                controller: _pageController,
                curruntPage: _currentPage,
              ),
            ),

            DrinksDots(count: _items.length, current: _currentPage),

            ChangeNotifierProvider(
            
              create: (context) => SizeAndQtyProvider(),
              child: InfoPanel(
              
                items: _items,
                curruntIndex: _currentPage.round(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
