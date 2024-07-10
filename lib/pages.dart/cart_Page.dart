import 'package:firebase_app/components/my_Button.dart';
import 'package:firebase_app/components/my_cart_tile.dart';
import 'package:firebase_app/models/cart_item.dart';
import 'package:firebase_app/models/restaurant.dart';
import 'package:firebase_app/pages.dart/payment_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("cart")),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  "Are you sur you want to clear cart"),
                              actions: [
                                MaterialButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("cancel"),
                                ),
                                MaterialButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    restaurant.clearCart();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("yes"),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
          body: restaurant.cart.isEmpty
              ? Center(
                  child: Text("is empty.."),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: restaurant.cart.length,
                          itemBuilder: (context, i) {
                            return MyCartTile(cartItem: restaurant.cart[i]);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 5),
                      child: MyButton(
                        text: "Go to check out",
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaymentPage()));
                        },
                      ),
                    )
                  ],
                ));
    });
  }
}
