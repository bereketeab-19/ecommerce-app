import 'package:flutter/material.dart';
import 'package:minimal_shop/Models/shop.dart';

class CartTiles extends StatelessWidget {
  const CartTiles({super.key, required this.shopItem, required this.onTap});

  final Shop shopItem;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            shopItem.imagePath,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        title: Text(
          shopItem.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '\$${shopItem.price.toString()}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: Icon(Icons.cancel_outlined),
        ),
      ),
    );
  }
}
