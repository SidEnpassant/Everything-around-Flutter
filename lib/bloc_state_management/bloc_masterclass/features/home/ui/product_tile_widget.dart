import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/bloc_masterclass/features/home/bloc/bloc_masterclass_home_bloc.dart';
import 'package:testapp/bloc_state_management/bloc_masterclass/features/home/models/bloc_mastercourse_home_product.dart';


class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key,
  required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl)
              )
            ),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
           ),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20,),
          Row(
            children: [
              Text("Rs." + productDataModel.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel,
                      ));
                    },
                    icon: Icon(Icons.favorite_border , color: Colors.black,),
                  ),
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel,
                      ));
                    },
                    icon: Icon(Icons.shopping_bag_outlined ,  color: Colors.black,),
                  )
                ],
              )
            ],
          )
      ],
     ),
    );
  }
}
