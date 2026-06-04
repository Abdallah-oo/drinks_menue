import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Home/Presentation/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
// It's good practice to ensure the binding is initialized before running the app.
WidgetsFlutterBinding.ensureInitialized();
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Flutter Demo',
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background),
),
home: HomeView(),
);
}
}
//................................................................................
import 'dart:math' as math;
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
double get screenWidth => MediaQuery.of(this).size.width;
double get screenHeight => MediaQuery.of(this).size.height;

double responsiveWidth({
double? screen,
required double percentage,
required double min,
required double max,
}) {
return math.min(math.max( (screen??screenWidth) \* percentage, min), max);
}

double responsiveHeight({
double? screen,
required double percentage,
required double min,
required double max,
}) {
return math.min(math.max((screen??screenHeight) \* percentage, min), max);
}
}
//.......................................
import 'package:flutter/material.dart';

class AppColors {
// ─── Brand ──────────────────────────────────────────────────────────────────
static const primary = Color.fromARGB(255, 33, 160, 39); // vibrant green
static const primaryLight = Color(0xFFE8F8EF); // green tint for backgrounds
static const primaryDark = Color.fromARGB(255, 21, 117, 26); // pressed / deep green

// ─── Neutrals ───────────────────────────────────────────────────────────────
static const ink = Color(0xFF1E1E1E); // near-black titles
static const ink1 = Color.fromARGB(255, 39, 39, 39); // near-black titles
static const ink2 = Color(0xFF6B7280); // body text / subtitles
static const inkDisabled = Color(0xFFD1D5DB); // placeholders

// ─── Surfaces ───────────────────────────────────────────────────────────────
static const background = Color(0xFFF8F9FA); // page background
static const surface = Color(0xFFFFFFFF); // cards
static const surfaceAlt = Color(0xFFF3F4F6); // input fills, chip fills

// ─── Semantic ───────────────────────────────────────────────────────────────
static const error = Color(0xFFEF4444);
static const warning = Color(0xFFF59E0B);
static const info = Color(0xFF3B82F6);

// ─── Shadows ────────────────────────────────────────────────────────────────
static const shadow = Color(0x0D000000); // 5 % black
static const shadowMedium = Color(0x1A000000); // 10 % black

//drink background
static const List<Color> drinkBackground = [
Color.fromARGB(255, 252, 247, 229),
Color.fromARGB(255, 251, 249, 241),
Color.fromARGB(255, 255, 249, 247),
Color.fromARGB(255, 251, 243, 216),
Color.fromARGB(255, 244, 253, 249),
Color.fromARGB(255, 251, 255, 239),
Color.fromARGB(255, 255, 252, 236),
Color.fromARGB(255, 248, 255, 250),
Color.fromARGB(255, 255, 249, 247),
];

}
//.......................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

/// Reusable shadow presets — consistent elevation across the app.
abstract final class AppShadows {
static const List<BoxShadow> card = [
BoxShadow(
color: AppColors.shadow,
blurRadius: 16,
offset: Offset(0, 4),
),
BoxShadow(
color: AppColors.shadowMedium,
blurRadius: 4,
offset: Offset(0, 1),
),
];

static const List<BoxShadow> button = [
BoxShadow(
color: AppColors.primaryDark,
blurRadius: 12,
offset: Offset(0, 6),
),
];

static const List<BoxShadow> appBar = [
BoxShadow(
color: AppColors.shadow,
blurRadius: 8,
offset: Offset(0, 2),
),
];
}//.......................................................................
/// Spacing scale — 4-pt grid system.
/// Use these everywhere instead of magic numbers.
abstract final class AppSpacing {
static const double xs = 4.0;
static const double sm = 8.0;
static const double md = 16.0;
static const double lg = 24.0;
static const double xl = 32.0;
static const double xxl = 48.0;

// ─── Radius ─────────────────────────────────────────────────────────────────
static const double radiusSm = 8.0;
static const double radiusMd = 12.0;
static const double radiusLg = 20.0;
static const double radiusXl = 28.0;
static const double radiusFull = 999.0;

// ─── Page padding ───────────────────────────────────────────────────────────
static const double pagePadding = 20.0;
}//.................................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyles {
// ─── Display ────────────────────────────────────────────────────────────────
static const displayLarge = TextStyle(
fontSize: 32,
fontWeight: FontWeight.w800,
color: AppColors.ink,
letterSpacing: -0.5,
height: 1.2,
);

static const displayMedium = TextStyle(
fontSize: 24,
fontWeight: FontWeight.w700,
color: AppColors.ink,
letterSpacing: -0.3,
height: 1.3,
);

// ─── Title ──────────────────────────────────────────────────────────────────
static const titleLarge = TextStyle(
fontSize: 18,
fontWeight: FontWeight.w700,
color: AppColors.ink,
letterSpacing: -0.2,
);

static const titleMedium = TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
color: AppColors.ink,
letterSpacing: -0.1,
);

// ─── Body ───────────────────────────────────────────────────────────────────
static const bodyMedium = TextStyle(
fontSize: 13,
fontWeight: FontWeight.w400,
color: AppColors.ink2,
height: 1.5,
);

static const bodySmall = TextStyle(
fontSize: 11,
fontWeight: FontWeight.w400,
color: AppColors.ink2,
height: 1.4,
);

// ─── Label ──────────────────────────────────────────────────────────────────
static const labelLarge = TextStyle(
fontSize: 14,
fontWeight: FontWeight.w700,
color: AppColors.surface,
letterSpacing: 0.3,
);

static const labelMedium = TextStyle(
fontSize: 12,
fontWeight: FontWeight.w600,
color: AppColors.ink2,
letterSpacing: 0.2,
);

static const labelSmall = TextStyle(
fontSize: 10,
fontWeight: FontWeight.w600,
color: AppColors.ink2,
letterSpacing: 0.5,
);

// ─── Price ──────────────────────────────────────────────────────────────────
static const price = TextStyle(
fontSize: 15,
fontWeight: FontWeight.w700,
color: AppColors.primary,
letterSpacing: 0.1,
);
}
//.........................................................
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
const CustomButton({
super.key,
required this.radius,
this.onPressed,
this.padding,
required this.child,
this.color,
this.borderSide,
this.elevation,
this.borderRadiusGeometry,
});
final void Function()? onPressed;

final EdgeInsetsGeometry? padding;
final Widget child;
final double radius;
final Color? color;
final BorderSide? borderSide;
final double? elevation;
final BorderRadiusGeometry? borderRadiusGeometry;

@override
Widget build(BuildContext context) {
return ElevatedButton(
onPressed: onPressed,
style: ButtonStyle(
elevation: WidgetStateProperty.all(0),

backgroundColor: WidgetStateProperty.all(
color ?? Colors.transparent,
),

overlayColor: WidgetStateProperty.all(Colors.transparent),

surfaceTintColor: WidgetStateProperty.all(Colors.transparent),

shadowColor: WidgetStateProperty.all(Colors.transparent),

padding: WidgetStateProperty.all(
padding ?? const EdgeInsets.symmetric(vertical: 10),
),

shape: WidgetStateProperty.all(
RoundedRectangleBorder(
borderRadius:
borderRadiusGeometry ?? BorderRadius.circular(radius),
side: borderSide ?? BorderSide.none,
),
),

tapTargetSize: MaterialTapTargetSize.shrinkWrap,
minimumSize: WidgetStateProperty.all(const Size(0, 0)),
),

      child: child,
    );

}
}
//.....................................................
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
const CustomText({
super.key,
required this.text,
this.style,
this.align,
this.maxLines,
this.minFontSize,
this.decoration,
});

