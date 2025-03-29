import 'package:career/core/widgets/loading_over_lay.dart';
import 'package:career/features/business_login/data/datasources/remote_login.dart';
import 'package:career/features/business_login/data/repositories/login_repo_imple.dart';
import 'package:career/features/business_login/domain/repositories/login_repo.dart';
import 'package:career/features/business_login/domain/usecases/login_use_case.dart';
import 'package:career/features/otp_screen/data/datasources/confirm_otp_remote.dart';
import 'package:career/features/otp_screen/data/repositories/confirm_otp_repo_imple.dart';
import 'package:career/features/otp_screen/domain/repositories/confirm_otp_repo.dart';
import 'package:career/features/otp_screen/domain/usecases/confirm_otp_use_cases.dart';
import 'package:career/features/profile_screen/data/data/get_profile_repo_imple.dart';
import 'package:career/features/profile_screen/data/remote/remote_profile.dart';
import 'package:career/features/profile_screen/domain/repo/get_person_details_repo.dart';
import 'package:career/features/register_as_business/data/remote_data/regester_company_remote.dart';
import 'package:career/features/register_as_business/data/repo/register_company_repo_imple.dart';
import 'package:career/features/register_as_business/domain/repo/reister_business_repo.dart';
import 'package:career/features/register_as_person/data/datasources/remote_persone_register.dart';
import 'package:career/features/register_as_person/data/repositories/register_person_repo_imple.dart';
import 'package:career/features/register_as_person/domain/repositories/register_person_repo.dart';
import 'package:career/features/reset_password/data/datasources/remote/remote_confirm_reset_by_phone.dart';
import 'package:career/features/reset_password/data/datasources/remote/remote_resete_password.dart';
import 'package:career/features/reset_password/data/repositories/reset_password_repo_imple.dart';
import 'package:career/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt.registerSingleton<RegisterBusinessRepo>(
    RegisterCompanyRepoImple(
      regesterCompanyRemote: RegesterCompanyRemote(),
    ),
  );
  getIt.registerSingleton<LoginRepo>(
    LoginRepoImple(
      remoteLogin: RemoteLogin(),
    ),
  );
  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(
      loginRepo: getIt.get<LoginRepo>(),
    ),
  );
  getIt.registerSingleton<RegisterPersonRepo>(
    RegisterPersonRepoImple(
      remotePersoneRegister: RemotePersoneRegister(),
    ),
  );
  getIt.registerSingleton<LoadingOverlay>(
    const LoadingOverlay(),
  );
  getIt.registerSingleton<ConfirmOtpRepo>(
    ConfirmOtpRepoImple(
      resendOtpRemote: ResendOtpRemote(),
      confirmOtpRemote: ConfirmOtpRemote(),
    ),
  );
  getIt.registerSingleton<ConfirmOtpUseCases>(
    ConfirmOtpUseCases(
      confirmOtpRepo: getIt.get<ConfirmOtpRepo>(),
    ),
  );
  getIt.registerSingleton<ResetPasswordRepo>(
    ResetPasswordRepoImple(
      remoteConfirmResetByPhone: RemoteConfirmResetByPhone(),
      remoteResetePassword: RemoteResetePassword(),
    ),
  );
  getIt.registerSingleton<GetPersonDetailsRepo>(
    GetProfileRepoImple(
      remoteProfile: RemoteProfile(),
    ),
  );
}
