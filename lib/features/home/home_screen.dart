import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes2_uas_kelompok_6/features/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderSection(), // The method 'buildHeaderSection' isn't defined
              Expanded(
                child: Obx(() => controller.images.isNotEmpty
                    ? buildImageList(controller) // The method 'buildImageList' isn't defined
                    : buildLoading()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Haiiiiii, Kucing Lovers!",
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          "Temukan Kucing-Kucing lucu di sini untuk dijadikan peliharaan kesayanganmu ya love:)",
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
Widget buildImageList(HomeController controller) {
  return ListView.builder(
    itemCount: controller.images.length,
    itemBuilder: (context, index) {
      final image = controller.images[index];
      return HomeCard(
        image: image,
        onFavoritePressed: () => controller.onFavoritePressed(image.id),
        onLikePressed: () => controller.onLikePressed(image.id),
      );
    },
  );
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
}