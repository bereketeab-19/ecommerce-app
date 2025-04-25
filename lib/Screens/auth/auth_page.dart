import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shop/Screens/auth/login_or_register_page.dart';
import 'package:minimal_shop/Screens/shop_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Scaffold(body: checkAuthStateChangs(firebaseAuth));
  }

  StreamBuilder<User?> checkAuthStateChangs(FirebaseAuth firebaseAuth) {
    return StreamBuilder<User?>(
      stream: firebaseAuth.authStateChanges(),
      builder: (context, snapshot) {
        //has data
        if (snapshot.hasData) {
          return ShopScreen();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return LoginOrRegisterPage();
        }
      },
    );
  }
}
