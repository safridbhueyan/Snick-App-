import 'package:addapp/components/cart_item.dart';
import 'package:addapp/models/cart.dart';
import 'package:addapp/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //heading
                  Text(
                    'My cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Expanded(
                      child: ListView.builder(
                          itemCount: value.getUserCart().length,
                          itemBuilder: (context, index) {
                            //get each shoe
                            Shoe individualsShoe = value.getUserCart()[index];

                            //return the cart item
                            return CartItem(shoe: individualsShoe);
                          }))
                ],
              ),
            ));
  }
}
