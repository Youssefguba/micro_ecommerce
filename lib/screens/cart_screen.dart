import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../models/product_item_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.cartItems.isEmpty) {
          return Center(
            child: Text('There is no items in cart!, please add one.'),
          );
        }
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final product = state.cartItems[index];
                // Row, Column - Flex Widgets
                // List Tile
                return ListTile(
                  leading: Image.asset(product.image),
                  title: Text(product.name),
                  subtitle: Text(product.price.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (product.quantity == 1) return;
                          setState(() {
                            product.quantity--;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(product.quantity.toString()),
                      IconButton(
                        onPressed: () {
                          if (product.quantity >= 10) return;
                          setState(() {
                            product.quantity++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Container(
            //   height: 90,
            //   color: Colors.white,
            //   child: ListTile(
            //     title: Text('50 USD'),
            //     subtitle: Text('50 USD'),
            //     trailing: Text('50 USD'),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
