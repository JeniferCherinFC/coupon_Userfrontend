import 'package:flutter/material.dart';

import 'package:user_frontend/bottomnavigationbar/bottom_nav_bar.dart';

void main() {
  runApp(const GetStart());
}

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
