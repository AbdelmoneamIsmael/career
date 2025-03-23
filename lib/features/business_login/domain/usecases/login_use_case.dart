import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/bloc/app_event.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/errors/error_class.dart';
import 'package:career/core/model/app_model/app_model.dart';
import 'package:career/features/business_login/data/models/login_response_model.dart';
import 'package:career/features/business_login/domain/entities/login.dart';
import 'package:career/features/business_login/domain/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  LoginUseCase({required this.loginRepo});
  final LoginRepo loginRepo;

  Future<Either<Failure, LoginResponseModel>> call({
    required LoginPrameters loginPrameters,
    required AppBloc bloc,
  }) async {
    var results = await loginRepo.login(
      loginPrameters: loginPrameters,
    );
    return results;
    // return results.fold(
    //   Left.new,
    //   (r) {
    //     if (r.roles.isEmpty) {
    //       if (r.roles.contains("Admin")) {
    //         bloc.add(
    //           VistorEvent(
    //             vistor: VisitorType.admin,
    //           ),
    //         );
    //       } else if (r.roles.contains("Business")) {
    //         bloc.add(
    //           VistorEvent(
    //             vistor: VisitorType.business,
    //           ),
    //         );
    //       } else if (r.roles.contains("Person")) {
    //         bloc.add(
    //           VistorEvent(
    //             vistor: VisitorType.person,
    //           ),
    //         );
    //       } else {
    //         bloc.add(
    //           VistorEvent(
    //             vistor: VisitorType.guest,
    //           ),
    //         );
    //       }
    //     }
    //     return Right(r);
    //   },
    // );
  }
}
