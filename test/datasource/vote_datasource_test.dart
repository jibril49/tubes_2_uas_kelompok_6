import 'package:flutter_test/flutter_test.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/datasource/vote_datasource.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/requestsmodel/vote_requests_model.dart';

void main() {
  group('Vote Datasource Test', () {
    late VoteDatasource voteDatasource;

    // Setup before each test
    setUp(() {
      voteDatasource = VoteDatasource();
    });

    test('get Vote returns correct data when successful', () async {
      final response = await voteDatasource.getVote();

      // Assert response is not empty
      expect(response.length, greaterThan(0));
      // Assert first item has a valid ID
      expect(response[0].id, isNotNull);
    });

    test('create Vote returns correct data when successful', () async {
      final voteReqModel = VoteRequestsModel(
        imageId: 'abys',
        subId: 'manarnuha',
        value: 1,
      );

      final response = await voteDatasource.createFavorite(voteReqModel);

      // Assert response is not null and has a success message
      if (response != null) {
        expect(response.message, equals('SUCCESS'));
      } else {
        fail('response is null');
      }
    });

    test('deleteVote returns correct data when successful', () async {
      // Arrange
      const voteId = 1222371;

      // Act
      final response = await voteDatasource.deleteVote(voteId);

      // Assert response has a success message
      expect(response?.message, equals("SUCCESS"));
    });

    test('search Vote returns correct data when successful', () async {
      // Arrange
      const voteId = 1222371;

      // Act
      final response = await voteDatasource.searchVote(voteId);

      // Assert response has the correct vote ID
      if (response != null) {
        expect(response.id, equals(voteId));
      } else {
        fail('response is null');
      }
    });
  });
}
