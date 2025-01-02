import 'package:flutter/material.dart';

import '../modules/auth/presentation/screens/sign_in_screen.dart';

class TestAPI extends StatelessWidget {
  const TestAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}