final String text;
final TextStyle? style;
final TextAlign? align;
final int? maxLines;
final double? minFontSize;
final TextDecoration? decoration;

static TextDirection \_directionOf(String text) {
return RegExp(r'[\u0600-\u06FF]').hasMatch(text)
? TextDirection.rtl
: TextDirection.ltr;
}

@override
Widget build(BuildContext context) {
return AutoSizeText(
text,
textAlign: align,
textDirection: \_directionOf(text),
maxLines: maxLines ?? 1,
minFontSize: minFontSize ?? 8,
overflow: TextOverflow.ellipsis,
style: decoration != null
? (style ?? const TextStyle()).copyWith(decoration: decoration)
: style,
);
}
}
//...........................................................
enum DrinkCategory { hot, iced, smoothie, mojito, tea }
class ItemModel {
const ItemModel({
required this.image,
required this.name,
required this.description,
required this.price,
required this.category,
});

final String image;
final String name;
final String description;
final String price;
final DrinkCategory category;

bool get isHot => category == DrinkCategory.hot;

// ─── Menu Data ──────────────────────────────────────────────────────────────
static const List<ItemModel> items = [
ItemModel(
image: '1.png',
name: 'Iced Caramel Macchiato',
description: 'Espresso layered with milk and golden caramel drizzle',
price: '25',
category: DrinkCategory.iced,
),
ItemModel(
image: '2.png',
name: 'Vanilla Cold Brew',
description: 'Smooth cold brew infused with sweet vanilla syrup',
price: '35',
category: DrinkCategory.iced,
),
ItemModel(
image: '3.png',
name: 'Mocha Frappé',
description: 'Rich chocolate blended with icy espresso and cream',
price: '22',
category: DrinkCategory.iced,
),
ItemModel(
image: '4.png',
name: 'Cookies & Cream Shake',
description: 'Creamy milkshake loaded with crunchy cookie bites',
price: '40',
category: DrinkCategory.smoothie,
),
ItemModel(
image: '5.png',
name: 'Hazelnut Iced Latte',
description: 'Velvety iced latte with a rich hazelnut twist',
price: '15',
category: DrinkCategory.iced,
),
ItemModel(
image: '6.png',
name: 'Strawberry Mojito',
description: 'Fresh strawberries muddled with mint and lime',
price: '17',
category: DrinkCategory.mojito,
),
ItemModel(
image: '9.png',
name: 'Passion Fruit Iced Tea',
description: 'Tropical iced tea bursting with fruity passion',
price: '18',
category: DrinkCategory.tea,
),
ItemModel(
image: '7.png',
name: 'Blueberry Lemonade',
description: 'Zesty lemonade blended with fresh blueberries',
price: '29',
category: DrinkCategory.iced,
),
ItemModel(
image: '8.png',
name: 'Mango Smoothie',
description: 'Creamy sun-ripened mango blended to perfection',
price: '36',
category: DrinkCategory.smoothie,
),

];
}//.....................................................
import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
const AnimatedListItem({super.key, required this.index, required this.child});

final int index;
final Widget child;

@override
State<AnimatedListItem> createState() => \_AnimatedListItemState();
}

class \_AnimatedListItemState extends State<AnimatedListItem>
with SingleTickerProviderStateMixin {
late final AnimationController \_ctrl;
late final Animation<double> \_opacity;
late final Animation<Offset> \_slide;

static const int \_staggerMs = 55;
static const int \_maxStaggerMs = 400;
static const int \_durationMs = 380;

@override
void initState() {
super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _durationMs),
    );

    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    final delay = Duration(
      milliseconds: (widget.index * _staggerMs).clamp(0, _maxStaggerMs),
    );

    Future.delayed(delay, () {
      if (mounted) _ctrl.forward();
    });

}

@override
void dispose() {
\_ctrl.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return FadeTransition(
opacity: \_opacity,
child: SlideTransition(position: \_slide, child: widget.child),
);
}
}
//..........................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';

typedef OnFilterChanged = void Function(String value);

class CategoryTabs extends StatefulWidget {
const CategoryTabs({super.key, required this.onCategoryChanged});
final OnFilterChanged onCategoryChanged;

@override
State<CategoryTabs> createState() => \_CategoryTabsState();
}

class \_CategoryTabsState extends State<CategoryTabs> {
int selectedIndex = 0;

static const \_tabs = ['All', 'Hot', 'Iced'];

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
child: Row(
children: List.generate(\_tabs.length, (i) {
final isSelected = selectedIndex == i;

          return Padding(
            padding: EdgeInsets.only(right: i != _tabs.length - 1 ? 12 : 0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() {
                  selectedIndex = i;
                });
                widget.onCategoryChanged(_tabs[i]);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:isSelected
                        ? Colors.black.withOpacity(0.025)
                        : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? Colors.black.withOpacity(0.06)
                        : Colors.white.withOpacity(0.1),
                  ),

                ),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 220),
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isSelected
                        ? AppColors.ink
                        : AppColors.ink2,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w500,
                  ),
                  child: CustomText(text: _tabs[i]),
                ),
              ),
            ),
          );
        }),
      ),
    );

}
}
//...................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Cart/Presentation/Views/cart_view.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
const HomeAppBar({super.key});

static String get greeting {
final hour = DateTime.now().hour;
if (hour < 12) return 'Good morning ☀️';
if (hour < 17) return 'Good afternoon 🌤️';
return 'Good evening 🌙';
}

@override
Widget build(BuildContext context) {
final cartCount = context.watch<CartProvider>().itemCount;
return Padding(
padding: const EdgeInsets.fromLTRB(
AppSpacing.pagePadding,
AppSpacing.lg,
AppSpacing.pagePadding,
0,
),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CustomText(text: greeting, style: AppTextStyles.bodyMedium),

                const SizedBox(height: AppSpacing.xs),
                CustomText(text: ' Menu', style: AppTextStyles.displayMedium),
              ],
            ),
          ),
          _cartButton(cartCount: cartCount, context: context),
        ],
      ),
    );

}

Widget _cartButton({required int cartCount, required BuildContext context}) {
final cartProvider = context.watch<CartProvider>();
return GestureDetector(
onTap: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(value: cartProvider,child: CartView())),
),
child: Stack(
clipBehavior: Clip.none,
children: [
Image.asset("assets/other/cart.png", width: 30),
if (cartCount > 0)
Positioned(
top: -4,
right: -4,
child: Container(
constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
padding: const EdgeInsets.all(3),
decoration: const BoxDecoration(
color: AppColors.primary,
shape: BoxShape.circle,
),
child: CustomText(
text: '$cartCount',
style: const TextStyle(
color: AppColors.surface,
fontSize: 10,
fontWeight: FontWeight.w800,
height: 1,
),
align: TextAlign.center,
),
),
),
],
),
);
}
}
//......................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

typedef OnFilterChanged = void Function(String value);

class HomeSearchBar extends StatefulWidget {
const HomeSearchBar({super.key, required this.onQueryChanged});
final OnFilterChanged onQueryChanged;

@override
State<HomeSearchBar> createState() => \_HomeSearchBarState();
}

