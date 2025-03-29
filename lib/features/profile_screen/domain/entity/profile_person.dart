class ProfilePersonModel {
  factory ProfilePersonModel.fromJson(Map<String, dynamic> json) {
    return ProfilePersonModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      imageUrl: json["imageUrl"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      cvFile: json["cvFile"],
      cvLanguage: json["cvLanguage"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      gender: json["gender"],
      currentlyAt: json["currentlyAt"],
      jopName: json["jopName"],
      yearOfExperiance: json["yearOfExperiance"],
      skills: json["skills"] == null
          ? []
          : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
      modifiedDate: DateTime.tryParse(json["modifiedDate"] ?? ""),
      websiteUrl: json["websiteUrl"],
      facebookUrl: json["facebookUrl"],
      linkedInUrl: json["linkedInUrl"],
      nationalityId: json["nationalityId"],
      nationalityName: json["nationalityName"],
      experiences: json["experiences"] == null
          ? []
          : List<Experience>.from(
              json["experiences"]!.map((x) => Experience.fromJson(x))),
      certifications: json["certifications"] == null
          ? []
          : List<Certification>.from(
              json["certifications"]!.map((x) => Certification.fromJson(x))),
      studies: json["studies"] == null
          ? []
          : List<Study>.from(json["studies"]!.map((x) => Study.fromJson(x))),
      addresses: json["addresses"] == null
          ? []
          : List<Address>.from(
              json["addresses"]!.map((x) => Address.fromJson(x))),
    );
  }
  ProfilePersonModel({
    required this.id,
    required this.name,
    required this.username,
    required this.imageUrl,
    required this.email,
    required this.phoneNumber,
    required this.cvFile,
    required this.cvLanguage,
    required this.dateOfBirth,
    required this.gender,
    required this.currentlyAt,
    required this.jopName,
    required this.yearOfExperiance,
    required this.skills,
    required this.languages,
    required this.createdDate,
    required this.modifiedDate,
    required this.websiteUrl,
    required this.facebookUrl,
    required this.linkedInUrl,
    required this.nationalityId,
    required this.nationalityName,
    required this.experiences,
    required this.certifications,
    required this.studies,
    required this.addresses,
  });

  final int? id;
  final String? name;
  final String? username;
  final String? imageUrl;
  final String? email;
  final String? phoneNumber;
  final String? cvFile;
  final String? cvLanguage;
  final DateTime? dateOfBirth;
  final num? gender;
  final String? currentlyAt;
  final String? jopName;
  final num? yearOfExperiance;
  final List<Skill> skills;
  final List<String> languages;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? websiteUrl;
  final String? facebookUrl;
  final String? linkedInUrl;
  final num? nationalityId;
  final String? nationalityName;
  final List<Experience> experiences;
  final List<Certification> certifications;
  final List<Study> studies;
  final List<Address> addresses;

  ProfilePersonModel copyWith({
    int? id,
    String? name,
    String? username,
    String? imageUrl,
    String? email,
    String? phoneNumber,
    String? cvFile,
    String? cvLanguage,
    DateTime? dateOfBirth,
    num? gender,
    String? currentlyAt,
    String? jopName,
    num? yearOfExperiance,
    List<Skill>? skills,
    List<String>? languages,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? websiteUrl,
    String? facebookUrl,
    String? linkedInUrl,
    num? nationalityId,
    String? nationalityName,
    List<Experience>? experiences,
    List<Certification>? certifications,
    List<Study>? studies,
    List<Address>? addresses,
  }) {
    return ProfilePersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      imageUrl: imageUrl ?? this.imageUrl,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cvFile: cvFile ?? this.cvFile,
      cvLanguage: cvLanguage ?? this.cvLanguage,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      currentlyAt: currentlyAt ?? this.currentlyAt,
      jopName: jopName ?? this.jopName,
      yearOfExperiance: yearOfExperiance ?? this.yearOfExperiance,
      skills: skills ?? this.skills,
      languages: languages ?? this.languages,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      linkedInUrl: linkedInUrl ?? this.linkedInUrl,
      nationalityId: nationalityId ?? this.nationalityId,
      nationalityName: nationalityName ?? this.nationalityName,
      experiences: experiences ?? this.experiences,
      certifications: certifications ?? this.certifications,
      studies: studies ?? this.studies,
      addresses: addresses ?? this.addresses,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "imageUrl": imageUrl,
        "email": email,
        "phoneNumber": phoneNumber,
        "cvFile": cvFile,
        "cvLanguage": cvLanguage,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "gender": gender,
        "currentlyAt": currentlyAt,
        "jopName": jopName,
        "yearOfExperiance": yearOfExperiance,
        "skills": skills.map((x) => x.toJson()).toList(),
        "languages": languages.map((x) => x).toList(),
        "createdDate": createdDate?.toIso8601String(),
        "modifiedDate": modifiedDate?.toIso8601String(),
        "websiteUrl": websiteUrl,
        "facebookUrl": facebookUrl,
        "linkedInUrl": linkedInUrl,
        "nationalityId": nationalityId,
        "nationalityName": nationalityName,
        "experiences": experiences.map((x) => x.toJson()).toList(),
        "certifications": certifications.map((x) => x.toJson()).toList(),
        "studies": studies.map((x) => x.toJson()).toList(),
        "addresses": addresses.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $username, $imageUrl, $email, $phoneNumber, $cvFile, $cvLanguage, $dateOfBirth, $gender, $currentlyAt, $jopName, $yearOfExperiance, $skills, $languages, $createdDate, $modifiedDate, $websiteUrl, $facebookUrl, $linkedInUrl, $nationalityId, $nationalityName, $experiences, $certifications, $studies, $addresses, ";
  }
}

class Address {
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      streetAddress: json["streetAddress"],
      areaId: json["areaId"],
      governorateId: json["governorateId"],
      userId: json["userId"],
      isDefault: json["isDefault"],
    );
  }
  Address({
    required this.id,
    required this.streetAddress,
    required this.areaId,
    required this.governorateId,
    required this.userId,
    required this.isDefault,
  });

  final int? id;
  final String? streetAddress;
  final num? areaId;
  final num? governorateId;
  final num? userId;
  final bool? isDefault;

  Address copyWith({
    int? id,
    String? streetAddress,
    num? areaId,
    num? governorateId,
    num? userId,
    bool? isDefault,
  }) {
    return Address(
      id: id ?? this.id,
      streetAddress: streetAddress ?? this.streetAddress,
      areaId: areaId ?? this.areaId,
      governorateId: governorateId ?? this.governorateId,
      userId: userId ?? this.userId,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "streetAddress": streetAddress,
        "areaId": areaId,
        "governorateId": governorateId,
        "userId": userId,
        "isDefault": isDefault,
      };

  @override
  String toString() {
    return "$id, $streetAddress, $areaId, $governorateId, $userId, $isDefault, ";
  }
}

