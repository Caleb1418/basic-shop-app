import "package:flutter/material.dart";

import '../widgets/products_grid.dart';

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
                child: Text('Only Favourites'),
                value: PopUpMenuOptions.Favourites,
              ),
              const PopupMenuItem(
                child: Text("Show All"),
                value: PopUpMenuOptions.All,
              )
            ],
            icon: Icon(
              Icons.more_vert_sharp,
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
