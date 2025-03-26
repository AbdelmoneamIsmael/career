import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/bloc/app_event.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/errors/error_class.dart';
import 'package:career/core/utils/cache_helper.dart';
import 'package:career/features/otp_screen/data/models/otp_responce_model.dart';
import 'package:career/features/otp_screen/domain/entities/conform_parameters.dart';
import 'package:career/features/otp_screen/domain/repositories/confirm_otp_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class ConfirmOtpUseCases {
  ConfirmOtpUseCases({required this.confirmOtpRepo});

  final ConfirmOtpRepo confirmOtpRepo;

  Future<Either<Failure, OtpResponseModel>> confirmOtp(
      {required ConfirmOtpParameters optPrameters,
      required AppBloc appBloc}) async {
    var result = await confirmOtpRepo.confirmOtp(optPrameters: optPrameters);
    return result.fold(
      Left.new,
      (r) async {
        if (r.data!.roles.isNotEmpty) {
          if (r.data!.roles.contains("Admin")) {
            appBloc.add(
              VistorEvent(
                vistor: VisitorType.admin,
              ),
            );
          } else if (r.data!.roles.contains("Business")) {
            appBloc.add(
              VistorEvent(
                vistor: VisitorType.business,
              ),
            );
          } else if (r.data!.roles.contains("Person")) {
            appBloc.add(
              VistorEvent(
                vistor: VisitorType.person,
              ),
            );
          } else {
            appBloc.add(
              VistorEvent(
                vistor: VisitorType.guest,
              ),
            );
          }
        }
        await CacheHelper.setSecuerString(
            key: StorageKeys.accessToken, value: r.data!.token ?? "");
        await CacheHelper.setSecuerString(
            key: StorageKeys.refreshToken, value: r.data!.refreshToken ?? "");
        var box = Hive.box<LoginInfo>(StorageKeys.loginInfo);
        await box.clear();
        await box.add(r.data!);
        return Right(r);
      },
    );
  }

  Future<Either<Failure, String>> resendOtp({required String phone}) async {
    return await confirmOtpRepo.resendOtp(phone: phone);
  }
}
