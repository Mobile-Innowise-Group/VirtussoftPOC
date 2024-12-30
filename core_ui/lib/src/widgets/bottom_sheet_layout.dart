import 'package:flutter/material.dart';

class BottomSheetLayout extends StatelessWidget {
  final Widget child;

  const BottomSheetLayout({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 100),
        Expanded(
          child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Material(
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
