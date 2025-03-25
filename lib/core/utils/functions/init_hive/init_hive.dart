import 'package:career/core/const/app_const.dart';
import 'package:career/features/otp_screen/data/models/otp_responce_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveInitialization() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LoginInfoAdapter());
  await Hive.openBox<LoginInfo>(StorageKeys.loginInfo);
}
