import 'package:flutter/material.dart';

class UsersItem extends StatelessWidget {
  final int id;
  final String email;
  final String name;
  final String avatar;
  final String role;
  // final String password;
  // final String creationAt;
  // final String updatedAt;

  const UsersItem({
    super.key,
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.role,
    // required this.password,
    // required this.creationAt,
    // required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(avatar),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: $name",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    height: 2,
                  ),
                ),
                Text(
                  "Email: $email",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1,
                  ),
                ),
                Text(
                  "Role: $role",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
