import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok_6/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes_2_uas_kelompok_6/data/favorite/responsesmodel/favorite_responses_model_get.dart';

class FavoriteController extends GetxController {
  final FavoriteDataSource _datasource = FavoriteDataSource();
  RxList<FavoritesResponsesModelGet> favorites = <FavoritesResponsesModelGet>;
  RxList<FavotitesResponsesModelGet> searchResult = <FavoritesResponsesModelGet>;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavorite();
  }

  Future<void> fetchFavorite() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getFavorites();
    if (result != null) {
      favorites.value = result;
    }
    isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void searchfavorite(String query) {
    if (query.isEmpty) {
      searchResult.value  = favorites;
    } else {
      searchResult.value = favorites.where((element) => element.id.toString().toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  Future<void> deleteFavorite(int id) async {
    try {
      final result = await _datasource.deleteFavorite(id);
      if (result != null) {
        favorites.removeWhere((element) => element.id == id);
        searchResult.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete favorite: $e");
    }
  }
}