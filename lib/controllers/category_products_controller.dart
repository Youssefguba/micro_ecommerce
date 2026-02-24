import 'package:flutter/foundation.dart';
import 'package:micro_ecommerce/models/product_item_model.dart';

enum CategoryProductsStatus { initial, loading, success, failed, empty }

class CategoryProductsController extends ChangeNotifier {
  CategoryProductsStatus _status = CategoryProductsStatus.initial;
  List<ProductItemModel> _displayedProducts = [];

  final List<ProductItemModel> _allProducts = ProductItemModel.productsList;

  CategoryProductsStatus get status => _status;
  List<ProductItemModel> get displayedProducts => _displayedProducts;

  Future<void> loadData() async {
    _status = CategoryProductsStatus.loading;
    notifyListeners();

    // Call Data from server
    // Simulation
    await Future.delayed(const Duration(seconds: 2));

    if (_allProducts.isEmpty) {
      _status = CategoryProductsStatus.failed;
      notifyListeners();
      return;
    }

    _displayedProducts = List.of(_allProducts);
    _status = CategoryProductsStatus.success;
    notifyListeners();
  }

  void onFilterData([CategoryType? type]) {
    if (type == null) {
      _displayedProducts = List.of(_allProducts);
    } else {
      _displayedProducts =
          _allProducts.where((item) => item.category == type).toList();
    }

    _status = CategoryProductsStatus.success;
    notifyListeners();
  }

  void search(String text) {
    if (text.isEmpty) {
      _displayedProducts = List.of(_allProducts);
      _status = CategoryProductsStatus.success;
      notifyListeners();
      return;
    }

    // Search for products with start of character
    // ببحث عن المنتجات بأول حرف منها
    final items = _allProducts
        .where(
          (item) =>
              item.name.toLowerCase().startsWith(text.trim().toLowerCase()),
        )
        .toList();

    if (items.isEmpty) {
      _status = CategoryProductsStatus.empty;
      notifyListeners();
      return;
    }

    _displayedProducts = items;
    _status = CategoryProductsStatus.success;
    notifyListeners();
  }
}
