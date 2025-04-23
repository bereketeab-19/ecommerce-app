import 'package:flutter/material.dart';

class AuthActionButtons extends StatelessWidget {
  const AuthActionButtons({
    super.key,
    required this.onTap,
    required this.imagePath,
  });

  final void Function()? onTap;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
