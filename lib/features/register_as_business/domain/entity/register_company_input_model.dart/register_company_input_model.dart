import 'dart:io';

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
      nationalityId: '',
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
          : List<CompanyAddresss>.from(
              json["Addresses"]!.map((x) => CompanyAddresss.fromJson(x))),
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
  List<CompanyAddresss> addresses;
  List<String> scope;
  String? nationalityId;

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
    List<CompanyAddresss>? addresses,
    List<String>? scope,
    String? nationalityId,
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

  Map<String, dynamic> toJson() => {
        "CompanySize": companySize,
        "name": name,
        "Username": username,
        "Email": email,
        "Password": password,
        "Image": image,
        "PhoneNumber": phoneNumber,
        "WebsiteUrl": websiteUrl,
        "FacebookUrl": facebookUrl,
        "LinkedInUrl": linkedInUrl,
        "Addresses": addresses.map((x) => x.toJson()).toList(),
        "Scope": scope.map((x) => x).toList(),
        "NationalityId": nationalityId,
      };

  @override
  String toString() {
    return "$companySize, $name, $username, $email, $password, $image, $phoneNumber, $websiteUrl, $facebookUrl, $linkedInUrl, $addresses, $scope, $nationalityId, ";
  }
}

class CompanyAddresss {
  factory CompanyAddresss.fromJson(Map<String, dynamic> json) {
    return CompanyAddresss(
      governorateId: json["governorateId"],
      areaId: json["areaId"],
      streetAddress: json["streetAddress"],
      isDefault: json["isDefault"],
    );
  }
  CompanyAddresss({
    required this.governorateId,
    required this.areaId,
    required this.streetAddress,
    required this.isDefault,
  });

  final num? governorateId;
  final num? areaId;
  final String? streetAddress;
  final bool? isDefault;

  CompanyAddresss copyWith({
    num? governorateId,
    num? areaId,
    String? streetAddress,
    bool? isDefault,
  }) {
    return CompanyAddresss(
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
