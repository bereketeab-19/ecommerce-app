import 'package:flutter/material.dart';
import 'package:minimal_shop/Screens/shop_screen.dart';
import 'package:minimal_shop/Widgets/buttons.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: Icon(
                Icons.trolley,
                size: 100,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(height: 30),
            // Title
            Text(
              "MINIMAL SHOP",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Subtitle
            Text(
              "Made with Flutter ❤️",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            //button
            Buttons(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ShopScreen()));
              },
              padding: EdgeInsets.all(20),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
