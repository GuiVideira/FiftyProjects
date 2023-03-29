import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/models/cart.dart';

import '../components/cart_item.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meu carrinho',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 10),


            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (contex, index) {
                  //get individual  shoe 
                  Shoe IndividualShoe = value.getUserCart() [index];


                  //return CartItem
                  return CartItem(shoe: IndividualShoe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
