import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tubes_2_uas_kelompok_6/core/global_component/searchview.dart';
import 'package:tubes_2_uas_kelompok_6/features/vote/widgets/vote_cardview.dart';
import 'package:tubes_2_uas_kelompok_6/features/vote/controller/vote_controller.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VoteController controller = Get.put(VoteController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              _buildHeader(),
              SearchViewWidget(
                hintText: 'Search Vote', // Perbaiki typo hinText -> hintText
                onSearch: (value) {
                  controller.searchVote(value); // Panggil searchVote dengan parameter value
                },
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.searchResult.isEmpty) {
                    return const Center(child: Text('No favorites found.'));
                  } else {
                    return _buildVoteList(controller);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.fetchVote();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kucing Vote',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your vote list cat',
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyVoteList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite_border,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 16),
          Text(
            'No vote cat found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Refresh'),
          )
        ],
      ),
    );
  }

  // Pastikan parameter `onDeleted` sudah diteruskan dengan benar
  Widget _buildVoteList(VoteController controller) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.searchResult.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final vote = controller.searchResult[index];
          return VoteCardview(
            vote: vote,
            onDelete: () {
              controller.deleteVote(vote.id);  // Pastikan fungsi deleteVote ada di controller
            },
          );
        },
      ),
    );
  }
}
