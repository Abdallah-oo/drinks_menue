import 'package:flutter/material.dart';

/// Central design token file.
/// Every color in the app lives here — never hardcode colors elsewhere.
abstract final class AppColors {
  // ─── Brand ──────────────────────────────────────────────────────────────────
  static const primary       = Color(0xFF2DBD6E); // vibrant green
  static const primaryLight  = Color(0xFFE8F8EF); // green tint for backgrounds
  static const primaryDark   = Color(0xFF1E9E55); // pressed / deep green

  // ─── Neutrals ───────────────────────────────────────────────────────────────
  static const ink           = Color(0xFF111827); // near-black titles
  static const inkSecondary  = Color(0xFF6B7280); // body text / subtitles
  static const inkDisabled   = Color(0xFFD1D5DB); // placeholders

  // ─── Surfaces ───────────────────────────────────────────────────────────────
  static const background    = Color(0xFFF8F9FA); // page background
  static const surface       = Color(0xFFFFFFFF); // cards
  static const surfaceAlt    = Color(0xFFF3F4F6); // input fills, chip fills

  // ─── Semantic ───────────────────────────────────────────────────────────────
  static const error         = Color(0xFFEF4444);
  static const warning       = Color(0xFFF59E0B);
  static const info          = Color(0xFF3B82F6);

  // ─── Shadows ────────────────────────────────────────────────────────────────
  static const shadow        = Color(0x0D000000); // 5 % black
  static const shadowMedium  = Color(0x1A000000); // 10 % black
/// ─── Tabs (Light Mode - Black & White Professional) ───────────────
  static const tabSelected = Color(0xFF111111); // soft black
  static const tabUnselected = Color(0xFFF2F2F2); // very light grey
  static const tabBorder = Color(0xFFE5E7EB); // subtle border
  static const tabTextSelected = Color(0xFFFFFFFF); // white
  static const tabTextUnselected = Color(0xFF444444); // dark grey

}
