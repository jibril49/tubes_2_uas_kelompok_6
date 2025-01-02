// final favoritesResponsesModel = favoritesResponsesModelFromJson(json);

import 'dart:convert';

FavoritesResponsesModelPost favoritesResponsesModelFromJson(String str) =>
    FavoritesResponsesModelPost.fromJson(json.decode(str));

String favoritesResponsesModelToJson(FavoritesResponsesModelPost data) =>
    json.encode(data.toJson());

class FavoritesResponsesModelPost {
  String message;
  int id;

  FavoritesResponsesModelPost({
    required this.message,
    required this.id,
  });

  factory FavoritesResponsesModelPost.fromJson(Map<String, dynamic> json) =>
      FavoritesResponsesModelPost(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}

Future<bool> addFavorite(Map<String, dynamic> favoriteData) async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.favoriteAddEndpoint,
      method: HttpMethods.post,
      useAuth: true,
      body: favoriteData,
    );

    PrintLog.printLog('addFavorite DataSource response: $response');

    if (response['statusCode'] == 200) {
      return true;
    } else {
      throw Exception('Failed to add favorite: ${response['statusMessage']}');
    }
  } catch (e) {
    PrintLog.printLog('addFavorite DataSource error: $e');
    throw Exception('Failed to add favorite');
  }
}

Future<List<FavoritesResponsesModelGet>> getFavorite() async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.favoriteGetEndpoint,
      method: HttpMethods.get,
      useAuth: true,
    );

    PrintLog.printLog('getFavorite DataSource response: $response');

    if (response['statusCode'] == 200 && response.containsKey('data')) {
      final List<dynamic> data = response['data'];
      return data
          .map((item) => FavoritesResponsesModelGet.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load getFavorite: Invalid response format');
    }
  } catch (e) {
    PrintLog.printLog('getFavorite DataSource error: $e');
    throw Exception('Failed to load getFavorite');
  }
}

Future<FavoritesResponsesModelDelete?> deleteFavorite(int favoriteId) async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.favByIdGetEndpoint(favoriteId),
      method: HttpMethods.delete,
      useAuth: true,
    );

    final message = response['messege'];
    final statusMessage = response ['statusMessege'];

    if (message == 'SUCCES'|| statusMessage == 'OK'){
      if(response['data'] != null && response['data'] is Map<String, dynamic>){
        }else{
          return FavoritesResponsesModelDelete(

        message : message ?? "SUCCESS",
          );
        }
    }else{
      PrintLog.printLog(
          "delete Favorite Datasource response: ${statusMessage ?? "Unknown Error"}");
      return null;
    } catch (e) {
      PrintLog.printLog(
          "delete Favorite Datasource response: $e");
          return null;
    }
  }
}

Future<FavoritesResponsesModelSearch?> searchFavorite(int favoriteId) async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.favByIdGetEndpoint(favoriteId),
      method: HttpMethods.get,
      useAuth: true,
    );

    if (response['statusCode'] == 200) {
      PrintLog.printLog("searchFavorite Datasource response: ${response}");
      return FavoritesResponsesModelSearch.fromJson(response['data']);
    } else {
      PrintLog.printLog(
          "searchFavorite Datasource response: ${response['statusMessage']}");
      return null;
    }
  } catch (e) {
    throw Exception('Failed to load search Favorite');
  }
}


   
