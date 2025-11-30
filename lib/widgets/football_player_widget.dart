import 'package:flutter/material.dart';

// Stateless hanya akan menampilkan, akan berubah jika statefull mengalami build ulang
// Fungsi stateless hanya untuk menampilkan UI
// set state hanya bisa di dtateful widget

class FootballPlayerWidget extends StatelessWidget {
  final String name;
  final String country;
  final String? imageUrl;
  final bool isFavorite;
  final Function()? onTap;

  const FootballPlayerWidget({
    super.key,
    required this.name,
    required this.country,
    this.imageUrl,
    this.isFavorite = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 16,
            children: [
              CircleAvatar(
                foregroundImage: imageUrl != null
                    ? NetworkImage(imageUrl!)
                    : null,
                child: Text(name.isNotEmpty ? name[0] : "?"),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(country, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              if (isFavorite) Icon(Icons.star, color: Colors.amber),
            ],
          ),
        ),
      ),
    );
  }
}
