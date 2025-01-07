import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static TextStyle normal14 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle normal24 = GoogleFonts.inter(
    fontWeight: FontWeight.w800,
    fontSize: 24,
  );

  static TextStyle thick12 = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );

  static TextStyle normal12 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}
