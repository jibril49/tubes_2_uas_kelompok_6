import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes_2_uas_kelompok_6/core/global_component/searchview.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final FavoriteController controller = Get.put(FavoriteController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              _buildHeader(),
              SearchViewWidget(
                hintText: 'Search Favorite',
                onChanged: (value) {
                  //controller.searchFavorite;
                },
              ),
              Expanded(
                child: 0bx(() {
                  if (controller.siLoading.value) {
                    return _buildLoading();
                  } else if (controller.serachResult.isEmpty) {
                    return _buildEmptyFavorites(controller);
                  } else {
                    return _buildFavoriteList(controller);
                  }
                })
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //await controller.fetchFavorite();
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
            'Kucing Favorite',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ),
          ),
          SizedBox(height : 8),
          Text(
            'Your Favorite List Cat',
            style: TextStyle(
              fontSize: 16,
              color : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyFavorites(FavoriteController controller) {
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
            'No Favorite Cat Found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              controller.fetchFavorite();
            },
            child: const Text('Refresh'),
          )
        ],
      ),
    );
  }

  Widget _buildFavoriteList(FavoriteController controller) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.searchResult.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final favorite = controller.searchResult[index];
          return FavoriteCard(
            favorite: favorite,
            onDeleted: () {
              //controller.deleteFavorite(favorite.id);
            },
          );
        },
      ),
    );
  }
}