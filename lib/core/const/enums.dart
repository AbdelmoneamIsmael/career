enum SnackBarType {
  success,
  error,
  warning,
  info,
}

enum InvoicePaidStatus {
  unpaid,
  partial,
  paid,
}

enum SortType {
  asc,
  desc,
}

enum DiscountType {
  percentage,
  amount,
}

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  canceled,
}

enum SocialLogin {
  facebook,
  google,
}

enum VisitorType {
  person,
  business,
  guest,
  admin,
}

enum PaymentMethod {
  cash,
  credit,
  bank,
}

enum Gender {
  male,
  female,
}

class Enums {
  factory Enums.fromJson(Map<String, dynamic> json) {
    return Enums(
      value: json["value"],
      nameEn: json["nameEn"],
      nameAr: json["nameAr"],
    );
  }
  Enums({
    required this.value,
    required this.nameEn,
    required this.nameAr,
  });

  final int? value;
  final String? nameEn;
  final String? nameAr;
}

List<Map<String, dynamic>> reactions = [
  {"value": 1, "nameEn": "Like", "nameAr": "اعجاب"},
  {"value": 2, "nameEn": "Love", "nameAr": "احببت"},
  {"value": 3, "nameEn": "support", "nameAr": "ادعمه"},
  {"value": 4, "nameEn": "Haha", "nameAr": "اضحكنى"},
  {"value": 5, "nameEn": "Wow", "nameAr": "ابهرنى"},
  {"value": 6, "nameEn": "Sad", "nameAr": "احزننى"},
  {"value": 7, "nameEn": "Angry", "nameAr": "اغضبنى"}
];
List<Enums> reactionsEnum = reactions.map(Enums.fromJson).toList();
List<Map<String, dynamic>> gender = [
  {"value": 1, "nameEn": "Male", "nameAr": "ذكر"},
  {"value": 2, "nameEn": "Female", "nameAr": "انثي"}
];
List<Enums> genderEnum = gender.map(Enums.fromJson).toList();
List<Map<String, dynamic>> jobLevels = [
  {"value": 1, "nameEn": "Internship", "nameAr": "متدرب"},
  {"value": 2, "nameEn": "Entry Level", "nameAr": "مستوى مبتدئ"},
  {"value": 3, "nameEn": "Junior", "nameAr": "مبتدئ"},
  {"value": 4, "nameEn": "Mid Level", "nameAr": "متوسط الخبرة"},
  {"value": 5, "nameEn": "Manager", "nameAr": "مدير"},
  {"value": 6, "nameEn": "Senior Manager", "nameAr": "مدير أول"},
  {"value": 7, "nameEn": "Executive Manager", "nameAr": "مدير تنفيذي"}
];
List<Enums> jobLevelsEnum = jobLevels.map(Enums.fromJson).toList();
List<Map<String, dynamic>> jobTypes = [
  {"value": 1, "nameEn": "Full Time", "nameAr": "دوام كامل"},
  {"value": 2, "nameEn": "Part Time", "nameAr": "دوام جزئي"},
  {"value": 3, "nameEn": "Remotely", "nameAr": "عن بُعد"},
  {"value": 4, "nameEn": "Internship", "nameAr": "تدريب"}
];
List<Enums> jobTypesEnum = jobTypes.map(Enums.fromJson).toList();
List<Map<String, dynamic>> approvalStatus = [
  {"value": 1, "nameEn": "Pending", "nameAr": "قيد الانتظار"},
  {"value": 2, "nameEn": "Approved", "nameAr": "مقبول"},
  {"value": 3, "nameEn": "Rejected", "nameAr": "مرفوض"}
];
List<Enums> approvalStatusEnum = approvalStatus.map(Enums.fromJson).toList();