class Certification {
  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      id: json["id"],
      name: json["name"],
      given: json["given"],
      givenAt: DateTime.tryParse(json["givenAt"] ?? ""),
      description: json["description"],
    );
  }
  Certification({
    required this.id,
    required this.name,
    required this.given,
    required this.givenAt,
    required this.description,
  });

  final int? id;
  final String? name;
  final String? given;
  final DateTime? givenAt;
  final String? description;

  Certification copyWith({
    int? id,
    String? name,
    String? given,
    DateTime? givenAt,
    String? description,
  }) {
    return Certification(
      id: id ?? this.id,
      name: name ?? this.name,
      given: given ?? this.given,
      givenAt: givenAt ?? this.givenAt,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "given": given,
        "givenAt": givenAt?.toIso8601String(),
        "description": description,
      };

  @override
  String toString() {
    return "$id, $name, $given, $givenAt, $description, ";
  }
}

class Experience {
  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json["id"],
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
    required this.id,
    required this.jopTitle,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.isWorkingNow,
    required this.companyName,
  });

  final int? id;
  final String? jopTitle;
  final String? description;
  final String? location;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isWorkingNow;
  final String? companyName;

  Experience copyWith({
    int? id,
    String? jopTitle,
    String? description,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    bool? isWorkingNow,
    String? companyName,
  }) {
    return Experience(
      id: id ?? this.id,
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
        "id": id,
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
    return "$id, $jopTitle, $description, $location, $startDate, $endDate, $isWorkingNow, $companyName, ";
  }
}

class Skill {
  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json["id"],
      name: json["name"],
    );
  }
  Skill({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  Skill copyWith({
    int? id,
    String? name,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return "$id, $name, ";
  }
}

class Study {
  factory Study.fromJson(Map<String, dynamic> json) {
    return Study(
      id: json["id"],
      degree: json["degree"],
      university: json["university"],
      year: DateTime.tryParse(json["year"] ?? ""),
      department: json["department"],
    );
  }
  Study({
    required this.id,
    required this.degree,
    required this.university,
    required this.year,
    required this.department,
  });

  final int? id;
  final String? degree;
  final String? university;
  final DateTime? year;
  final String? department;

  Study copyWith({
    int? id,
    String? degree,
    String? university,
    DateTime? year,
    String? department,
  }) {
    return Study(
      id: id ?? this.id,
      degree: degree ?? this.degree,
      university: university ?? this.university,
      year: year ?? this.year,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "degree": degree,
        "university": university,
        "year": year?.toIso8601String(),
        "department": department,
      };

  @override
  String toString() {
    return "$id, $degree, $university, $year, $department, ";
  }
}
