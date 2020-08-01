// To parse this JSON data, do
//
//     final pet = petFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

class Test {

  Future getData() async {
    http
        .get('https://petstore.swagger.io/v2/pet/findByStatus?status=sold')
        .then((res) {
          final pet = petFromJson(res.body.toString());
          })
        .catchError((onError)=>print(onError));
  }
  
}

List<Pet> petFromJson(String str) =>
    List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String petToJson(List<Pet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  Pet({
    this.id,
    this.category,
    this.name,
    this.photoUrls,
    this.tags,
    this.status,
  });

  double id;
  Category category;
  String name;
  List<String> photoUrls;
  List<Category> tags;
  Status status;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"].toDouble(),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        name: json["name"],
        photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
        tags:
            List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
        status: statusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category == null ? null : category.toJson(),
        "name": name,
        "photoUrls": List<dynamic>.from(photoUrls.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "status": statusValues.reverse[status],
      };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

enum Status { SOLD }

final statusValues = EnumValues({"sold": Status.SOLD});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
