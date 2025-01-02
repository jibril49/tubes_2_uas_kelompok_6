<<<<<<< HEAD
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
=======

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.
import 'package:get/get.dart';
import 'package:tubes2_uas_kelompok0/features/home/controller/home_controller

class HomeScreen extends Statelesswidget {
  const HomeScreen({super.key});

  @override
  widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: safeArea(
        child: Container(
          color: colors.blue,
          child: Column(
            crossAxisALignment: CrossAxisALignment.start,
            children: [
              buildHeaderSection(),
              Expanded(
                child: Obx(() => controller.images.isNotEmpty ?
                  buildImagesLIst(controller) : buildLoading()), // obx
              ),   // Expanded

          ),
        ), // Column
      ), // Container
    ); // SafeArea
  }; // Scaffold
}
    
widget _buildHeaderSection() {
  return Padding(
  padding: const EdgeInsets.symetric(horizontal: 20, vertical: 10),
  child: Column(
  crossAxisALignment: CrossAxisALignment.start,
   children: [
    Text(
      "Halo, Kucing Lovers!",
      style: const TextStyle(
        color: Colors.blue,
        fontsize : 30,
        fontweight: Fontweight.bold,
      ), //TextStyle
    ), // Text
    const SizeBod(height: 10,),
     Text(
      "Temukan Kucing lucu untuk dijadikan walpaper!",
      style: const TextStyle(
        color: Colors.blue,
        fontsize: 30,
        fontweight: Fontweight.bold,
      ), // TextStyle
     ), // Text
  ), 
  ), // Column
  ); // Padding
}

 widget _buildImagesLIst(HomeController controller) {
    return ListView.builder(
      itemCount: controller.images.length,
      itemBuilder: (context), index) {
        final image = controller.images[index];
        return HomeCard(
          image: image,
          onFavoritePressed: () => controller.onFavoritePressed(image.id),
          onlikePressed: () => controller.onlikePressed(image.id),
        ); // HomeCard
      ); 
    ); // ListView.builder
   }

 widget _buildLoading() {
  return const Center(
    child: CircularProgresIndicator(),
  ); // center
 }
}   
>>>>>>> 2a972fd9ad0da2173eafc31a4ac7d6dcdefaa7f6
