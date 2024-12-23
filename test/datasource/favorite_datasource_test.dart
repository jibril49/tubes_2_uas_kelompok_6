import 'package:flutter_test/flutter_test.dart';
import 'package:tubes_2_uas_kelompok_6/data/favorite/datasource/breeds_datasource.dart';
import 'tubes_2_uas_kelompok_6/data/favorite/datasource/favorite_datasource.dart';

void main() {
  group('Favorite Datasource test', () {
    late FavoriteDatasource favoriteDatasource;

    setUp(() {
      favoriteDatasource = FavoriteDatasource();
    });

    test('get Favorite return correct data when successfully', () async {
      final response = await favoriteDatasource.getFavorite();

      expect(response.length, greaterThan(0));
      expect(response[0].id, isNotNull);
    });

    test('create Favorite return correct data when successfully', () async {
      final favoriteReqModel = FavoriteRequestsModelPost(
        imageId: 'a2s',
        subId: 'test_i1'
        );
      final response = await favoriteDatasource.createFavorite();
      if (response != null){
        expect(response.length, equals("SUCCESS"));

      }else{
        fail('response isNull');
      }          
    });

    test('search Favorite return correct data when successfully', () async {
      final favoriteId = 232501209;
      final response = await favoriteDatasource.searchFavorite(favoriteId);
      if (response != null){
        expect(response.id, equals(favoriteId));

      }else{
        fail('response isNull');
      }          
    });

    test('Delete Favorite return correct data when successfully', () async {
      final favoriteId = 232501209;
      final response = await favoriteDatasource.DeleteFavorite(favoriteId);

      expect(response?message, equals('SUCCESS'));        
    });

  });
}
