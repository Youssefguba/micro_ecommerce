import 'package:flutter/material.dart';
import 'package:micro_ecommerce/product_item_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('GUBA :: Size ${MediaQuery.sizeOf(context).width}');
    // adapted
    // Adaptive Widgets
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Smart Shop'),
        // leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {
              print('Item added to cart!');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {
              print('Item added to cart!');
            },
            icon: Icon(Icons.person_2),
          ),
        ],
      ),
      body: Column(
        spacing: 10,
        children: [
          // Search Bar
          _buildSearchBar(),

          // Filter Buttons
          Row(
            spacing: 10,
            children: [
              SizedBox(width: 10),
              _buildFilterButton('All'),
              _buildFilterButton('Featured'),
              _buildFilterButton('New'),
            ],
          ),

          // List of Products

          // Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.85,
                ),
                itemCount: ProductItemModel.productsList.length,
                itemBuilder: (context, i) {
                  // 80% daily work.
                  // Loading per need
                  return _buildProductItem(
                    product: ProductItemModel.productsList[i],
                  );
                },
                // children: [
                //   for (int i = 0; i < ProductItemModel.productsList.length; i++)
                //     _buildProductItem(
                //       product: ProductItemModel.productsList[i],
                //     ),
                // ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Function Widget
  Widget _buildFilterButton(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Text(text, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Search',
          // labelText: 'Enter you search',
          // helperText: 'Your password should contain 8 characters',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          // suffixIcon: Icon(Icons.visibility),
        ),
      ),
    );
  }

  Widget _buildProductItem({required ProductItemModel product}) {
    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          // borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 172,
            width: 172,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: AssetImage(product.image)),
            ),
            // child: Image.asset(product.image),
          ),
        ),
        Text(product.name),
        Text('${product.price} USD'),
      ],
    );
  }
}

// Boilerplate code
