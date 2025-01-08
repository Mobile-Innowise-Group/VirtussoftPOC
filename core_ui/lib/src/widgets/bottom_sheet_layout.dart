import 'package:flutter/material.dart';

class BottomSheetLayout extends StatelessWidget {
  final Widget child;

  const BottomSheetLayout({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: Colors.white,
        ),
        child: Material(
          child: child,
        ),
      ),
    );
  }
}
