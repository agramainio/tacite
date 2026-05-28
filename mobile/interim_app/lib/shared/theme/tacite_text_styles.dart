import 'package:flutter/material.dart';

import 'tacite_colors.dart';

class TaciteTextStyles {
  const TaciteTextStyles._();

  static const TextStyle title = TextStyle(
    fontSize: 28,
    height: 1.05,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.7,
    color: TaciteColors.ink,
  );

  static const TextStyle screenTitle = TextStyle(
    fontSize: 24,
    height: 1.12,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.45,
    color: TaciteColors.ink,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: TaciteColors.ink,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    height: 1.42,
    fontWeight: FontWeight.w400,
    color: TaciteColors.ink,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 15,
    height: 1.42,
    fontWeight: FontWeight.w400,
    color: TaciteColors.inkMuted,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    height: 1.35,
    fontWeight: FontWeight.w500,
    color: TaciteColors.inkMuted,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: TaciteColors.inkMuted,
  );
}
