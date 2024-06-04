import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_demo/data/wishlist_item.dart';
import 'package:bloc_demo/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo/features/home/model/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromCartEvent>(wishlistRemoveFromCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishSuccesState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromCartEvent(
      WishlistRemoveFromCartEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishSuccesState(wishlistItems: wishlistItems));
    emit(WishlistButtonClickedState());
  }
}