class \_HomeSearchBarState extends State<HomeSearchBar> {
late TextEditingController \_searchController;

@override
void initState() {
super.initState();
\_searchController = TextEditingController();
}

@override
void dispose() {
\_searchController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
child: Container(
height: 48,
decoration: BoxDecoration(
color: AppColors.surfaceAlt,
borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
),
child: TextField(
textInputAction: TextInputAction.search,
onChanged: (value) => widget.onQueryChanged(value),
controller: \_searchController,

          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          decoration: InputDecoration(
            hintText: 'Search drinks...',
            hintStyle: AppTextStyles.bodyMedium,
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.ink2,
              size: 20,
            ),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (_, value, _) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.ink2,
                    size: 18,
                  ),
                  onPressed: () {
                  _searchController.text = '';
                    _searchController.selection = TextSelection.collapsed(
                      offset: 0,
                    );
                    widget.onQueryChanged('');
                  },
                );
              },
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );

}
}
//..........................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_shadows.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
const ItemCard({super.key, required this.item});
final ItemModel item;
void \_openDetails(BuildContext context) {
final cartProvider = context.read<CartProvider>();
final index = ItemModel.items.indexOf(item);
final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    FocusManager.instance.primaryFocus?.unfocus();

    Future.delayed(Duration(milliseconds: isKeyboardOpen ? 50 : 0), () {
      if (!context.mounted) return;
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, animation, _) => ChangeNotifierProvider.value(
            value: cartProvider,
            child: ItemDetailsView(initialIndex: index),
          ),
          transitionsBuilder: (_, animation, _, child) {
            final slide =
                Tween<Offset>(
                  begin: const Offset(0, 0.06),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );

            final fade = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );

            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
          transitionDuration: const Duration(milliseconds: 450),
          reverseTransitionDuration: const Duration(milliseconds: 350),
        ),
      );
    });

}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.pagePadding,
vertical: AppSpacing.md,
),
child: GestureDetector(
onTap: () => \_openDetails(context),
child: Container(
height: 135,
decoration: BoxDecoration(
color: AppColors.surface,
borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
boxShadow: AppShadows.card,
),
child: Stack(
clipBehavior: Clip.none,
children: [
_cardContent(item: item),
_drinkImage(imageName: item.image),
],
),
),
),
);
}
// ─── Card Content ──────────────────────────────────────────────────────────────
Widget \_cardContent({required ItemModel item}) {
return Padding(
// Left padding reserves space for the overflowing drink image
padding: const EdgeInsets.only(
left: 128,
right: AppSpacing.md,
top: AppSpacing.md,
bottom: AppSpacing.md,
),
child: Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
children: [
CustomText(
text: item.name,
maxLines: 1,

                  style: AppTextStyles.titleMedium,
                ),

                const SizedBox(height: AppSpacing.xs),
                CustomText(
                  text: item.description,
                  maxLines: 1,

                  style: AppTextStyles.bodySmall,
                ),

                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    _priceChip(price: item.price),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                      color: AppColors.ink2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
    );

}

// ─── Price Chip ────────────────────────────────────────────────────────────────
Widget \_priceChip({required String price}) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.sm + 2,
vertical: AppSpacing.xs - 1,
),
decoration: BoxDecoration(
color: AppColors.primaryLight,
borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
),
child: CustomText(text: '€ $price', style: AppTextStyles.price),
);
}

// ─── Drink Image ───────────────────────────────────────────────────────────────
Widget \_drinkImage({required String imageName}) {
return Positioned(
left: 0,
top: -30,

      width: 75,
      child: Hero(
        tag: 'drink_$imageName',
        child: Image.asset('assets/img/$imageName', fit: BoxFit.contain),
      ),
    );

}

}

//........................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/Home/Presentation/helper/animated_list_item.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/item_card.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
const ItemList({
super.key,
required this.items,
required this.query,
required this.tabLabel,
});

final List<ItemModel> items;
final String query;
final String tabLabel;

@override
Widget build(BuildContext context) {
if (items.isEmpty) {
return \_emptyState(query: query, tabLabel: tabLabel);
}

    return ClipRect(
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: AppSpacing.sm,
          bottom: AppSpacing.xl,
        ),
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedListItem(
            index: index,
            child: ItemCard(item: items[index]),
          );
        },
      ),
    );

}
///\*empty state widget
Widget \_emptyState({required String query, required String tabLabel}) {
final isSearch = query.isNotEmpty;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSearch ? Icons.search_off_rounded : Icons.local_cafe_outlined,
            size: 64,
            color: AppColors.inkDisabled,
          ),
          const SizedBox(height: AppSpacing.md),
          CustomText(
            text: isSearch
                ? 'No results for "$query"'
                : 'No $tabLabel drinks yet',
            style: AppTextStyles.titleMedium.copyWith(color: AppColors.ink2),
          ),
          const SizedBox(height: AppSpacing.xs),
          CustomText(
            text: isSearch ? 'Try a different keyword' : 'Check back soon!',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );

}
}

// ─── Empty State ───────────────────────────────────────────────────────────────

//..........................................................................
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/category_taps.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/home_app_bar.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/home_search_bar.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/menu_items_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
const HomeViewBody({super.key});

@override
State<HomeViewBody> createState() => \_HomeViewBodyState();
}

class \_HomeViewBodyState extends State<HomeViewBody> {
String \_query = '';
String \_selectedTab = '';
List<ItemModel> get items {
List<ItemModel> items = ItemModel.items;
if (\_selectedTab == "Hot") {
items = items.where((i) => i.isHot == true).toList();
} else if (\_selectedTab == "Iced") {
items = items.where((i) => i.isHot == false).toList();
}
if (\_query.isNotEmpty) {
items = items
.where(
(i) =>
i.name.toLowerCase().contains(\_query.toLowerCase()) ||
i.description.toLowerCase().contains(\_query.toLowerCase()),
)
.toList();
}
return items;
}

@override
Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
//appbar
SafeArea(child: HomeAppBar()),
const SizedBox(height: AppSpacing.md),
//search bar
HomeSearchBar(
onQueryChanged: (query) => setState(() {
_query = query;
}),
),
const SizedBox(height: AppSpacing.md),
//Tabs Filter
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
);
}
}
//...............................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Home/Presentation/views/home_view_body.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// Entry point for the Home feature.
/// Keeps routing and scaffold concerns separate from the body.
class HomeView extends StatelessWidget {
const HomeView({super.key});

static const routeName = '/home';

@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
child: AnnotatedRegion<SystemUiOverlayStyle>(
value: SystemUiOverlayStyle.dark,
child: Scaffold(
backgroundColor: AppColors.background,
body: ChangeNotifierProvider(create: (context) {
return CartProvider();
},child: HomeViewBody()),
),
),
);
}
}
//..............................................................................
import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
const AnimatedListItem({super.key, required this.index, required this.child});

final int index;
final Widget child;

@override
State<AnimatedListItem> createState() => \_AnimatedListItemState();
}

class \_AnimatedListItemState extends State<AnimatedListItem>
with SingleTickerProviderStateMixin {
late final AnimationController \_ctrl;
late final Animation<double> \_opacity;
late final Animation<Offset> \_slide;

static const int \_staggerMs = 55;
static const int \_maxStaggerMs = 400;
static const int \_durationMs = 380;

@override
void initState() {
super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _durationMs),
    );

    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    final delay = Duration(
      milliseconds: (widget.index * _staggerMs).clamp(0, _maxStaggerMs),
    );

    Future.delayed(delay, () {
      if (mounted) _ctrl.forward();
    });

}

@override
void dispose() {
\_ctrl.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return FadeTransition(
opacity: \_opacity,
child: SlideTransition(position: \_slide, child: widget.child),
);
}
}
//..................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';

typedef OnFilterChanged = void Function(String value);

