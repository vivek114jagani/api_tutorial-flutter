// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  List<Country> country;
  String name;

  UserDataModel({
    required this.country,
    required this.name,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        country:
            List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
        "name": name,
      };
}

class Country {
  String countryId;
  double probability;

  Country({
    required this.countryId,
    required this.probability,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        probability: json["probability"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "probability": probability,
      };
}
