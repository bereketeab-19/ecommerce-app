import 'package:flutter/material.dart';
import 'package:minimal_shop/Models/shop.dart';

class Cart extends ChangeNotifier {
  List<Shop> shopItems = [
    Shop(
      imagePath: 'assets/images/black_hoodie.png',
      title: 'PRODUCT 1',
      description: 'This is a premium black hoodie made with quality materials',
      price: 99.99,
    ),
    Shop(
      imagePath: 'assets/images/eye_glass.png',
      title: 'PRODUCT 2',
      description: 'A modern, sleek & minimal pair of glasses.',
      price: 99.99,
    ),
    Shop(
      imagePath: 'assets/images/watch.jpeg',
      title: 'PRODUCT 3',
      description: 'Item description...',
      price: 99.99,
    ),
    Shop(
      imagePath: 'assets/images/shoe.png',
      title: 'PRODUCT 4',
      description: 'Item description...',
      price: 99.99,
    ),
  ];

  List<Shop> _cartItem = [];

  List<Shop> get cartItem => _cartItem;

  List<Shop> getshopItem() => shopItems;

  //adding shopItem to cart
  void addshopItemToCart(Shop shopItem, BuildContext context) {
    bool itemExist = _cartItem.any((item) => item.title == shopItem.title);

    if (!itemExist) {
      _cartItem.add(shopItem);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('This item is already in your cart!')),
      );
    }
  }

  //removing ShopItem to cart
  void removeShopItemFromCart(Shop shopItem) {
    _cartItem.remove(shopItem);
    notifyListeners();
  }
}
