import 'package:flutter/material.dart';
import '../Models/shop.dart';
import 'cart_screen.dart';
import '../Models/cart.dart';
import '../Widgets/drawer.dart';
import '../Widgets/shop_tiles.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  void addItemTocart(Shop shopItem, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(),
            content: Text(
              'Are you sure you want to add this item to the cart?',
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
                  ).addshopItemToCart(shopItem, context);

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

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: Builder(
                builder:
                    (context) => IconButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            drawer: MyDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                  child: Text(
                    "Shop",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                //subtitle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(
                    "Pick from a selected list of premium products",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),

                // horizontal shop tiles
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.shopItems.length,
                    itemBuilder: (context, index) {
                      Shop shopItem = value.getshopItem()[index];
                      return ShopTiles(
                        shopItem: shopItem,
                        onTap: () {
                          addItemTocart(shopItem, context);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 40),
                // some text
                Center(
                  child: Text(
                    'minimal x shop',
                    style: TextStyle(
                      letterSpacing: 5,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 40)),
              ],
            ),
          ),
    );
  }
}
