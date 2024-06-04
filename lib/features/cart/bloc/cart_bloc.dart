import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/features/home/model/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: List<ProductDataModel>.from(cartItems)));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    final updatedCartItems = List<ProductDataModel>.from(cartItems);
    updatedCartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: updatedCartItems));
    emit(CartButtonClickedState());
  }
}
