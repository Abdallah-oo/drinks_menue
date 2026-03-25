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
