enum CategoryType { featured, newProduct }

class ProductItemModel {
  final String name;
  final String image;
  final double price;
  int quantity;
  bool isFavourite;
  final CategoryType? category;

  ProductItemModel(
    this.name,
    this.image,
    this.price, {
    this.isFavourite = false,
    this.category,
    this.quantity = 1,
  });



  ProductItemModel copyWith({int q = 1}) {
    return  ProductItemModel(
      name,
      image,
      price,
      category: category,
      isFavourite: isFavourite,
      quantity: q
    );
  }


  static List<ProductItemModel> productsList = [
    ProductItemModel(
      'Sweater',
      'assets/products/sweater.png',
      100,
      category: CategoryType.featured,
    ),
    ProductItemModel(
      'bag',
      'assets/products/bag.png',
      100,
      category: CategoryType.newProduct,
    ),
    ProductItemModel(
      'pants',
      'assets/products/pants.png',
      100,
      category: CategoryType.featured,
    ),
    ProductItemModel(
      'shoes',
      'assets/products/shoes.png',
      100,
      category: CategoryType.newProduct,
    ),
    ProductItemModel(
      'shoes 2',
      'assets/products/shoes_2.png',
      100,
      category: CategoryType.featured,
    ),
    ProductItemModel(
      'Shirt',
      'assets/products/shirt.png',
      100,
      category: CategoryType.newProduct,
    ),
  ];

  @override
  String toString() {
    return 'name $name, qu $quantity';
  }
}
