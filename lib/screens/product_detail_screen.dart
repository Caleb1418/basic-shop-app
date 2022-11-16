import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);

  static const routName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(ProductId);
    return Scaffold(
        appBar: AppBar(
      title: Text(loadedProduct.title),
    ));
  }
}