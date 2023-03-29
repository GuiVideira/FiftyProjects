import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/models/cart.dart';

import '../components/shoe_tile.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart 
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
  
  //alert the user
  showDialog(
    context: context, builder : (context) => AlertDialog(
      title: Text('Adicionado com Sucesso!'),
      content: Text('Olhe o carrinho'),
    )
  );
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,value, child) => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Pesquisar', style: TextStyle(color: Colors.grey)),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),

        //lista tenis

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Novos!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        //Listr of Shoes for Sale
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //get a  Shoe from shop list
              Shoe shoe = value.getShoeList() [index];
             
             // return the shoe 
              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe)
              );
            },
          ),
        ),

        const Padding(padding: EdgeInsets.only(top:25.0, left: 25, right: 25),
        child: Divider(color: Colors.white)
        )
      ],
    ), );
  }
}
