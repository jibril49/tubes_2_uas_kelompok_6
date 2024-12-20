// To parse this JSON data, do
//
//     final voteResponsesModelGet = voteResponsesModelGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<VoteResponsesModelGet> voteResponsesModelGetFromJson(String str) =>
    List<VoteResponsesModelGet>.from(
        json.decode(str).map((x) => VoteResponsesModelGet.fromJson(x)));

String voteResponsesModelGetToJson(List<VoteResponsesModelGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoteResponsesModelGet {
  final int id;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final int value;
  final String countryCode;
  final Image image;

  VoteResponsesModelGet({
    required this.id,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.value,
    required this.countryCode,
    required this.image,
  });

  factory VoteResponsesModelGet.fromJson(Map<String, dynamic> json) =>
      VoteResponsesModelGet(
        id: json["id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        value: json["value"],
        countryCode: json["country_code"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
