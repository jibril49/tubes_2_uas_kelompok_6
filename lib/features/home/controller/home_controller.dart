

import 'package:get/get.dart';
import 'package:tubes2_uas_kelompok0/data/breeds/datasource/breeds_datasource
import 'package:tubes2_uas_kelompok0/data/vote/datasource/vote_datasource.datasource


import '../../.. /data/breeds/responsemode1/breeds_responses_model.dart';
import '../../../data/vote/datasource/vote_datasource.dart';
class HomeController extends GetxController {
  final BreedsDatasource datasource = BreedsDatasource();
  final VoteDatasource voteDatasource = VoteDatasource();
  final FavoriteDatasource favoriteDatasource = FavoriteDatasource();
  var images = <BreedsResponsesModel>[].obs;


 
  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      final response = await _datasource.getBreads();
      images.value = response;
    } catch (e) {
      Printlog.printlog("catch error $e");
    }
  } 


  
  void onFavoritePressed(String imageId) {
    final favorite = FavoriteRequestMode1Post(
      imageId: imageId,
      subId: "1234",
    );
    _favoriteDatasource.createFavorite(favorite);
  }

  void onLikePressed(String imageId) {
    final vote = VoteRequestsMode(
      imageId: imageId,
      subId: "1234",
      value: 1,
    );
    _voteDatasource.create(Vote);
  }  
    
  
  
}