import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartState.initial()) {
    on<AddToCartEvent>((event, emit) {
      final index = state.cartItems.indexWhere((item) => event.product.name == item.name);
      final cartItems = state.cartItems;

      if(index == -1) {
        cartItems.add(event.product);
        emit(state.copyWith(status: CartStatus.success, cartItems: cartItems));

      } else {

        final product = cartItems[index];
        final q = ++product.quantity;
        final item = product.copyWith(q: q);
        cartItems[index] = item;

        emit(state.copyWith(status: CartStatus.initial, cartItems: cartItems));
      }
    });

    on<IncreaseQuantityEvent>((event, emit) {});

    on<DecreaseQuantityEvent>((event, emit) {});
  }
}
