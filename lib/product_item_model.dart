class ProductItemModel {
  final String name;
  final String image;
  final double price;
  bool isFavourite;

  ProductItemModel(
    this.name,
    this.image,
    this.price, {
    this.isFavourite = false,
  });

  static List<ProductItemModel> productsList = [
    ProductItemModel('Sweater', 'assets/products/sweater.png', 100),
    ProductItemModel('bag', 'assets/products/bag.png', 100),
    ProductItemModel('pants', 'assets/products/pants.png', 100),
    ProductItemModel('shoes', 'assets/products/shoes.png', 100),
    ProductItemModel('shoes 2', 'assets/products/shoes_2.png', 100),
    ProductItemModel('Shirt', 'assets/products/shirt.png', 100),
  ];
}
