// To parse this JSON data, do
//
//     final openStreetMapResponse = openStreetMapResponseFromJson(jsonString);

import 'dart:convert';

OpenStreetMapResponse openStreetMapResponseFromJson(String str) => OpenStreetMapResponse.fromJson(json.decode(str));

String openStreetMapResponseToJson(OpenStreetMapResponse data) => json.encode(data.toJson());

class OpenStreetMapResponse {
  OpenStreetMapResponse({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.placeRank,
    this.category,
    this.type,
    this.importance,
    this.addresstype,
    this.name,
    this.displayName,
    this.address,
    this.boundingbox,
  });

  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  int? placeRank;
  String? category;
  String? type;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;

  factory OpenStreetMapResponse.fromJson(Map<String, dynamic> json) => OpenStreetMapResponse(
    placeId: json["place_id"],
    licence: json["licence"],
    osmType: json["osm_type"],
    osmId: json["osm_id"],
    lat: json["lat"],
    lon: json["lon"],
    placeRank: json["place_rank"],
    category: json["category"],
    type: json["type"],
    importance: json["importance"]?.toDouble(),
    addresstype: json["addresstype"],
    name: json["name"],
    displayName: json["display_name"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    boundingbox: json["boundingbox"] == null ? [] : List<String>.from(json["boundingbox"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "place_id": placeId,
    "licence": licence,
    "osm_type": osmType,
    "osm_id": osmId,
    "lat": lat,
    "lon": lon,
    "place_rank": placeRank,
    "category": category,
    "type": type,
    "importance": importance,
    "addresstype": addresstype,
    "name": name,
    "display_name": displayName,
    "address": address?.toJson(),
    "boundingbox": boundingbox == null ? [] : List<dynamic>.from(boundingbox!.map((x) => x)),
  };
}

class Address {
  Address({
    this.building,
    this.houseNumber,
    this.road,
    this.cityBlock,
    this.village,
    this.suburb,
    this.cityDistrict,
    this.city,
    this.iso31662Lvl4,
    this.postcode,
    this.country,
    this.countryCode,
  });

  String? building;
  String? houseNumber;
  String? road;
  String? cityBlock;
  String? village;
  String? suburb;
  String? cityDistrict;
  String? city;
  String? iso31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    building: json["building"],
    houseNumber: json["house_number"],
    road: json["road"],
    cityBlock: json["city_block"],
    village: json["village"],
    suburb: json["suburb"],
    cityDistrict: json["city_district"],
    city: json["city"],
    iso31662Lvl4: json["ISO3166-2-lvl4"],
    postcode: json["postcode"],
    country: json["country"],
    countryCode: json["country_code"],
  );

  Map<String, dynamic> toJson() => {
    "building": building,
    "house_number": houseNumber,
    "road": road,
    "city_block": cityBlock,
    "village": village,
    "suburb": suburb,
    "city_district": cityDistrict,
    "city": city,
    "ISO3166-2-lvl4": iso31662Lvl4,
    "postcode": postcode,
    "country": country,
    "country_code": countryCode,
  };
}
