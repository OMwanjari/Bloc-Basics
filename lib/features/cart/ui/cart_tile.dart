import 'package:flutter/material.dart';
import 'package:bloc_demo/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo/features/home/model/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 120,
            width: 200,
            //padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productDataModel.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(productDataModel.description),
              Text("\$" + productDataModel.price.toString(),
                  style: TextStyle(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: productDataModel));
                  },
                  icon: Icon(Icons.shopping_bag))
            ],
          )
        ],
      ),
    );
  }
}
