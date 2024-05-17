part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionableState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageState extends HomeActionableState {}

class HomeNavigateToCartPageState extends HomeActionableState {}

class HomeProductItemWishlistedActionState extends HomeActionableState {}

class HomeProductItemCartedActionState extends HomeActionableState {}
