import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '/screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';

import '../widgets/products_grid.dart';
import '../widgets/products_items.dart';

enum PopUpMenuOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (PopUpMenuOptions selectedValue) {
              setState(
                () {
                  if (selectedValue == PopUpMenuOptions.Favourites) {
                    _showOnlyFavourites = true;
                  } else {
                    _showOnlyFavourites = false;
                  }
                },
              );
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: PopUpMenuOptions.Favourites,
                child: Text('Only Favourites'),
              ),
              const PopupMenuItem(
                value: PopUpMenuOptions.All,
                child: Text("Show All"),
              ),
            ],
            icon: Icon(
              Icons.more_vert_sharp,
            ),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart_sharp),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
