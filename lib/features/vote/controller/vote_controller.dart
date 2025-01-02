import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:tubes_2_uas_kelompok_6/core/utils/print_log.dart'; 

     
class VoteResponsesModel {
  final int id;
  final String name;

  VoteResponsesModel({required this.id, required this.name});
}

class VoteController extends GetxController {
  RxList<VoteResponsesModel> vote = <VoteResponsesModel>[].obs;
  RxList<VoteResponsesModel> searchResult = <VoteResponsesModel>[].obs;
  RxBool isLoading = false.obs;
   
  @override
  void onInit() {
    super.onInit();
    fetchVote();
  }   

  // Fungsi untuk mengambil data vote
  Future<void> fetchVote() async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 1)); // Simulasi pengambilan data
      vote.value = [
        VoteResponsesModel(id: 1, name: "Vote 1"),
        VoteResponsesModel(id: 2, name: "Vote 2"),
        VoteResponsesModel(id: 3, name: "Vote 3"),
      ];
      printLog("Data fetched successfully.");
    } catch (e) {
      printLog("Error fetching vote: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk mencari vote berdasarkan query
  void searchVote(String query) {
    if (query.isEmpty) {
      searchResult.value = List<VoteResponsesModel>.from(vote);
    } else {
      searchResult.value = vote
          .where((element) => element.id.toString().contains(query))
          .toList();
    }
  }

  // Fungsi untuk menghapus vote berdasarkan id
  Future<void> deleteVote(int id) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)); // Simulasi penghapusan data
      vote.removeWhere((element) => element.id == id);
      searchResult.removeWhere((element) => element.id == id);
      printLog("Vote with id $id deleted successfully.");
    } catch (e) {
      printLog("Error deleting vote: $e");
    }
  }
}
