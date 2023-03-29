import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
//List of shoe
  List<Shoe> shoeShop = [
    Shoe(
      name: 'air jordan 3',
      price: '990',
      imagePath: 'lib/images/air_jordan_3.png',
      description: 'O tericerio tenis de Jordan',
    ),
    Shoe(
      name: 'Air Max Plus 3',
      price: '1100',
      imagePath: 'lib/images/air_max_plus3.jpg',
      description: 'O terceiro tenis da linha Air Max Plus',
    ),
    Shoe(
      name: 'air Zoom',
      price: '1900',
      imagePath: 'lib/images/air_zoom.png',
      description: 'O Melhor tenis de corrida',
    ),
    Shoe(
      name: 'Nike Dunk',
      price: '800',
      imagePath: 'lib/images/nike_dunk.png',
      description: 'Tenis de Skate e Lifestyle',
    ),
  ];

//List of itens in the Cart
  List<Shoe> userCart = [];

//List of Shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

//add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
