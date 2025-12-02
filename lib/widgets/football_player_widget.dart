import 'package:flutter/material.dart';

class FootballPlayerWidget extends StatelessWidget {
  final String name;
  final String country;
  final String? imageUrl;
  final bool isFavorite;
  final Function()? onTap;
  final VoidCallback? onFabPressed;

  const FootballPlayerWidget({
    super.key,
    required this.name,
    required this.country,
    this.imageUrl,
    this.isFavorite = false,
    this.onTap,
    this.onFabPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Widget utama tetap sama
        GestureDetector(
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
        ),

        // FloatingActionButton di bawah card
        if (onFabPressed != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                mini: true,
                onPressed: onFabPressed,
                heroTag: 'fab_$name', // Unique tag untuk menghindari conflict
                tooltip: 'Kembali ke Home',
                child: const Icon(Icons.home),
              ),
            ),
          ),
      ],
    );
  }
}