class CategoryTabs extends StatefulWidget {
const CategoryTabs({super.key, required this.onCategoryChanged});
final OnFilterChanged onCategoryChanged;

@override
State<CategoryTabs> createState() => \_CategoryTabsState();
}

class \_CategoryTabsState extends State<CategoryTabs> {
int selectedIndex = 0;

static const \_tabs = ['All', 'Hot', 'Iced'];

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
child: Row(
children: List.generate(\_tabs.length, (i) {
final isSelected = selectedIndex == i;

          return Padding(
            padding: EdgeInsets.only(right: i != _tabs.length - 1 ? 12 : 0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() {
                  selectedIndex = i;
                });
                widget.onCategoryChanged(_tabs[i]);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:isSelected
                        ? Colors.black.withOpacity(0.025)
                        : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? Colors.black.withOpacity(0.06)
                        : Colors.white.withOpacity(0.1),
                  ),

                ),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 220),
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isSelected
                        ? AppColors.ink
                        : AppColors.ink2,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w500,
                  ),
                  child: CustomText(text: _tabs[i]),
                ),
              ),
            ),
          );
        }),
      ),
    );

}
}
//........................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Cart/Presentation/Views/cart_view.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
const HomeAppBar({super.key});

static String get greeting {
final hour = DateTime.now().hour;
if (hour < 12) return 'Good morning ☀️';
if (hour < 17) return 'Good afternoon 🌤️';
return 'Good evening 🌙';
}

@override
Widget build(BuildContext context) {
final cartCount = context.watch<CartProvider>().itemCount;
return Padding(
padding: const EdgeInsets.fromLTRB(
AppSpacing.pagePadding,
AppSpacing.lg,
AppSpacing.pagePadding,
0,
),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CustomText(text: greeting, style: AppTextStyles.bodyMedium),

                const SizedBox(height: AppSpacing.xs),
                CustomText(text: ' Menu', style: AppTextStyles.displayMedium),
              ],
            ),
          ),
          _cartButton(cartCount: cartCount, context: context),
        ],
      ),
    );

}

Widget _cartButton({required int cartCount, required BuildContext context}) {
final cartProvider = context.watch<CartProvider>();
return GestureDetector(
onTap: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(value: cartProvider,child: CartView())),
),
child: Stack(
clipBehavior: Clip.none,
children: [
Image.asset("assets/other/cart.png", width: 30),
if (cartCount > 0)
Positioned(
top: -4,
right: -4,
child: Container(
constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
padding: const EdgeInsets.all(3),
decoration: const BoxDecoration(
color: AppColors.primary,
shape: BoxShape.circle,
),
child: CustomText(
text: '$cartCount',
style: const TextStyle(
color: AppColors.surface,
fontSize: 10,
fontWeight: FontWeight.w800,
height: 1,
),
align: TextAlign.center,
),
),
),
],
),
);
}
}
//.................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

typedef OnFilterChanged = void Function(String value);

class HomeSearchBar extends StatefulWidget {
const HomeSearchBar({super.key, required this.onQueryChanged});
final OnFilterChanged onQueryChanged;

@override
State<HomeSearchBar> createState() => \_HomeSearchBarState();
}

class \_HomeSearchBarState extends State<HomeSearchBar> {
late TextEditingController \_searchController;

@override
void initState() {
super.initState();
\_searchController = TextEditingController();
}

@override
void dispose() {
\_searchController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
child: Container(
height: 48,
decoration: BoxDecoration(
color: AppColors.surfaceAlt,
borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
),
child: TextField(
textInputAction: TextInputAction.search,
onChanged: (value) => widget.onQueryChanged(value),
controller: \_searchController,

          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          decoration: InputDecoration(
            hintText: 'Search drinks...',
            hintStyle: AppTextStyles.bodyMedium,
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.ink2,
              size: 20,
            ),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (_, value, _) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.ink2,
                    size: 18,
                  ),
                  onPressed: () {
                  _searchController.text = '';
                    _searchController.selection = TextSelection.collapsed(
                      offset: 0,
                    );
                    widget.onQueryChanged('');
                  },
                );
              },
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );

}
}
//..........................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_shadows.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
const ItemCard({super.key, required this.item});
final ItemModel item;
void \_openDetails(BuildContext context) {
final cartProvider = context.read<CartProvider>();
final index = ItemModel.items.indexOf(item);
final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    FocusManager.instance.primaryFocus?.unfocus();

    Future.delayed(Duration(milliseconds: isKeyboardOpen ? 50 : 0), () {
      if (!context.mounted) return;
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, animation, _) => ChangeNotifierProvider.value(
            value: cartProvider,
            child: ItemDetailsView(initialIndex: index),
          ),
          transitionsBuilder: (_, animation, _, child) {
            final slide =
                Tween<Offset>(
                  begin: const Offset(0, 0.06),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );

            final fade = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );

            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
          transitionDuration: const Duration(milliseconds: 450),
          reverseTransitionDuration: const Duration(milliseconds: 350),
        ),
      );
    });

}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.pagePadding,
vertical: AppSpacing.md,
),
child: GestureDetector(
onTap: () => \_openDetails(context),
child: Container(
height: 135,
decoration: BoxDecoration(
color: AppColors.surface,
borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
boxShadow: AppShadows.card,
),
child: Stack(
clipBehavior: Clip.none,
children: [
_cardContent(item: item),
_drinkImage(imageName: item.image),
],
),
),
),
);
}
// ─── Card Content ──────────────────────────────────────────────────────────────
Widget \_cardContent({required ItemModel item}) {
return Padding(
// Left padding reserves space for the overflowing drink image
padding: const EdgeInsets.only(
left: 128,
right: AppSpacing.md,
top: AppSpacing.md,
bottom: AppSpacing.md,
),
child: Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
children: [
CustomText(
text: item.name,
maxLines: 1,

                  style: AppTextStyles.titleMedium,
                ),

                const SizedBox(height: AppSpacing.xs),
                CustomText(
                  text: item.description,
                  maxLines: 1,

                  style: AppTextStyles.bodySmall,
                ),

                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    _priceChip(price: item.price),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                      color: AppColors.ink2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
    );

}

// ─── Price Chip ────────────────────────────────────────────────────────────────
Widget \_priceChip({required String price}) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.sm + 2,
vertical: AppSpacing.xs - 1,
),
decoration: BoxDecoration(
color: AppColors.primaryLight,
borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
),
child: CustomText(text: '€ $price', style: AppTextStyles.price),
);
}

// ─── Drink Image ───────────────────────────────────────────────────────────────
Widget \_drinkImage({required String imageName}) {
return Positioned(
left: 0,
top: -30,

      width: 75,
      child: Hero(
        tag: 'drink_$imageName',
        child: Image.asset('assets/img/$imageName', fit: BoxFit.contain),
      ),
    );

}

}

//...............................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/Home/Presentation/helper/animated_list_item.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/item_card.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
const ItemList({
super.key,
required this.items,
required this.query,
required this.tabLabel,
});

final List<ItemModel> items;
final String query;
final String tabLabel;

