part of 'category_products_cubit.dart';

@immutable
sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoading extends CategoryProductsState {}

final class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductItemModel> productsList;
  CategoryProductsSuccess(this.productsList);
}

final class CategoryProductsFailed extends CategoryProductsState {}

final class CategoryProductsEmpty extends CategoryProductsState {}
