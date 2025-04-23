import 'package:flutter/material.dart';
import '../Models/shop.dart';
import '../Models/cart.dart';
import '../Widgets/cart_tiles.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void removetemfromcart(Shop shopItem) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(),
              content: Text(
                'Are you sure you want to remove this item to the cart?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      'Cancle',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<Cart>(
                      context,
                      listen: false,
                    ).removeShopItemFromCart(shopItem);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      );
    }

    void payButtonPressed() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(),
              content: Text(
                'User wants to pay! Connect this app to your payment backend',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      'Cancle',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      );
    }

    return Consumer<Cart>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cart",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Check your cart before paying!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child:
                        value.cartItem.isEmpty
                            ? Center(
                              child: Text(
                                'Your cart is empty',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            )
                            : ListView.builder(
                              itemCount: value.cartItem.length,
                              itemBuilder: (context, index) {
                                final Shop shopItem = value.cartItem[index];
                                return CartTiles(
                                  shopItem: shopItem,
                                  onTap: () {
                                    removetemfromcart(shopItem);
                                  },
                                );
                              },
                            ),
                  ),

                  Visibility(
                    visible: value.cartItem.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        payButtonPressed();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          left: 30,
                          bottom: 35,
                          right: 30,
                          top: 15,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'PAY NOW',
                          style: TextStyle(letterSpacing: 5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
