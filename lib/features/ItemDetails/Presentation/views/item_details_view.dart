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
