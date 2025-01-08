import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core_ui.dart';

abstract class AppFonts {
  static TextStyle actionM = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Colors.black,
  );

  static TextStyle actionS = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    color: Colors.black,
  );

  static TextStyle headingH1 = GoogleFonts.inter(
    fontWeight: FontWeight.w800,
    fontSize: 24,
    color: Colors.black,
  );

  static TextStyle headingH3 = GoogleFonts.inter(
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle headingH4 = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle headingH5 = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: Colors.black,
  );

  static TextStyle bodyM = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle bodyS = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Colors.black,
  );
}
