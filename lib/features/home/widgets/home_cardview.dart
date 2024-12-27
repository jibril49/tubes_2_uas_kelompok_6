import 'package:flutter/foundation.dart'; // The import of 'package:flutter/foundation.dart'
import 'package:flutter/material.dart';
import 'package:tubes2_uas_kelompok_6/data/breeds/responsesmodel/breeds_responses_model.dart';

class HomeCard extends StatelessWidget {
  final BreedsResponsesModel image;
  final VoidCallback onFavoritePressed;
  final VoidCallback onLikePressed;

  const HomeCard({
    super.key,
    required this.image,
    required this.onFavoritePressed,
    required this.onLikePressed,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtils.colorBrownWhite, // Card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ), // RoundedRectangleBorder
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // _buildImageSection(),
            // const SizedBox(height: 10),
            _buildTextSection(),
            const SizedBox(height: 8),
            _buildActionsSection(),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextSection() {
  return Column(
    children: [
      Text(
        "Nama Kucing : ${image.name}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ), // Text
      const SizedBox(height: 10),
      Text(
        "Deskripsi Kucing : $(image.description)"
        style: const TextStyle(
          fontSize: 16,
        ),
      ), // Text
    ],
  );
}

Widget buildActionSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: onFavoritePressed,
        icon: const Icon(Icons.favorite),
      ),
      IconButton(
        onPressed: onLikePressed,
        icon: const Icon(Icons.thumb_up),
      ),
    ],
  );
}