import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class DemoHomeScreen extends StatelessWidget {
  const DemoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home screen'),
      ),
    );
  }
}
