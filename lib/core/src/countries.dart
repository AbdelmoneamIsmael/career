const countries = [
  {"id": 1, "ar": "أفغانستان", "en": "Afghanistan"},
  {"id": 2, "ar": "ألبانيا", "en": "Albania"},
  {"id": 3, "ar": "الجزائر", "en": "Algeria"},
  {"id": 4, "ar": "أندورا", "en": "Andorra"},
  {"id": 5, "ar": "أنغولا", "en": "Angola"},
  {"id": 6, "ar": "أنتيغوا وبربودا", "en": "Antigua and Barbuda"},
  {"id": 7, "ar": "الأرجنتين", "en": "Argentina"},
  {"id": 8, "ar": "أرمينيا", "en": "Armenia"},
  {"id": 9, "ar": "أستراليا", "en": "Australia"},
  {"id": 10, "ar": "النمسا", "en": "Austria"},
  {"id": 11, "ar": "أذربيجان", "en": "Azerbaijan"},
  {"id": 12, "ar": "الباهاما", "en": "Bahamas"},
  {"id": 13, "ar": "البحرين", "en": "Bahrain"},
  {"id": 14, "ar": "بنغلاديش", "en": "Bangladesh"},
  {"id": 15, "ar": "باربادوس", "en": "Barbados"},
  {"id": 16, "ar": "بيلاروسيا", "en": "Belarus"},
  {"id": 17, "ar": "بلجيكا", "en": "Belgium"},
  {"id": 18, "ar": "بيليز", "en": "Belize"},
  {"id": 19, "ar": "بنين", "en": "Benin"},
  {"id": 20, "ar": "بوتان", "en": "Bhutan"},
  {"id": 21, "ar": "بوليفيا", "en": "Bolivia"},
  {"id": 22, "ar": "البوسنة والهرسك", "en": "Bosnia and Herzegovina"},
  {"id": 23, "ar": "بوتسوانا", "en": "Botswana"},
  {"id": 24, "ar": "البرازيل", "en": "Brazil"},
  {"id": 25, "ar": "بروناي", "en": "Brunei"},
  {"id": 26, "ar": "بلغاريا", "en": "Bulgaria"},
  {"id": 27, "ar": "بوركينا فاسو", "en": "Burkina Faso"},
  {"id": 28, "ar": "بوروندي", "en": "Burundi"},
  {"id": 29, "ar": "الرأس الأخضر", "en": "Cabo Verde"},
  {"id": 30, "ar": "كمبوديا", "en": "Cambodia"},
  {"id": 31, "ar": "الكاميرون", "en": "Cameroon"},
  {"id": 32, "ar": "كندا", "en": "Canada"},
  {"id": 33, "ar": "جمهورية أفريقيا الوسطى", "en": "Central African Republic"},
  {"id": 34, "ar": "تشاد", "en": "Chad"},
  {"id": 35, "ar": "شيلي", "en": "Chile"},
  {"id": 36, "ar": "الصين", "en": "China"},
  {"id": 37, "ar": "كولومبيا", "en": "Colombia"},
  {"id": 38, "ar": "جزر القمر", "en": "Comoros"},
  {"id": 39, "ar": "الكونغو", "en": "Congo (Congo-Brazzaville)"},
  {"id": 40, "ar": "كوستاريكا", "en": "Costa Rica"},
  {"id": 41, "ar": "كرواتيا", "en": "Croatia"},
  {"id": 42, "ar": "كوبا", "en": "Cuba"},
  {"id": 43, "ar": "قبرص", "en": "Cyprus"},
  {"id": 44, "ar": "جمهورية التشيك", "en": "Czech Republic (Czechia)"},
  {
    "id": 45,
    "ar": "جمهورية الكونغو الديمقراطية",
    "en": "Democratic Republic of the Congo (Congo-Kinshasa)"
  },
  {"id": 46, "ar": "الدنمارك", "en": "Denmark"},
  {"id": 47, "ar": "جيبوتي", "en": "Djibouti"},
  {"id": 48, "ar": "دومينيكا", "en": "Dominica"},
  {"id": 49, "ar": "جمهورية الدومينيكان", "en": "Dominican Republic"},
  {"id": 50, "ar": "الإكوادور", "en": "Ecuador"},
  {"id": 51, "ar": "مصر", "en": "Egypt"},
  {"id": 52, "ar": "السلفادور", "en": "El Salvador"},
  {"id": 53, "ar": "غينيا الاستوائية", "en": "Equatorial Guinea"},
  {"id": 54, "ar": "إريتريا", "en": "Eritrea"},
  {"id": 55, "ar": "إستونيا", "en": "Estonia"},
  {"id": 56, "ar": "إيسواتيني", "en": "Eswatini"},
  {"id": 57, "ar": "إثيوبيا", "en": "Ethiopia"},
  {"id": 58, "ar": "فيجي", "en": "Fiji"},
  {"id": 59, "ar": "فنلندا", "en": "Finland"},
  {"id": 60, "ar": "فرنسا", "en": "France"},
  {"id": 61, "ar": "الغابون", "en": "Gabon"},
  {"id": 62, "ar": "غامبيا", "en": "Gambia"},
  {"id": 63, "ar": "جورجيا", "en": "Georgia"},
  {"id": 64, "ar": "ألمانيا", "en": "Germany"},
  {"id": 65, "ar": "غانا", "en": "Ghana"},
  {"id": 66, "ar": "اليونان", "en": "Greece"},
  {"id": 67, "ar": "غرينادا", "en": "Grenada"},
  {"id": 68, "ar": "غواتيمالا", "en": "Guatemala"},
  {"id": 69, "ar": "غينيا", "en": "Guinea"},
  {"id": 70, "ar": "غينيا بيساو", "en": "Guinea-Bissau"},
  {"id": 71, "ar": "غيانا", "en": "Guyana"},
  {"id": 72, "ar": "هايتي", "en": "Haiti"},
  {"id": 73, "ar": "هندوراس", "en": "Honduras"},
  {"id": 74, "ar": "هنغاريا", "en": "Hungary"},
  {"id": 75, "ar": "آيسلندا", "en": "Iceland"},
  {"id": 76, "ar": "الهند", "en": "India"},
  {"id": 77, "ar": "إندونيسيا", "en": "Indonesia"},
  {"id": 78, "ar": "إيران", "en": "Iran"},
  {"id": 79, "ar": "العراق", "en": "Iraq"},
  {"id": 80, "ar": "أيرلندا", "en": "Ireland"},
  {"id": 81, "ar": "إسرائيل", "en": "Israel"},
  {"id": 82, "ar": "إيطاليا", "en": "Italy"},
  {"id": 83, "ar": "جامايكا", "en": "Jamaica"},
  {"id": 84, "ar": "اليابان", "en": "Japan"},
  {"id": 85, "ar": "الأردن", "en": "Jordan"},
  {"id": 86, "ar": "كازاخستان", "en": "Kazakhstan"},
  {"id": 87, "ar": "كينيا", "en": "Kenya"},
  {"id": 88, "ar": "كيريباتي", "en": "Kiribati"},
  {"id": 89, "ar": "كوريا الشمالية", "en": "Korea, North"},
  {"id": 90, "ar": "كوريا الجنوبية", "en": "Korea, South"},
  {"id": 91, "ar": "الكويت", "en": "Kuwait"},
  {"id": 92, "ar": "قيرغيزستان", "en": "Kyrgyzstan"},
  {"id": 93, "ar": "لاوس", "en": "Laos"},
  {"id": 94, "ar": "لاتفيا", "en": "Latvia"},
  {"id": 95, "ar": "لبنان", "en": "Lebanon"},
  {"id": 96, "ar": "ليسوتو", "en": "Lesotho"},
  {"id": 97, "ar": "ليبيريا", "en": "Liberia"},
  {"id": 98, "ar": "ليبيا", "en": "Libya"},
  {"id": 99, "ar": "ليختنشتاين", "en": "Liechtenstein"},
  {"id": 100, "ar": "ليتوانيا", "en": "Lithuania"},
  {"id": 101, "ar": "لوكسمبورغ", "en": "Luxembourg"},
  {"id": 102, "ar": "مدغشقر", "en": "Madagascar"},
  {"id": 103, "ar": "مالاوي", "en": "Malawi"},
  {"id": 104, "ar": "ماليزيا", "en": "Malaysia"},
  {"id": 105, "ar": "المالديف", "en": "Maldives"},
  {"id": 106, "ar": "مالي", "en": "Mali"},
  {"id": 107, "ar": "مالطا", "en": "Malta"},
  {"id": 108, "ar": "جزر مارشال", "en": "Marshall Islands"},
  {"id": 109, "ar": "موريتانيا", "en": "Mauritania"},
  {"id": 110, "ar": "موريشيوس", "en": "Mauritius"},
  {"id": 111, "ar": "المكسيك", "en": "Mexico"},
  {"id": 112, "ar": "ميكرونيزيا", "en": "Micronesia"},
  {"id": 113, "ar": "مولدوفا", "en": "Moldova"},
  {"id": 114, "ar": "موناكو", "en": "Monaco"},
  {"id": 115, "ar": "منغوليا", "en": "Mongolia"},
  {"id": 116, "ar": "الجبل الأسود", "en": "Montenegro"},
  {"id": 117, "ar": "المغرب", "en": "Morocco"},
  {"id": 118, "ar": "موزمبيق", "en": "Mozambique"},
  {"id": 119, "ar": "ميانمار", "en": "Myanmar (Burma)"},
  {"id": 120, "ar": "ناميبيا", "en": "Namibia"},
  {"id": 121, "ar": "ناورو", "en": "Nauru"},
  {"id": 122, "ar": "نيبال", "en": "Nepal"},
  {"id": 123, "ar": "هولندا", "en": "Netherlands"},
  {"id": 124, "ar": "نيوزيلندا", "en": "New Zealand"},
  {"id": 125, "ar": "نيكاراغوا", "en": "Nicaragua"},
  {"id": 126, "ar": "النيجر", "en": "Niger"},
  {"id": 127, "ar": "نيجيريا", "en": "Nigeria"},
  {"id": 128, "ar": "مقدونيا الشمالية", "en": "North Macedonia"},
  {"id": 129, "ar": "النرويج", "en": "Norway"},
  {"id": 130, "ar": "عمان", "en": "Oman"},
  {"id": 131, "ar": "باكستان", "en": "Pakistan"},
  {"id": 132, "ar": "بالاو", "en": "Palau"},
  {"id": 133, "ar": "بنما", "en": "Panama"},
  {"id": 134, "ar": "بابوا غينيا الجديدة", "en": "Papua New Guinea"},
  {"id": 135, "ar": "باراغواي", "en": "Paraguay"},
  {"id": 136, "ar": "بيرو", "en": "Peru"},
  {"id": 137, "ar": "الفلبين", "en": "Philippines"},
  {"id": 138, "ar": "بولندا", "en": "Poland"},
  {"id": 139, "ar": "البرتغال", "en": "Portugal"},
  {"id": 140, "ar": "قطر", "en": "Qatar"},
  {"id": 141, "ar": "رومانيا", "en": "Romania"},
  {"id": 142, "ar": "روسيا", "en": "Russia"},
  {"id": 143, "ar": "رواندا", "en": "Rwanda"},
  {"id": 144, "ar": "سانت كيتس ونيفيس", "en": "Saint Kitts and Nevis"},
  {"id": 145, "ar": "سانت لوسيا", "en": "Saint Lucia"},
  {
    "id": 146,
    "ar": "سانت فنسنت والغرينادين",
    "en": "Saint Vincent and the Grenadines"
  },
  {"id": 147, "ar": "ساموا", "en": "Samoa"},
  {"id": 148, "ar": "سان مارينو", "en": "San Marino"},
  {"id": 149, "ar": "ساو تومي وبرينسيبي", "en": "Sao Tome and Principe"},
  {"id": 150, "ar": "السعودية", "en": "Saudi Arabia"},
  {"id": 151, "ar": "السنغال", "en": "Senegal"},
  {"id": 152, "ar": "صربيا", "en": "Serbia"},
  {"id": 153, "ar": "سيشيل", "en": "Seychelles"},
  {"id": 154, "ar": "سيراليون", "en": "Sierra Leone"},
  {"id": 155, "ar": "سنغافورة", "en": "Singapore"},
  {"id": 156, "ar": "سلوفاكيا", "en": "Slovakia"},
  {"id": 157, "ar": "سلوفينيا", "en": "Slovenia"},
  {"id": 158, "ar": "جزر سليمان", "en": "Solomon Islands"},
  {"id": 159, "ar": "الصومال", "en": "Somalia"},
  {"id": 160, "ar": "جنوب أفريقيا", "en": "South Africa"},
  {"id": 161, "ar": "جنوب السودان", "en": "South Sudan"},
  {"id": 162, "ar": "إسبانيا", "en": "Spain"},
  {"id": 163, "ar": "سريلانكا", "en": "Sri Lanka"},
  {"id": 164, "ar": "السودان", "en": "Sudan"},
  {"id": 165, "ar": "سورينام", "en": "Suriname"},
  {"id": 166, "ar": "السويد", "en": "Sweden"},
  {"id": 167, "ar": "سويسرا", "en": "Switzerland"},
  {"id": 168, "ar": "سوريا", "en": "Syria"},
  {"id": 169, "ar": "تايوان", "en": "Taiwan"},
  {"id": 170, "ar": "طاجيكستان", "en": "Tajikistan"},
  {"id": 171, "ar": "تنزانيا", "en": "Tanzania"},
  {"id": 172, "ar": "تايلاند", "en": "Thailand"},
  {"id": 173, "ar": "تيمور الشرقية", "en": "Timor-Leste"},
  {"id": 174, "ar": "توجو", "en": "Togo"},
  {"id": 175, "ar": "تونغا", "en": "Tonga"},
  {"id": 176, "ar": "ترينيداد وتوباغو", "en": "Trinidad and Tobago"},
  {"id": 177, "ar": "تونس", "en": "Tunisia"},
  {"id": 178, "ar": "تركيا", "en": "Turkey"},
  {"id": 179, "ar": "تركمانستان", "en": "Turkmenistan"},
  {"id": 180, "ar": "توفالو", "en": "Tuvalu"},
  {"id": 181, "ar": "أوغندا", "en": "Uganda"},
  {"id": 182, "ar": "أوكرانيا", "en": "Ukraine"},
  {"id": 183, "ar": "الإمارات العربية المتحدة", "en": "United Arab Emirates"},
  {"id": 184, "ar": "المملكة المتحدة", "en": "United Kingdom"},
  {"id": 185, "ar": "الولايات المتحدة", "en": "United States"},
  {"id": 186, "ar": "أوروغواي", "en": "Uruguay"},
  {"id": 187, "ar": "أوزبكستان", "en": "Uzbekistan"},
  {"id": 188, "ar": "فانواتو", "en": "Vanuatu"},
  {"id": 189, "ar": "مدينة الفاتيكان", "en": "Vatican City"},
  {"id": 190, "ar": "فنزويلا", "en": "Venezuela"},
  {"id": 191, "ar": "فيتنام", "en": "Vietnam"},
  {"id": 192, "ar": "اليمن", "en": "Yemen"},
  {"id": 193, "ar": "زامبيا", "en": "Zambia"},
  {"id": 194, "ar": "زيمبابوي", "en": "Zimbabwe"}
];

class CountryModel {
  CountryModel({required this.id, required this.nameAr, required this.nameEn});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(id: json['id'], nameAr: json['ar'], nameEn: json['en']);
  }
  int id;
  String nameAr;
  String nameEn;
}