@override
Widget build(BuildContext context) {
if (items.isEmpty) {
return \_emptyState(query: query, tabLabel: tabLabel);
}

    return ClipRect(
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: AppSpacing.sm,
          bottom: AppSpacing.xl,
        ),
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedListItem(
            index: index,
            child: ItemCard(item: items[index]),
          );
        },
      ),
    );

}
///\*empty state widget
Widget \_emptyState({required String query, required String tabLabel}) {
final isSearch = query.isNotEmpty;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSearch ? Icons.search_off_rounded : Icons.local_cafe_outlined,
            size: 64,
            color: AppColors.inkDisabled,
          ),
          const SizedBox(height: AppSpacing.md),
          CustomText(
            text: isSearch
                ? 'No results for "$query"'
                : 'No $tabLabel drinks yet',
            style: AppTextStyles.titleMedium.copyWith(color: AppColors.ink2),
          ),
          const SizedBox(height: AppSpacing.xs),
          CustomText(
            text: isSearch ? 'Try a different keyword' : 'Check back soon!',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );

}
}

// ─── Empty State ───────────────────────────────────────────────────────────────

//...............................................................
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/category_taps.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/home_app_bar.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/home_search_bar.dart';
import 'package:cafe_app/features/Home/Presentation/views/widgets/menu_items_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
const HomeViewBody({super.key});

@override
State<HomeViewBody> createState() => \_HomeViewBodyState();
}

class \_HomeViewBodyState extends State<HomeViewBody> {
String \_query = '';
String \_selectedTab = '';
List<ItemModel> get items {
List<ItemModel> items = ItemModel.items;
if (\_selectedTab == "Hot") {
items = items.where((i) => i.isHot == true).toList();
} else if (\_selectedTab == "Iced") {
items = items.where((i) => i.isHot == false).toList();
}
if (\_query.isNotEmpty) {
items = items
.where(
(i) =>
i.name.toLowerCase().contains(\_query.toLowerCase()) ||
i.description.toLowerCase().contains(\_query.toLowerCase()),
)
.toList();
}
return items;
}

@override
Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
//appbar
SafeArea(child: HomeAppBar()),
const SizedBox(height: AppSpacing.md),
//search bar
HomeSearchBar(
onQueryChanged: (query) => setState(() {
_query = query;
}),
),
const SizedBox(height: AppSpacing.md),
//Tabs Filter
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
);
}
}
//................................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Home/Presentation/views/home_view_body.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// Entry point for the Home feature.
/// Keeps routing and scaffold concerns separate from the body.
class HomeView extends StatelessWidget {
const HomeView({super.key});

static const routeName = '/home';

@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
child: AnnotatedRegion<SystemUiOverlayStyle>(
value: SystemUiOverlayStyle.dark,
child: Scaffold(
backgroundColor: AppColors.background,
body: ChangeNotifierProvider(create: (context) {
return CartProvider();
},child: HomeViewBody()),
),
),
);
}
}
//..............................................
import 'dart:ui';
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/custom_button.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

class CheckoutSheet extends StatelessWidget {
const CheckoutSheet({super.key});

@override
Widget build(BuildContext context) {
return DraggableScrollableSheet(
initialChildSize: 0.4,
maxChildSize: 0.6,
minChildSize: 0.3,
builder: (context, scrollController) {
return ClipRRect(
borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
child: BackdropFilter(
filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
child: Container(
width: double.infinity,
decoration: BoxDecoration(
color: Colors.black.withOpacity(0.05),
borderRadius: const BorderRadius.vertical(
top: Radius.circular(25),
),
),
padding: const EdgeInsets.symmetric(horizontal: 24),
child: ListView(
controller: scrollController,
children: [
const SizedBox(height: 10),
const Center(
child: Icon(
Icons.drag_handle,
color: Colors.black,
size: 30,
),
),
const SizedBox(height: AppSpacing.lg),
const CustomText(
text: 'Confirm your order',
align: TextAlign.center,
style: TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.w500,
),
),

                  const SizedBox(height: AppSpacing.md),
                  const CustomText(
                    text:
                        'You are about to checkout your items. Please confirm to proceed with the payment.',
                    maxLines: 3,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  // Confirm button
                  CustomButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Place order logic
                    },
                    color: AppColors.primary,
                    radius: 12,
                    child: const Center(
                      child: CustomText(
                        text: 'Confirm Checkout',
                        style: TextStyle(
                          color: AppColors.surface,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  // Cancel button
                  CustomButton(
                    onPressed: () => Navigator.of(context).pop(),
                    color: AppColors.error.withOpacity(0.5),
                    radius: 12,
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

}
}
//.....................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchases extends StatelessWidget {
const Purchases({super.key});

@override
Widget build(BuildContext context) {
final cart = context.watch<CartProvider>();

    if (cart.drinks.isEmpty) return const _EmptyCartView();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: cart.drinks.length,
      itemBuilder: (context, index) {
        return _OrderCard(drink: cart.drinks[index], cart: cart);
      },
    );

}
}

// ─── Empty State ──────────────────────────────────────────────────────────────

class \_EmptyCartView extends StatelessWidget {
const \_EmptyCartView();

@override
Widget build(BuildContext context) {
return Center(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Icon(Icons.shopping_cart_outlined, size: 72, color: AppColors.ink2),
const SizedBox(height: 16),
Text(
'Your cart is empty',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.w600,
color: AppColors.ink2,
),
),
const SizedBox(height: 8),
Text(
'Add some drinks to get started!',
style: TextStyle(fontSize: 14, color: AppColors.ink2),
),
],
),
);
}
}

// ─── Order Card ───────────────────────────────────────────────────────────────

class \_OrderCard extends StatelessWidget {
const \_OrderCard({required this.drink, required this.cart});
final DrinkEntry drink;
final CartProvider cart;

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
child: Container(
decoration: BoxDecoration(
color: AppColors.surface,
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: AppColors.shadowMedium,
blurRadius: 10,
offset: const Offset(0, 4),
),
],
),
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
child: Row(
children: [
_drinkThumbnail(drink: drink),
const SizedBox(width: 12),
Expanded(child: _drinkInfo(drink: drink)),
_controll(drink: drink, cart: cart),
],
),
),
),
);
}

///widgets
//DrinkThumbnail Widget
Widget \_drinkThumbnail({required DrinkEntry drink}) {
return Stack(
clipBehavior: Clip.none,
children: [
Container(
width: 60,
height: 60,
decoration: BoxDecoration(
color: const Color(0xFFF7F7F7),
borderRadius: BorderRadius.circular(12),
),
child: Padding(
padding: const EdgeInsets.all(6),
child: Image.asset(
'assets/img/${drink.drink.image}',
fit: BoxFit.contain,
),
),
),
if (drink.quantity > 1)
Positioned(
top: -6,
right: -6,
child: Container(
constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
padding: const EdgeInsets.all(3),
decoration: const BoxDecoration(
color: AppColors.primary,
shape: BoxShape.circle,
),
child: CustomText(
text: '${drink.quantity}',
align: TextAlign.center,
style: AppTextStyles.labelSmall.copyWith(
color: AppColors.surface,
fontSize: 10,
fontWeight: FontWeight.w800,
),
),
),
),
],
);
}

//order info widget
Widget \_drinkInfo({required DrinkEntry drink}) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CustomText(
text: drink.drink.name,
maxLines: 1,
style: const TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
color: Color(0xFF1A1A2E),
),
),
const SizedBox(height: 4),
Row(
children: [
_tag(
label: drink.drink.isHot ? 'Hot' : 'Cold',
color: !drink.drink.isHot
? const Color(0xFF2196F3)
: const Color(0xFFFF7043),
),
const SizedBox(width: 6),
_tag(label: drink.size, color: AppColors.primary),
],
),
],
);
}

//custom widget for \_drinkInfo widget

