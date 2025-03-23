import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' as http;
import 'package:mime/mime.dart';

class CompanyRegisterModel {
  factory CompanyRegisterModel.empty() {
    return CompanyRegisterModel(
      companySize: 0,
      name: '',
      username: '',
      email: '',
      password: '',
      image: null,
      phoneNumber: '',
      websiteUrl: '',
      facebookUrl: '',
      linkedInUrl: '',
      addresses: [],
      scope: [],
      nationalityId: null,
    );
  }
  factory CompanyRegisterModel.fromJson(Map<String, dynamic> json) {
    return CompanyRegisterModel(
      companySize: json["CompanySize"],
      name: json["name"],
      username: json["Username"],
      email: json["Email"],
      password: json["Password"],
      image: json["Image"],
      phoneNumber: json["PhoneNumber"],
      websiteUrl: json["WebsiteUrl"],
      facebookUrl: json["FacebookUrl"],
      linkedInUrl: json["LinkedInUrl"],
      addresses: json["Addresses"] == null
          ? []
          : List<AddresssModel>.from(
              json["Addresses"]!.map((x) => AddresssModel.fromJson(x))),
      scope: json["Scope"] == null
          ? []
          : List<String>.from(json["Scope"]!.map((x) => x)),
      nationalityId: json["NationalityId"],
    );
  }
  CompanyRegisterModel({
    required this.companySize,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.image,
    required this.phoneNumber,
    required this.websiteUrl,
    required this.facebookUrl,
    required this.linkedInUrl,
    required this.addresses,
    required this.scope,
    required this.nationalityId,
  });

  num? companySize;
  String? name;
  String? username;
  String? email;
  String? password;
  File? image;
  String? phoneNumber;
  String? websiteUrl;
  String? facebookUrl;
  String? linkedInUrl;
  List<AddresssModel> addresses;
  List<String> scope;
  int? nationalityId;

  CompanyRegisterModel copyWith({
    num? companySize,
    String? name,
    String? username,
    String? email,
    String? password,
    File? image,
    String? phoneNumber,
    String? websiteUrl,
    String? facebookUrl,
    String? linkedInUrl,
    List<AddresssModel>? addresses,
    List<String>? scope,
    int? nationalityId,
  }) {
    return CompanyRegisterModel(
      companySize: companySize ?? this.companySize,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      linkedInUrl: linkedInUrl ?? this.linkedInUrl,
      addresses: addresses ?? this.addresses,
      scope: scope ?? this.scope,
      nationalityId: nationalityId ?? this.nationalityId,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    // Check if the image path is valid
    if (image == null || !await File(image!.path).exists()) {
      throw Exception("Image file does not exist.");
    }

    // Use mime package to get the correct content type
    String? mimeType = lookupMimeType(image!.path);
    if (mimeType == null) {
      throw Exception("Could not determine the MIME type.");
    }

    var file = await MultipartFile.fromFile(
      image!.path,
      filename: image!.path.split("/").last,
      contentType:
          http.MediaType.parse(mimeType), // Set the correct content type
    );

    return {
      "CompanySize": companySize,
      "name": name,
      "Username": username,
      "Email": email,
      "Password": password,
      "Image": file,
      "PhoneNumber": phoneNumber,
      "WebsiteUrl": websiteUrl,
      "FacebookUrl": facebookUrl,
      "LinkedInUrl": linkedInUrl,
      "Addresses": addresses.map((x) => x.toJson()).toList(),
      "Scope": scope.map((x) => x).toList(),
      "NationalityId": nationalityId,
    };
  }

  @override
  String toString() {
    return "  companySize: $companySize,NAme  $name, UserName $username, Email $email,Password $password,Image $image,phone $phoneNumber, website $websiteUrl, facebook $facebookUrl, linkedin $linkedInUrl, addresses $addresses, scope $scope, NationalityId $nationalityId, ";
  }
}

class AddresssModel {
  factory AddresssModel.fromJson(Map<String, dynamic> json) {
    return AddresssModel(
      governorateId: json["governorateId"],
      areaId: json["areaId"],
      streetAddress: json["streetAddress"],
      isDefault: json["isDefault"],
    );
  }
  AddresssModel({
    required this.governorateId,
    required this.areaId,
    required this.streetAddress,
    required this.isDefault,
  });

  final num? governorateId;
  final num? areaId;
  final String? streetAddress;
  final bool? isDefault;

  AddresssModel copyWith({
    num? governorateId,
    num? areaId,
    String? streetAddress,
    bool? isDefault,
  }) {
    return AddresssModel(
      governorateId: governorateId ?? this.governorateId,
      areaId: areaId ?? this.areaId,
      streetAddress: streetAddress ?? this.streetAddress,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toJson() => {
        "governorateId": governorateId,
        "areaId": areaId,
        "streetAddress": streetAddress,
        "isDefault": isDefault,
      };

  @override
  String toString() {
    return "$governorateId, $areaId, $streetAddress, $isDefault, ";
  }
}
