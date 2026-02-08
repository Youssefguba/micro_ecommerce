import 'package:flutter/material.dart';
import 'package:micro_ecommerce/screens/register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
        child: Center(child: Icon(Icons.tiktok_rounded, size: 100)),
      ),
    );
  }
}