Widget \_tag({required String label, required Color color}) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
decoration: BoxDecoration(
color: color.withOpacity(0.10),
borderRadius: BorderRadius.circular(20),
),
child: Text(
label,
style: TextStyle(
fontSize: 11,
fontWeight: FontWeight.w600,
color: color,
),
),
);
}

// amount controll
Widget \_controll({required DrinkEntry drink, required CartProvider cart}) {
final unitPrice = double.tryParse(drink.drink.price) ?? 0.0;
final total = (unitPrice \* drink.quantity).toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Remove entirely
        GestureDetector(
          onTap: () => cart.removeDrink(drink.key),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.close_rounded,
              color: AppColors.error,
              size: 14,
            ),
          ),
        ),
        const SizedBox(height: 6),

        // Total price for this entry
        CustomText(
          text: '€ $total',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 6),

        // +/− stepper
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _minBtn(
                icon: drink.quantity == 1
                    ? Icons.delete_outline_rounded
                    : Icons.remove_rounded,
                color: drink.quantity == 1 ? AppColors.error : AppColors.ink2,
                onTap: () => cart.decreaseQty(drink.key),
              ),
              SizedBox(
                width: 28,
                child: CustomText(
                  text: '${drink.quantity}',
                  align: TextAlign.center,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ),
              _minBtn(
                icon: Icons.add_rounded,
                color: AppColors.primary,
                onTap: () => cart.increaseQty(drink.key),
              ),
            ],
          ),
        ),
      ],
    );

}

// custom quantity btn for \_controll widget

Widget \_minBtn({
required IconData icon,
required Color color,
required VoidCallback onTap,
}) {
return GestureDetector(
onTap: onTap,
child: SizedBox(
width: 28,
height: 28,
child: Icon(icon, color: color, size: 16),
),
);
}
}
//.............................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/custom_button.dart';
import 'package:cafe_app/features/Cart/Presentation/Views/Widgets/checkout_sheet.dart';
import 'package:cafe_app/features/Cart/Presentation/Views/Widgets/purchases.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CartViewBody extends StatelessWidget {
const CartViewBody({super.key});

@override
Widget build(BuildContext context) {
final cart = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Column(
        children: [
          _buildHeader(context, cart.itemCount),
          const Expanded(child: Purchases()),
          if (cart.drinks.isNotEmpty) _buildCheckoutBar(context, cart),
        ],
      ),
    );

}
///?widgets
//setup cart header widget
Widget \_buildHeader(BuildContext context, int itemCount) {
return Padding(
padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
IconButton(
icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
onPressed: () => Navigator.pop(context),
style: IconButton.styleFrom(
backgroundColor: AppColors.surface,
foregroundColor: AppColors.ink2,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
elevation: 2,
shadowColor: AppColors.shadowMedium,
),
),
const Text(
'My Cart',
style: TextStyle(
color: AppColors.ink,
fontSize: 22,
fontWeight: FontWeight.w700,
letterSpacing: 0.3,
),
),
Container(
padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
decoration: BoxDecoration(
color: AppColors.primary.withOpacity(0.12),
borderRadius: BorderRadius.circular(20),
),
child: Text(
'$itemCount ${itemCount == 1 ? 'item' : 'items'}',
style: const TextStyle(
fontSize: 13,
fontWeight: FontWeight.w600,
color: AppColors.primary,
),
),
),
],
),
);
}
//setup cart checkoutbar
Widget \_buildCheckoutBar(BuildContext context, CartProvider cart) {
final total = cart.totalPrice.toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.ink1.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.ink2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '€ $total',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: CustomButton(
              onPressed: () {
                HapticFeedback.mediumImpact();

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,

                  builder: (_) => CheckoutSheet(),
                );
              },
              color: AppColors.ink1,
              radius: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Checkout',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

}
}

//......................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Cart/Presentation/Views/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
const CartView({super.key});

@override
Widget build(BuildContext context) {
return const Scaffold(backgroundColor: AppColors.background,body: CartViewBody());
}
}//........................................................................
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:flutter/widgets.dart';

class DrinkEntry {
DrinkEntry({required this.drink, required this.size, this.quantity = 1});

final ItemModel drink;

final String size;
int quantity;

static String keyFor(ItemModel product, String size) =>
'${product.image}_$size';

String get key => keyFor(drink, size);
}

// ─── Cart Provider ────────────────────────────────────────────────────────────

class CartProvider extends ChangeNotifier {
final Map<String, DrinkEntry> \_drinks = {};

List<DrinkEntry> get drinks => \_drinks.values.toList();

int get itemCount => \_drinks.values.fold(0, (sum, e) => sum + e.quantity);
// check if drink in cart
bool isDrinkInCart(ItemModel product, String size) =>
\_drinks.containsKey(DrinkEntry.keyFor(product, size));
// get drink from cart
DrinkEntry? getDrink(ItemModel product, String size) =>
\_drinks[DrinkEntry.keyFor(product, size)];
// add drink to cart
void addItem({
required ItemModel drink,
required int quantity,

    required String size,

}) {
final key = DrinkEntry.keyFor(drink, size);
if (\_drinks.containsKey(key)) {
\_drinks[key]!.quantity += quantity;
} else {
\_drinks[key] = DrinkEntry(
drink: drink,

        size: size,
        quantity: quantity,
      );
    }
    notifyListeners();

}

//increase drink quantity
void increaseQty(String key) {
if (!\_drinks.containsKey(key)) return;
\_drinks[key]!.quantity++;
notifyListeners();
}

//decrease drink quantity
void decreaseQty(String key) {
if (!\_drinks.containsKey(key)) return;
if (\_drinks[key]!.quantity <= 1) {
\_drinks.remove(key);
} else {
\_drinks[key]!.quantity--;
}
notifyListeners();
}

//remove drink from cart
void removeDrink(String key) {
\_drinks.remove(key);
notifyListeners();
}

//calculate total price
double get totalPrice {
return \_drinks.values.fold(0.0, (sum, entry) {
final price = double.tryParse(entry.drink.price) ?? 0.0;
return sum + price \* entry.quantity;
});
}

//clear cart
void clearCart() {
\_drinks.clear();
notifyListeners();
}
}
//................................................................
import 'package:flutter/material.dart';

class SizeAndQtyProvider extends ChangeNotifier {
final Map<int, \_DrinkState> \_drinkStates = {};

\_DrinkState \_getState(int index) =>
\_drinkStates.putIfAbsent(index, () => \_DrinkState());

int getQuantity(int index) => \_getState(index).quantity;
int getSizeIndex(int index) => \_getState(index).sizeIndex;

void setSizeIndex({required int index, required int sizeIndex}) {
\_getState(index).sizeIndex = sizeIndex;
notifyListeners();
}

void increaseQty(int index) {
\_getState(index).quantity++;
notifyListeners();
}

void decreaseQty(int index) {
final state = \_getState(index);
if (state.quantity > 1) state.quantity--;
notifyListeners();
}
}

class \_DrinkState {
int sizeIndex = 0;
int quantity = 1;
}
//.........................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartBtn extends StatefulWidget {
const AddToCartBtn({
super.key,
required this.items,
required this.curruntIndex,
});

final List<ItemModel> items;
final int curruntIndex;

@override
State<AddToCartBtn> createState() => \_AddToCartBtnState();
}

