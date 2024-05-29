import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String name;
  final String image;
  const CategoriesItem({
    super.key,
    required this.name,
    required this.image,
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
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                height: 2,
              ),
            ),
          ),
          // Text(
          //   description,
          //   style: const TextStyle(
          //     fontSize: 18,
          //     height: 1,
          //   ),
          // ),
          // Text(
          //   "\$$price",
          //   style: const TextStyle(
          //     fontSize: 25,
          //     fontWeight: FontWeight.bold,
          //     height: 2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
