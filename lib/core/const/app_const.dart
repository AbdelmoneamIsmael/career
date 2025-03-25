import 'package:career/core/routes/pages_keys.dart';
import 'package:get_it/get_it.dart';

const String kAppName = "Career";
const kFontFamily = "Tajawal";
const knotification = "notification";
const baseUrl = 'https://careerapi.runasp.net';
String appUrl = "";
String initialRoute = "/${PagesKeys.onBoardingScreen}";
// "/${PagesKeys.mainScreen}/${PagesKeys.homeScreen}";
String kDeviceToken = "";
// const String baseURl = "https://generators.runasp.net";
final getIt = GetIt.instance;

abstract class HiveKeys {}

abstract class StorageKeys {
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String loginInfo = "loginInfo";

  static const String lang = "lang";

  static const String userBox = "userBox";
  static const String userInfoBox = "userInfoBox";
  static const String adressBox = "adressBox";
}
