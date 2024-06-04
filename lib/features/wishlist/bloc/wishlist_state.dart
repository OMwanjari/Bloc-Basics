part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishSuccesState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishSuccesState({required this.wishlistItems});
}

class WishlistButtonClickedState extends WishlistState {}
