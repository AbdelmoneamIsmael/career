import 'dart:io';

import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';

class RegisterModel {
  factory RegisterModel.empty() {
    return RegisterModel(
      name: "",
      username: "",
      email: "",
      password: "",
      image: null,
      jopName: "",
      dateOfBirth: DateTime(1997),
      gender: 1,
      nationalityId: 1,
      scope: [],
      currentlyAt: "",
      phoneNumber: "",
      websiteUrl: "",
      facebookUrl: "",
      linkedInUrl: "",
      addresses: [],
      yearOfExperiance: 5,
      cvLanguage: "",
      cvFile: null,
      experiences: [],
      certificationRequests: [],
      skills: [],
      languages: [],
      studies: [],
    );
  }
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json["Name"],
      username: json["Username"],
      email: json["Email"],
      password: json["Password"],
      image: json["Image"],
      jopName: json["JopName"],
      dateOfBirth: DateTime.tryParse(json["DateOfBirth"] ?? ""),
      gender: json["Gender"],
      nationalityId: json["NationalityId"],
      scope: json["Scope"] == null
          ? []
          : List<String>.from(json["Scope"]!.map((x) => x)),
      currentlyAt: json["CurrentlyAt"],
      phoneNumber: json["PhoneNumber"],
      websiteUrl: json["WebsiteUrl"],
      facebookUrl: json["FacebookUrl"],
      linkedInUrl: json["LinkedInUrl"],
      addresses: json["Addresses"] == null
          ? []
          : List<AddresssModel>.from(
              json["Addresses"]!.map((x) => AddresssModel.fromJson(x))),
      yearOfExperiance: json["YearOfExperiance"],
      cvLanguage: json["CvLanguage"],
      cvFile: json["CvFile"],
      experiences: json["Experiences"] == null
          ? []
          : List<Experience>.from(
              json["Experiences"]!.map((x) => Experience.fromJson(x))),
      certificationRequests: json["CertificationRequests"] == null
          ? []
          : List<CertificationRequest>.from(json["CertificationRequests"]!
              .map((x) => CertificationRequest.fromJson(x))),
      skills: json["Skills"] == null
          ? []
          : List<int>.from(json["Skills"]!.map((x) => x)),
      languages: json["Languages"] == null
          ? []
          : List<String>.from(json["Languages"]!.map((x) => x)),
      studies: json["Studies"] == null
          ? []
          : List<Study>.from(json["Studies"]!.map((x) => Study.fromJson(x))),
    );
  }
  RegisterModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.image,
    required this.jopName,
    required this.dateOfBirth,
    required this.gender,
    required this.nationalityId,
    required this.scope,
    required this.currentlyAt,
    required this.phoneNumber,
    required this.websiteUrl,
    required this.facebookUrl,
    required this.linkedInUrl,
    required this.addresses,
    required this.yearOfExperiance,
    required this.cvLanguage,
    required this.cvFile,
    required this.experiences,
    required this.certificationRequests,
    required this.skills,
    required this.languages,
    required this.studies,
  });

  String? username;
  String? email;
  String? password;
  String? name;
  File? image;
  String? jopName;
  DateTime? dateOfBirth;
  num? gender;
  int? nationalityId;
  List<String> scope;
  String? currentlyAt;
  String? phoneNumber;
  String? websiteUrl;
  String? facebookUrl;
  String? linkedInUrl;
  List<AddresssModel> addresses;
  num? yearOfExperiance;
  String? cvLanguage;
  File? cvFile;
  List<Experience> experiences;
  List<CertificationRequest> certificationRequests;
  List<int> skills;
  List<String> languages;
  List<Study> studies;

  RegisterModel copyWith({
    String? name,
    String? username,
    String? email,
    String? password,
    File? image,
    String? jopName,
    DateTime? dateOfBirth,
    num? gender,
    int? nationalityId,
    List<String>? scope,
    String? currentlyAt,
    String? phoneNumber,
    String? websiteUrl,
    String? facebookUrl,
    String? linkedInUrl,
    List<AddresssModel>? addresses,
    num? yearOfExperiance,
    String? cvLanguage,
    File? cvFile,
    List<Experience>? experiences,
    List<CertificationRequest>? certificationRequests,
    List<int>? skills,
    List<String>? languages,
    List<Study>? studies,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
      jopName: jopName ?? this.jopName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      nationalityId: nationalityId ?? this.nationalityId,
      scope: scope ?? this.scope,
      currentlyAt: currentlyAt ?? this.currentlyAt,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      linkedInUrl: linkedInUrl ?? this.linkedInUrl,
      addresses: addresses ?? this.addresses,
      yearOfExperiance: yearOfExperiance ?? this.yearOfExperiance,
      cvLanguage: cvLanguage ?? this.cvLanguage,
      cvFile: cvFile ?? this.cvFile,
      experiences: experiences ?? this.experiences,
      certificationRequests:
          certificationRequests ?? this.certificationRequests,
      skills: skills ?? this.skills,
      languages: languages ?? this.languages,
      studies: studies ?? this.studies,
    );
  }

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Username": username,
        "Email": email,
        "Password": password,
        "Image": image,
        "JopName": jopName,
        "DateOfBirth": dateOfBirth?.toIso8601String(),
        "Gender": gender,
        "NationalityId": nationalityId,
        "Scope": scope.map((x) => x).toList(),
        "CurrentlyAt": currentlyAt,
        "PhoneNumber": phoneNumber,
        "WebsiteUrl": websiteUrl,
        "FacebookUrl": facebookUrl,
        "LinkedInUrl": linkedInUrl,
        "Addresses": addresses.map((x) => x.toJson()).toList(),
        "YearOfExperiance": yearOfExperiance,
        "CvLanguage": cvLanguage,
        "CvFile": cvFile,
        "Experiences": experiences.map((x) => x.toJson()).toList(),
        "CertificationRequests":
            certificationRequests.map((x) => x.toJson()).toList(),
        "Skills": skills.map((x) => x).toList(),
        "Languages": languages.map((x) => x).toList(),
        "Studies": studies.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$name, $username, $email, $password, $image, $jopName, $dateOfBirth, $gender, $nationalityId, $scope, $currentlyAt, $phoneNumber, $websiteUrl, $facebookUrl, $linkedInUrl, $addresses, $yearOfExperiance, $cvLanguage, $cvFile, $experiences, $certificationRequests, $skills, $languages, $studies, ";
  }
}

