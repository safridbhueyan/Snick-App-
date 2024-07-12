import 'package:addapp/models/cart.dart';
import 'package:addapp/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  Shoe shoe;

  CartItem({
    super.key,
    required this.shoe,
  });
  void removeItemfromcart(BuildContext context) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Image.asset(shoe.imagePath),
        title: Text(shoe.name),
        subtitle: Text(shoe.price),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => removeItemfromcart(context)),
      ),
    );
  }
}
