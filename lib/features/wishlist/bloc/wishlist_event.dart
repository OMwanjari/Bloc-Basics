part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromCartEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveFromCartEvent({required this.productDataModel});
}