class CertificationRequest {
  factory CertificationRequest.fromJson(Map<String, dynamic> json) {
    return CertificationRequest(
      name: json["name"],
      description: json["description"],
      given: json["given"],
      givenAt: DateTime.tryParse(json["givenAt"] ?? ""),
    );
  }
  CertificationRequest({
    required this.name,
    required this.given,
    required this.givenAt,
    required this.description,
  });
  final String? description;
  final String? name;
  final String? given;
  final DateTime? givenAt;

  CertificationRequest copyWith({
    String? name,
    String? given,
    DateTime? givenAt,
    String? description,
  }) {
    return CertificationRequest(
      description: description ?? this.description,
      name: name ?? this.name,
      given: given ?? this.given,
      givenAt: givenAt ?? this.givenAt,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "given": given,
        "givenAt": givenAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$name, $given, $givenAt, $description, ";
  }
}

class Experience {
  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      jopTitle: json["jopTitle"],
      description: json["description"],
      location: json["location"],
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      isWorkingNow: json["isWorkingNow"],
      companyName: json["companyName"],
    );
  }
  Experience({
    required this.jopTitle,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.isWorkingNow,
    required this.companyName,
  });

  final String? jopTitle;
  final String? description;
  final String? location;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isWorkingNow;
  final String? companyName;

  Experience copyWith({
    String? jopTitle,
    String? description,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    bool? isWorkingNow,
    String? companyName,
  }) {
    return Experience(
      jopTitle: jopTitle ?? this.jopTitle,
      description: description ?? this.description,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isWorkingNow: isWorkingNow ?? this.isWorkingNow,
      companyName: companyName ?? this.companyName,
    );
  }

  Map<String, dynamic> toJson() => {
        "jopTitle": jopTitle,
        "description": description,
        "location": location,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "isWorkingNow": isWorkingNow,
        "companyName": companyName,
      };

  @override
  String toString() {
    return "$jopTitle, $description, $location, $startDate, $endDate, $isWorkingNow, $companyName, ";
  }
}

class Study {
  factory Study.fromJson(Map<String, dynamic> json) {
    return Study(
      degree: json["degree"],
      university: json["university"],
      year: json["year"],
      department: json["department"],
    );
  }
  Study({
    required this.degree,
    required this.university,
    required this.year,
    required this.department,
  });

  final String? degree;
  final String? university;
  final DateTime? year;
  final String? department;

  Study copyWith({
    String? degree,
    String? university,
    DateTime? year,
    String? department,
  }) {
    return Study(
      degree: degree ?? this.degree,
      university: university ?? this.university,
      year: year ?? this.year,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "university": university,
        "year": year,
        "department": department,
      };

  @override
  String toString() {
    return "$degree, $university, $year, $department, ";
  }
}
