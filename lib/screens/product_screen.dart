import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_ecommerce/cubits/category_products_cubit.dart';
import 'package:micro_ecommerce/product_item_model.dart';

import 'product_details_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  CategoryType? selectedType;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CategoryProductsCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<CategoryProductsCubit>().loadData();

    // adapted
    // Adaptive Widgets
    return Column(
      spacing: 10,
      children: [
        // Search Bar
        _buildSearchBar(),

        // Filter Buttons
        Row(
          spacing: 10,
          children: [
            SizedBox(width: 10),
            _buildFilterButton('All', null),
            _buildFilterButton('Featured', CategoryType.featured),
            _buildFilterButton('New', CategoryType.newProduct),
          ],
        ),

        // List of Products

        // Grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
              builder: (context, state) {
                if (state is CategoryProductsLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is CategoryProductsSuccess) {
                  final products = state.productsList;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final item = products[index];
                      // 80% daily work.
                      // Loading per need
                      return _buildProductItem(product: item);
                    },
                    // children: [
                    //   for (int i = 0; i < ProductItemModel.productsList.length; i++)
                    //     _buildProductItem(
                    //       product: ProductItemModel.productsList[i],
                    //     ),
                    // ],
                  );
                }

                if (state is CategoryProductsEmpty) {
                  return Center(
                    child: Text('You cant find this product in your search!'),
                  );
                }

                return Center(child: Text('There is no data!'));
              },
            ),
          ),
        ),
      ],
    );
  }

  //  Function Widget
  Widget _buildFilterButton(String text, CategoryType? type) {
    return GestureDetector(
      onTap: () {
        context.read<CategoryProductsCubit>().onFilterData(type);

        setState(() {
          selectedType = type;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selectedType == type
              ? Colors.deepPurpleAccent
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Text(
          text,
          style: TextStyle(
            color: selectedType == type ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        onChanged: (text) {
          context.read<CategoryProductsCubit>().search(text);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
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
    // FIFO = First in First Out (Queue)
    // LIFO = Last in First Out (Stack)

    // rtl = Right to Left
    // ltr = Left to Right
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
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
          ),

          IconButton(
            onPressed: () {
              print('Item added to cart!');
              setState(() {
                // if (_isFavourite) {
                //   _isFavourite = false;
                // } else {
                //   _isFavourite = true;
                // }

                product.isFavourite = !product.isFavourite;
              });
            },
            icon: product.isFavourite
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
}

// Boilerplate code

// Column
// Row
// Expanded
// Spacer
