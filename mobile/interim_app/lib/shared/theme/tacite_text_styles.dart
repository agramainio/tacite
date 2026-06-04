import 'package:flutter/material.dart';

import 'tacite_colors.dart';

class TaciteTextStyles {
  static const title = TextStyle(
    color: TaciteColors.ink,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.9,
    height: 1.05,
  );

  static const screenTitle = TextStyle(
    color: TaciteColors.ink,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.45,
    height: 1.12,
  );

  static const sectionTitle = TextStyle(
    color: TaciteColors.ink,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.15,
    height: 1.2,
  );

  static const body = TextStyle(
    color: TaciteColors.ink,
    fontSize: 15.5,
    fontWeight: FontWeight.w400,
    height: 1.42,
  );

  static const bodyMuted = TextStyle(
    color: TaciteColors.inkMuted,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const small = TextStyle(
    color: TaciteColors.inkMuted,
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  static const label = TextStyle(
    color: TaciteColors.inkMuted,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.35,
    height: 1.2,
  );
}
