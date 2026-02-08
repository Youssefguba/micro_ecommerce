import 'package:flutter/material.dart';

import '../product_item_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: ProductItemModel.productsList.length,
          itemBuilder: (context, index) {
            final product = ProductItemModel.productsList[index];
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

        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: ListTile(
              title: Text('50 USD'),
              subtitle: Text('50 USD'),
              trailing: Text('50 USD'),
            ),
          ),
        ),
      ],
    );
  }
}
