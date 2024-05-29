import 'package:flutter/material.dart';

class ProductsItem extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;

  const ProductsItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      images[0].replaceAll(RegExp(r'\[\"|\"\]'), "")),
                  fit: BoxFit.cover,
                )),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              height: 2,
            ),
          ),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              height: 1,
            ),
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