class \_AddToCartBtnState extends State<AddToCartBtn> {
static const List<String> \_sizeLabels = ['small', 'medium', 'large'];

ItemModel get \_item => widget.items[widget.curruntIndex];

String \_sizeLabel(int sizeIndex) => \_sizeLabels[sizeIndex];

@override
Widget build(BuildContext context) {
final sizeIndex = context.select<SizeAndQtyProvider, int>(
(p) => p.getSizeIndex(widget.curruntIndex),
);
final cart = context.watch<CartProvider>();
final size = \_sizeLabel(sizeIndex);
final isDrinkInCart = cart.isDrinkInCart(\_item, size);
final drink = cart.getDrink(\_item, size);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.4),
            end: Offset.zero,
          ).animate(anim),
          child: child,
        ),
      ),
      child: isDrinkInCart
          // ── Already in cart
          ? _CartQtyStepper(
              key: const ValueKey('stepper'),
              drink: drink!,
              cart: cart,
            )
          // ── Not in cart
          : _AddButton(
              key: const ValueKey('add_btn'),
              cart: cart,
              item: _item,
              size: size,


            ),
    );

}
}

// ─── Add Button ───────────────────────────────────────────────────────────────

class \_AddButton extends StatelessWidget {
const \_AddButton({super.key, required this.cart, required this.item, required this.size});
final CartProvider cart;
final ItemModel item;
final String size;
static bool \_isPressed = false;
void \_addToCart() {
if (\_isPressed) return;
cart.addItem(drink: item, quantity: 1, size: size);
\_isPressed = true;
Future.delayed(const Duration(milliseconds: 400), () {
\_isPressed = false;
});
}

@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: \_addToCart,
child: Container(
padding: const EdgeInsets.symmetric(vertical: 14),
width: double.infinity,
decoration: BoxDecoration(
color: AppColors.ink1,
borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(
Icons.shopping_bag_outlined,
color: AppColors.surface,
size: 18,
),
const SizedBox(width: AppSpacing.md),
CustomText(text: 'Add to Cart', style: AppTextStyles.labelLarge),
],
),
),
);
}
}

class \_CartQtyStepper extends StatelessWidget {
const \_CartQtyStepper({super.key, required this.drink, required this.cart});

final DrinkEntry drink;
final CartProvider cart;

@override
Widget build(BuildContext context) {
return Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(vertical: 6),
decoration: BoxDecoration(
color: AppColors.surfaceAlt,
borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
border: Border.all(color: AppColors.ink1.withOpacity(0.1)),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
// ── Decrease / remove ──────────────────────────────────────────
\_stepBtn(
icon: drink.quantity == 1
? Icons.delete_outline_rounded
: Icons.remove_rounded,
color: drink.quantity == 1
? AppColors.error
: AppColors.primary,
onTap: () => cart.decreaseQty(drink.key),
),

          // ── Qty label ──────────────────────────────────────────────────
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: '${drink.quantity}',
                style: AppTextStyles.titleMedium,
              ),
              CustomText(
                text: 'in cart',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          // ── Increase ───────────────────────────────────────────────────
          _stepBtn(
            icon: Icons.add_rounded,
            color: AppColors.primary,
            onTap: () => cart.increaseQty(drink.key),
          ),
        ],
      ),
    );

}

Widget \_stepBtn({
required IconData icon,
required Color color,
required VoidCallback onTap,
}) {
return GestureDetector(
onTap: onTap,
child: Container(
width: 44,
height: 44,
alignment: Alignment.center,
child: Icon(icon, color: color, size: 22),
),
);
}
}
//.........................................................................
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:flutter/material.dart';

class DrinkName extends StatelessWidget {
const DrinkName({super.key, required this.item});
final ItemModel item;

@override
Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
CustomText(text: item.name, style: AppTextStyles.titleLarge),
const SizedBox(height: AppSpacing.xs),
CustomText(
text: item.description,
maxLines: 1,
style: AppTextStyles.bodyMedium,
),
],
);
}
}
//......................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

class DrinkPrice extends StatelessWidget {
const DrinkPrice({super.key, required this.price});
final String price;

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.md,
vertical: AppSpacing.sm,
),
decoration: BoxDecoration(
color: AppColors.primaryLight,
borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
),
child: CustomText(
text: '€ $price',
style: AppTextStyles.price.copyWith(fontSize: 15),
),
);
}
}
//...........................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrinkQuantity extends StatelessWidget {
const DrinkQuantity({super.key, required this.curruntIndex});
final int curruntIndex;

@override
Widget build(BuildContext context) {
final provider = context.read<SizeAndQtyProvider>();
return Selector<SizeAndQtyProvider, int>(
selector: (_, provider) => provider.getQuantity(curruntIndex),
builder: (_, quantity, \_) {
return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
CustomText(text: 'Quantity', style: AppTextStyles.titleMedium),
Container(
padding: const EdgeInsets.all(AppSpacing.xs),
decoration: BoxDecoration(
color: AppColors.surfaceAlt,
borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
),
child: Row(
mainAxisSize: MainAxisSize.min,
children: [
//?decrease btn
qtyBtn(
icon: Icons.remove_rounded,
active: quantity > 1,
onTap: () => provider.decreaseQty(curruntIndex),
),
SizedBox(
width: 38,
child: CustomText(
text: '$quantity',
align: TextAlign.center,
style: AppTextStyles.titleMedium,
),
),
//?increase btn
qtyBtn(
icon: Icons.add_rounded,
onTap: () => provider.increaseQty(curruntIndex)
,
),
],
),
),
],
);
},
);
}

Widget qtyBtn({
required IconData icon,
required VoidCallback onTap,
bool active = true,
}) {
return GestureDetector(
onTap: active ? onTap : null,
child: AnimatedContainer(
duration: const Duration(milliseconds: 180),
width: 32,
height: 32,
decoration: BoxDecoration(
color: active ? AppColors.primary : AppColors.inkDisabled,
shape: BoxShape.circle,
),
child: Icon(icon, color: AppColors.surface, size: 16),
),
);
}
}
//.......................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DrinkSize extends StatelessWidget {
const DrinkSize({super.key, required this.curruntIndex});
final int curruntIndex;
static const opts = [
(label: 'S', h: 16.0),
(label: 'M', h: 20.0),
(label: 'L', h: 24.0),
];

@override
Widget build(BuildContext context) {
return Selector<SizeAndQtyProvider, int>(
selector: (_, provider) => provider.getSizeIndex(curruntIndex),
builder: (_, selectedIndex, \_) {
return Row(
children: [
CustomText(text: 'Size', style: AppTextStyles.titleMedium),
const SizedBox(width: AppSpacing.lg),
Expanded(
child: Row(
mainAxisAlignment: MainAxisAlignment.start,
children: List.generate(opts.length, (index) {
final opt = opts[index];
final bool sel = selectedIndex == index;
return GestureDetector(
onTap: () =>
context.read<SizeAndQtyProvider>().setSizeIndex(index: curruntIndex,sizeIndex: index),
child: AnimatedContainer(
duration: const Duration(milliseconds: 220),
curve: Curves.easeInOut,
margin: const EdgeInsets.only(right: AppSpacing.sm),
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.md,
vertical: AppSpacing.sm,
),
decoration: BoxDecoration(
color: sel ? AppColors.primary : AppColors.surfaceAlt,
borderRadius: BorderRadius.circular(
AppSpacing.radiusMd,
),
boxShadow: sel
? [
BoxShadow(
color: AppColors.primary.withOpacity(0.28),
blurRadius: 8,
offset: const Offset(0, 3),
),
]
: [],
),
child: Row(
mainAxisSize: MainAxisSize.min,
children: [
SvgPicture.asset(
'assets/other/vector.svg',
height: opt.h,
colorFilter: ColorFilter.mode(
sel ? AppColors.surface : AppColors.ink2,
BlendMode.srcIn,
),
),
const SizedBox(width: AppSpacing.xs),
CustomText(
text: opt.label,
style: AppTextStyles.labelMedium.copyWith(
color: sel
? AppColors.surface
: AppColors.ink2,
fontWeight: sel
? FontWeight.w700
: FontWeight.w500,
),
),
],
),
),
);
}),
),
),
],
);
},
);
}
}
//..............................................................................
import 'package:cafe_app/core/extensions/responsive.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
const Drink({
super.key,
required this.drinks,
required this.controller,
required this.curruntPage,
});
final List<ItemModel> drinks;
final PageController controller;
final double curruntPage;

