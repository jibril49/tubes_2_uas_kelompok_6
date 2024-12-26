import 'package:tubes2_uas_kelompok_6/core/api_services/dio_module.dart';
import 'package:tubes2_uas_kelompok_6/core/api_services/endpoint.dart';
import 'package:tubes2_uas_kelompok_6/core/utils/print_log.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/requestsmodel/vote_requests_model.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/responsesmodel/vote_responses_model.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/responsesmodel/vote_responses_model_delete.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/responsesmodel/vote_responses_model_get.dart';
import 'package:tubes2_uas_kelompok_6/data/vote/responsesmodel/vote_responses_model_post.dart';

class VoteDatasource {
  final HttpManager _httpManager = HttpManager();

  // Get votes
  Future<List<VoteResponsesModelGet>> getVote() async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );

      PrintLog.printLog("get Vote Datasource response: $response");

      if (response['statusCode'] == 200 && response.containsKey('data')) {
        final List<dynamic> data = response['data'];

        return data.map((item) {
          if (item['image'] == null || item['image'].isEmpty) {
            item['image'] = {
              'id': '',
              'url': '',
            };
          }
          return VoteResponsesModelGet.fromJson(item);
        }).toList();
      } else {
        throw Exception('Failed to load votes: Invalid format');
      }
    } catch (e) {
      throw Exception('Failed to load votes: $e');
    }
  }

  // Create a new favorite
  Future<VoteResponsesModelPost?> createFavorite(VoteRequestsModel data) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.votePostEndpoint, // Corrected endpoint for POST
        method: HttpMethods.post,
        body: data.toJson(),
        useAuth: true,
      );

      final statusCode = response['statusCode'];
      final statusMessage = response['statusMessage'];

      if (statusCode == 200 || statusCode == 201) {
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return VoteResponsesModelPost.fromJson(response['data']);
        } else {
          throw Exception('Invalid data format for createFavorite');
        }
      } else {
        throw Exception('Failed to create favorite: $statusMessage');
      }
    } catch (e) {
      throw Exception('Failed to create favorite: $e');
    }
  }

  // Delete a vote
  Future<VoteResponsesModelDelete?> deleteVote(int voteId) async {
    try {
      final response = await _httpManager.restRequest(
        url: '${ApiConstants.voteDeleteEndpoint}/$voteId',
        method: HttpMethods.delete,
        useAuth: true,
      );

      if (response['statusCode'] == 200 || response['statusCode'] == 204) {
        return VoteResponsesModelDelete.fromJson(response);
      } else {
        throw Exception('Failed to delete vote');
      }
    } catch (e) {
      throw Exception('Failed to delete vote: $e');
    }
  }

  // Search a vote by ID
  Future<VoteResponsesModelGet?> searchVote(int voteId) async {
    try {
      final response = await _httpManager.restRequest(
        url: '${ApiConstants.voteSearchEndpoint}/$voteId',
        method: HttpMethods.get,
        useAuth: true,
      );

      if (response['statusCode'] == 200 && response.containsKey('data')) {
        return VoteResponsesModelGet.fromJson(response['data']);
      } else {
        throw Exception('Failed to find vote');
      }
    } catch (e) {
      throw Exception('Failed to search vote: $e');
    }
  }
}
