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