@override
Widget build(BuildContext context) {
final double screenHight = context.screenHeight _ 0.48;
final double screenwidth = context.screenWidth _ 0.2;

    double drinkSize = screenwidth / (screenwidth - 15);
    return PageView.builder(
      controller: controller,
      itemCount: drinks.length,
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,

itemBuilder: (context, index) {
final scale = drinkSize - (curruntPage - index).abs() \* 1;

        final translateX = (curruntPage - index).abs() * (screenwidth * 0.75);

        return Transform.translate(
          offset: Offset(-translateX, 0),
          child: Transform.scale(
            scale: scale.clamp(0.5, 1.0),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      "assets/img/${drinks[index].image}",
                      height: screenHight,
                    ),
                    Positioned(
                      bottom: -screenHight * 0.04,
                      right: 0,
                      left: 0,
                      child: Image.asset("assets/img/shadow.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

}
}
//....................................................................
import 'dart:math' as math;

import 'package:cafe_app/core/extensions/responsive.dart';
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:flutter/material.dart';

class DrinksDots extends StatelessWidget {
const DrinksDots({super.key, required this.count, required this.current});
final int count;
final double current;

static const int \_visible = 5;
@override
Widget build(BuildContext context) {
final int cur = current.round();
final int half = \_visible ~/ 2;
final int start = (cur - half).clamp(0, math.max(0, count - \_visible));
final int end = (start + \_visible).clamp(0, count);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: context.screenHeight*0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = start; i < end; i++) ...[
            AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeInOut,
              width: i == cur ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == cur ? AppColors.ink2 : AppColors.inkDisabled,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
            if (i < end - 1) const SizedBox(width: 5),
          ],
        ],
      ),
    );

}
}
//........................................................................
import 'package:cafe_app/core/extensions/responsive.dart';
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/add_to_cart_btn.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/drink_name.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/drink_price.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/drink_size.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
const InfoPanel({super.key, required this.curruntIndex, required this.items});

final List<ItemModel> items;
final int curruntIndex;

@override
Widget build(BuildContext context) {
final item = items[curruntIndex];

    return Container(
      height: context.screenHeight * 0.3,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 24,
            offset: Offset(0, -6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePadding,
        0,
        AppSpacing.pagePadding,
        0,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              key: PageStorageKey('info_$curruntIndex'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),

                  // ── Drag handle ───────────────────────────────────────────────
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.inkDisabled,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                    ),
                  ),

                  // ── Name + price ──────────────────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 260),
                            transitionBuilder: (child, anim) => FadeTransition(
                              opacity: CurvedAnimation(
                                parent: anim,
                                curve: Curves.easeOut,
                              ),
                              child: SlideTransition(
                                position:
                                    Tween<Offset>(
                                     begin: const Offset(0.0, 0.12),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: anim,
                                        curve: Curves.easeOut,
                                      ),
                                    ),
                                child: child,
                              ),
                            ),
                            child: DrinkName(key: ValueKey(curruntIndex), item: item),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                         duration: const Duration(milliseconds: 260),
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: CurvedAnimation(
                            parent: anim,
                            curve: Curves.easeOut,
                          ),
                          child: SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(0.0, 0.12),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: anim,
                                    curve: Curves.easeOut,
                                  ),
                                ),
                            child: child,
                          ),
                        ),
                        child: DrinkPrice(
                          key: ValueKey('p_$curruntIndex'),
                          price: item.price,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.md),
                  const Divider(height: 1, color: AppColors.surfaceAlt),
                  const SizedBox(height: AppSpacing.md),

                  // ── Size ──────────────────────────────────────────────────────
                  DrinkSize(curruntIndex: curruntIndex),
                  const SizedBox(height: AppSpacing.lg),



                ],
              ),
            ),
          ),

          AddToCartBtn(items: items, curruntIndex: curruntIndex),
          const SizedBox(height: AppSpacing.md),

        ],
      ),
    );

}
}
//.........................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopBar extends StatelessWidget {
const TopBar({super.key, required this.current, required this.total});
final int current, total;

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(
horizontal: AppSpacing.pagePadding,
vertical: AppSpacing.sm,
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
// ── Back button ─────────────────────────────────────────────────
\_circleBtn(
icon: Icons.arrow_back_ios_new_rounded,
onTap: () {
HapticFeedback.lightImpact();
Navigator.pop(context);
},
),

          // ── Counter pill ────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs + 1,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.70),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomText(
              text: '${current + 1}  /  $total',
              style: AppTextStyles.labelMedium,
            ),
          ),
        ],
      ),
    );

}

Widget \_circleBtn({required IconData icon, required VoidCallback onTap}) {
return Material(
color: AppColors.surface,
shape: const CircleBorder(),
elevation: 2,
shadowColor: const Color(0x22000000),
child: InkWell(
customBorder: const CircleBorder(),
onTap: onTap,
child: Padding(
padding: const EdgeInsets.all(AppSpacing.sm + 2),
child: Icon(icon, size: 17, color: AppColors.ink1),
),
),
);
}
}
//...........................................................................
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/drink.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/drinks_dots.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/info_panel.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<Color> \_kBgTints = AppColors.drinkBackground;

Color? \_tintFor(int index) => \_kBgTints[index];

class ItemDetailsViewBody extends StatefulWidget {
const ItemDetailsViewBody({super.key, required this.initialIndex});
final int initialIndex;

@override
State<ItemDetailsViewBody> createState() => \_ItemDetailsViewBodyState();
}

class \_ItemDetailsViewBodyState extends State<ItemDetailsViewBody> {
static const List<ItemModel> \_items = ItemModel.items;

late final PageController \_pageController;
double \_currentPage = 0;

@override
void initState() {
super.initState();
\_currentPage = widget.initialIndex.toDouble();

    _pageController =
        PageController(initialPage: widget.initialIndex, viewportFraction: 0.50)
          ..addListener(() {
            setState(() => _currentPage = _pageController.page ?? _currentPage);
          });

}

@override
void dispose() {
\_pageController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final int current = \_currentPage.round();

    final Color bgTint = _tintFor(current) ?? AppColors.surface;

    return AnimatedContainer(
     duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      color: bgTint,
      child: SafeArea(
        child: Column(
          children: [
            //app bar
            TopBar(current: current, total: _items.length),
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
      ),
    );

}
}
//..........................................................................
import 'package:cafe_app/features/ItemDetails/Presentation/views/item_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Entry point for the Item Details feature.
class ItemDetailsView extends StatelessWidget {
const ItemDetailsView({super.key, required this.initialIndex});
final int initialIndex;

@override
Widget build(BuildContext context) {
return AnnotatedRegion<SystemUiOverlayStyle>(
value: SystemUiOverlayStyle.dark,
child: Scaffold(body: ItemDetailsViewBody(initialIndex: initialIndex)),
);
}
}
//..........................................................................
