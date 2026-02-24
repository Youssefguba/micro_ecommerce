import 'package:flutter/material.dart';
import 'package:micro_ecommerce/models/product_item_model.dart';

// Widget
class ProductDetailsScreen extends StatefulWidget {
  final ProductItemModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        // reverse: true,
        children: [
          Image.asset(widget.product.image, height: 150),
          SizedBox(height: 20),
          Text(widget.product.name),
          SizedBox(height: 20),
          for(int i = 0; i < 100; i++) Text(widget.product.price.toString()),
        ],
      ),
    );
  }
}
