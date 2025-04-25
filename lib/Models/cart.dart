import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shop/Models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<Shop> shopItems = [
    Shop(
      id: '1',
      imagePath: 'assets/images/black_hoodie.png',
      title: 'PRODUCT 1',
      description: 'This is a premium black hoodie made with quality materials',
      price: 99.99,
    ),
    Shop(
      id: '2',
      imagePath: 'assets/images/eye_glass.png',
      title: 'PRODUCT 2',
      description: 'A modern, sleek & minimal pair of glasses.',
      price: 99.99,
    ),
    Shop(
      id: '3',
      imagePath: 'assets/images/watch.jpeg',
      title: 'PRODUCT 3',
      description: 'Item description...',
      price: 99.99,
    ),
    Shop(
      id: '4',
      imagePath: 'assets/images/shoe.png',
      title: 'PRODUCT 4',
      description: 'Item description...',
      price: 99.99,
    ),
  ];

  List<Shop> _cartItem = [];

  Future<List<Shop>> fetchCartItems() async {
    final doc =
        await firestore
            .collection('carts')
            .doc(firebaseAuth.currentUser!.uid)
            .get();

    List<Shop> items = [];
    if (doc.exists && doc.data() != null) {
      doc.data()!.forEach((key, item) {
        items.add(Shop.fromMap(key, item));
      });
    }
    _cartItem = items;
    return _cartItem;
  }

  List<Shop> getshopItem() => shopItems;

  //adding shopItem to cart
  void addshopItemToCart(Shop shopItem, BuildContext context) async {
    final userId = firebaseAuth.currentUser!.uid;
    bool itemExist = _cartItem.any((item) => item.id == shopItem.id);
    if (itemExist) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('This item is already in your cart!')),
      );
      return;
    }

    try {
      // Check if the user is logged in
      if (firebaseAuth.currentUser != null) {
        await firestore.collection('carts').doc(userId).set({
          shopItem.id: shopItem.toMap(),
        }, SetOptions(merge: true));
        _cartItem.add(shopItem);
        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //removing ShopItem to cart
  void removeShopItemFromCart(Shop shopItem) async {
    try {
      final userId = firebaseAuth.currentUser?.uid;
      if (userId == null) {
        return;
      }
      await firestore.collection('carts').doc(userId).update({
        shopItem.id: FieldValue.delete(),
      });
      await fetchCartItems();
      // _cartItem.removeWhere((item) => item.id == shopItem.id);
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
