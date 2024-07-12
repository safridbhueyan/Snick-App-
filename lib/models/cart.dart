import 'package:addapp/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
// list of shoes for sale
  List<Shoe> shoeshop = [
    Shoe(
        name: "Red Rover",
        price: "230",
        imagePath: "lib/images/s2.png",
        description:
            "the forward-thinking design of his latest signature shoe"),
    Shoe(
        name: "Air jordan 1",
        price: "310",
        imagePath: "lib/images/s3.png",
        description: "Velocity Vortex Unleash the speed, Embrace the power "),
    Shoe(
        name: "Onyx white",
        price: "230",
        imagePath: "lib/images/s4.png",
        description: "Maverick Run beyond boundaries ,Break the limits"),
    Shoe(
        name: "sky tiffiney",
        price: "230",
        imagePath: "lib/images/s5.png",
        description:
            "Zenith Zephyr Elevate your stride,Elevate your life, Reach new heights"),
    Shoe(
        name: "Drose 4",
        price: "230",
        imagePath: "lib/images/s6.png",
        description: "Quantum Quest In every step,Explore the unknown"),
  ];
//list of items in user cart
  List<Shoe> userCart = [];
//get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeshop;
  }
//get cart

  List<Shoe> getUserCart() {
    return userCart;
  }

// add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
