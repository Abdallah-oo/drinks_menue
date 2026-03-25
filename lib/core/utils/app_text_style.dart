import 'package:drinks_menue/core/themes/colors.dart';
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