import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo/features/cart/ui/cart_tile.dart';
import 'package:bloc_demo/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo/features/wishlist/ui/wishlist_tile.dart';
import 'package:bloc_demo/features/wishlist/bloc/wishlist_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is WishlistButtonClickedState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item Removed from Wishlist")));
          }
        },
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishSuccesState:
              final successState = state as WishSuccesState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                        wishlistBloc: wishlistBloc,
                        productDataModel: successState.wishlistItems[index]);
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
