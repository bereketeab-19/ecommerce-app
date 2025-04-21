import 'package:flutter/material.dart';
import 'package:minimal_shop/Screens/cart_screen.dart';
import 'package:minimal_shop/Screens/intro_screen.dart';
import 'package:minimal_shop/Screens/setting_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            // drawer header icon
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide.none),
              ),
              child: Icon(
                Icons.trolley,
                size: 50,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(height: 20),
            // shop button
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                "SHOP",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 5,
                ),
              ),
            ),

            // cart button
            ListTile(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => CartScreen()));
              },
              leading: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                "CART",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 5,
                ),
              ),
            ),

            // setting button
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                "SETTING",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 5,
                ),
              ),
            ),

            // about button
            ListTile(
              leading: Icon(
                Icons.info,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                "ABOUT",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 5,
                ),
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => IntroScreen()));
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                "Exit",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
