import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product_item_model.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());

  final List<ProductItemModel> productsList = ProductItemModel.productsList;

  void loadData() async {
    emit(CategoryProductsLoading());
    // Call Data from server
    // Simulation
    await Future.delayed(Duration(milliseconds: 500));

    if (productsList.isEmpty) {
      emit(CategoryProductsFailed());
      return;
    }

    emit(CategoryProductsSuccess(productsList));
  }

  void onFilterData([CategoryType? type]) {
    if (type == null) {
      emit(CategoryProductsSuccess(productsList));
      return;
    }

    final filteredList = productsList
        .where((item) => item.category == type)
        .toList();

    emit(CategoryProductsSuccess(filteredList));
  }

  void search(String text) {
    if (text.isEmpty) {
      emit(CategoryProductsSuccess(productsList));
      return;
    }

    // Search for products with start of character
    // ببحث عن المنتجات بأول حرف منها
    final items = productsList
        .where(
          (item) =>
              item.name.toLowerCase().startsWith(text.trim().toLowerCase()),
        )
        .toList();

    if (items.isEmpty) {
      emit(CategoryProductsEmpty());
      return;
    }

    // 1. if list is empty? -> Handle Logic (DONE)
    // 2. if string is capital or small (DONE)
    // 3. If string is empty return all listw

    emit(CategoryProductsSuccess(items));
  }
}
