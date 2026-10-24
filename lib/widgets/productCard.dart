import 'package:flutter/material.dart';
import 'package:task1/widgets/cardContent.dart';

import '../models/productModel.dart';

class ProductCard extends StatelessWidget {
  final bool isGrid;
  final Product product;
  const ProductCard({super.key, required this.isGrid, required this.product});

  @override
  Widget build(BuildContext context) {
    final out = product.OutOfStock;
    return SizedBox(
      height: isGrid ? 200 : 220,
      child: Card(
        child: isGrid
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Image.network(
                      product.thumbnail,
                      height: 150,
                      opacity: out
                          ? const AlwaysStoppedAnimation(0.5)
                          : const AlwaysStoppedAnimation(1),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitle(title: product.title),
                          Text(product.brand),
                          SizedBox(height: 5),
                          Text(
                            product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          RatingTag(rating: product.rating),
                          Text(
                            out ? 'Out of Stock' : 'Stock: ${product.stock}',
                            style: TextStyle(
                              color: out
                                  ? Color.fromARGB(255, 255, 0, 0)
                                  : Color.fromARGB(255, 0, 150, 255),
                            ),
                          ),
                          Text(
                            '${product.price.toString()}\$',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  Image.network(
                    product.thumbnail,
                    height: 150,
                    opacity: out
                        ? const AlwaysStoppedAnimation(0.5)
                        : const AlwaysStoppedAnimation(1),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitle(title: product.title),
                        Text(product.brand),
                        Text(
                          product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingTag(rating: product.rating),
                        Text(
                          out ? 'Out of Stock' : 'Stock: ${product.stock}',
                          style: TextStyle(
                            color: out
                                ? Color.fromARGB(255, 255, 0, 0)
                                : Color.fromARGB(255, 0, 150, 255),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${product.price.toString()}\$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
