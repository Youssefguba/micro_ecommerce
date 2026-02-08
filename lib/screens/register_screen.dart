import 'package:flutter/material.dart';
import 'package:micro_ecommerce/home_screen.dart';
import 'package:micro_ecommerce/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Icon(Icons.tiktok, size: 50),

            Text(
              'Register Screen',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),

            // Elevated Button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (_) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0D80F2),
                // elevation: 2,
                padding: EdgeInsets.all(12),
                fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Have an account? Login',
                style: TextStyle(color: Colors.black),
              ),
            ),

            // InkWell(
            //   // hoverColor: Colors.orange,
            //   // splashColor: Colors.orange,
            //   borderRadius: BorderRadius.circular(50),
            //   onTap: () {
            //     print('Container Button!!');
            //   },
            //   child: Container(
            //     width: MediaQuery.sizeOf(context).width,
            //     height: 48,
            //     padding: EdgeInsets.all(12),
            //     decoration: BoxDecoration(
            //       color: Color(0xff0D80F2),
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //     child: Center(
            //       child: Text('Login', style: TextStyle(color: Colors.white)),
            //     ),
            //   ),
            // ),
            // TextButton(onPressed: () {}, child: Text('Login')),
            // OutlinedButton(onPressed: () {}, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}

// 0 1 2 3 4 5 6 7 8 9 A B C D E F

// 1. Opacity
// 2. Red
// 3. Green
// 4. Blue

// 0x FF 0D 80 F2
