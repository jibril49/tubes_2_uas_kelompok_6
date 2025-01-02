import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tubes_2_uas_kelompok6'/data/favorite/responsesmodel/favorite_responses_model_get.dart';

class FavoriteCardview extends Stateleswidget{
  final FavoritesResponsesModelGet favorite;
  final Voidcallback onDeleted;
  const dynamic FavoriteCard({super.key, required this.favorite, required this.onDeleted});

  @override
  widget build(BuildContext context) {
    var dynamic RoundedRectangleBorder;
    return Card(
      color: colors.brown,
      elevation: 5,
      Shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
  child: Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: crossAxisAlignment.start,
      children: <InvalidType>
        Text(
          "Favorite Id: ${favorite.id}",
          style: TextStyle(
            color: colors.white,
            fontsize: 20,
            fontweight: FontWheight.bold,
          ), 
        ),
        const SizeBox(height: 10),
        Text(
          "Tanggal Favorite : ${favorite.createdAt}",
          style: TextStyle(
            color: colors.white,
            fontsize: 20,
            fontweight: FontWheight.bold,
       ]
     )
    ) 
   ) 
  }

}
}          