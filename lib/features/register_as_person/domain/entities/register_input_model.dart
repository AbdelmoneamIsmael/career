import 'dart:io';

import 'package:career/core/const/enums.dart';

class RegisterModel {
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      address: json["address"],
      email: json["email"],
      fullName: json["FullName"],
      jopName: json["jopName"],
      dateOfBirth: json["dateOfBirth"],
      gender: json["gender"],
      nationality: json["nationality"],
      currentlyAt: json["currentlyAt"],
      city: json["city"],
      state: json["state"],
      area: json["area"],
      phone: json["phone"],
      yearsOfExperiance: json["yearsOfExperiance"],
      languageOfCv: json["languageOfCv"],
      cv: json["cv"],
      profileImage: json["profileImage"],
      studies: json["studies"] == null
          ? []
          : List<Study>.from(json["studies"]!.map((x) => Study.fromJson(x))),
      work: json["work"] == null
          ? []
          : List<Work>.from(json["work"]!.map((x) => Work.fromJson(x))),
      certifications: json["certifications"] == null
          ? []
          : List<Certification>.from(
              json["certifications"]!.map((x) => Certification.fromJson(x))),
      skills: json["skills"] == null
          ? []
          : List<String>.from(json["skills"]!.map((x) => x)),
      language: json["language"] == null
          ? []
          : List<String>.from(json["language"]!.map((x) => x)),
      password: json["password"],

    );
  }
  factory RegisterModel.empty() {
    return RegisterModel(
      password: "",
      
      email: '',
      fullName: '',
      jopName: '',
      dateOfBirth: DateTime(1997),
      gender: Gender.male,
      nationality: '',
      currentlyAt: '',
      city: '',
      state: '',
      area: '',
      phone: '',
      yearsOfExperiance: 0,
      languageOfCv: '',
      cv: null,
      profileImage: null,
      studies: [],
      work: [],
      certifications: [],
      skills: [],
      language: [],
      address: "",
    );
  }
  RegisterModel({
    required this.email,
    required this.fullName,
      required this.address,
    required this.jopName,
    required this.dateOfBirth,
    required this.gender,
    required this.nationality,
    required this.currentlyAt,
    required this.city,
    required this.state,
    required this.area,
    required this.phone,
    required this.yearsOfExperiance,
    required this.languageOfCv,
    required this.cv,
    required this.profileImage,
    required this.studies,
    required this.work,
    required this.certifications,
    required this.skills,
    required this.language,
    required this.password,
  });

  String? fullName;
  String? jopName;
  String? password;
  DateTime? dateOfBirth;
  Gender? gender;
  String? nationality;
  String? currentlyAt;
  String? city;
  String? state;
  String? area;
  String? phone;
  int? yearsOfExperiance;
  String? languageOfCv;
  String? email;
  File? cv;
  String? address;
  File? profileImage;
  List<Study> studies;
  List<Work> work;
  List<Certification> certifications;
  List<String> skills;
  List<String> language;
}

class Certification {
  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: json["name"],
      given: json["given"],
      at: json["at"],
      describ: json["describ"],
    );
  }
  Certification({
    required this.name,
    required this.given,
    required this.at,
    required this.describ,
  });

  final String? name;
  final String? given;
  final String? at;
  final String? describ;
}

class Study {
  factory Study.fromJson(Map<String, dynamic> json) {
    return Study(
      degree: json["degree"],
      uni: json["uni"],
      degreet: json["degreet"],
      department: json["department"],
    );
  }
  Study({
    required this.degree,
    required this.uni,
    required this.degreet,
    required this.department,
  });

  final String? degree;
  final String? uni;
  final String? degreet;
  final String? department;
}

class Work {
  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      jopTitle: json["jopTitle"],
      discrib: json["discrib"],
      location: json["location"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      now: json["now"],
      companyName: json["companyName"],
    );
  }
  Work({
    required this.jopTitle,
    required this.discrib,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.now,
    required this.companyName,
  });

  final String? jopTitle;
  final String? discrib;
  final String? location;
  final String? startDate;
  final String? endDate;
  final bool? now;
  final String? companyName;
}
