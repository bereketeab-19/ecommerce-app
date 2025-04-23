import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/cart_screen.dart';
import '../Screens/setting_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void signUserOut(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(),
            content: Text(
              'Are you sure you want to Logout?',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
    );
  }

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
                signUserOut(context);
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                "Logout",
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
