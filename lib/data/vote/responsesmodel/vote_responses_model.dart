// To parse this JSON data, do
//
//     final voteResponsesModelSearch = voteResponsesModelSearchFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VoteResponsesModelSearch voteResponsesModelSearchFromJson(String str) =>
    VoteResponsesModelSearch.fromJson(json.decode(str));

String voteResponsesModelSearchToJson(VoteResponsesModelSearch data) =>
    json.encode(data.toJson());

class VoteResponsesModelSearch {
  final int id;
  final String userId;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final int value;
  final String countryCode;
  final Image image;

  VoteResponsesModelSearch({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.value,
    required this.countryCode,
    required this.image,
  });

  factory VoteResponsesModelSearch.fromJson(Map<String, dynamic> json) =>
      VoteResponsesModelSearch(
        id: json["id"],
        userId: json["user_id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        value: json["value"],
        countryCode: json["country_code"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_id": imageId,
        "sub_id": subId,
        "created_at": createdAt.toIso8601String(),
        "value": value,
        "country_code": countryCode,
        "image": image.toJson(),
      };
}

class Image {
  Image();

  factory Image.fromJson(Map<String, dynamic> json) => Image();

  Map<String, dynamic> toJson() => {};
}
