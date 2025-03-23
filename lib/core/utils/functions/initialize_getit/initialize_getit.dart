import 'package:career/features/business_login/data/datasources/remote_login.dart';
import 'package:career/features/business_login/data/repositories/login_repo_imple.dart';
import 'package:career/features/business_login/domain/repositories/login_repo.dart';
import 'package:career/features/business_login/domain/usecases/login_use_case.dart';
import 'package:career/features/register_as_business/data/remote_data/regester_company_remote.dart';
import 'package:career/features/register_as_business/data/repo/register_company_repo_imple.dart';
import 'package:career/features/register_as_business/domain/repo/reister_business_repo.dart';
import 'package:career/features/register_as_person/data/datasources/remote_persone_register.dart';
import 'package:career/features/register_as_person/data/repositories/register_person_repo_imple.dart';
import 'package:career/features/register_as_person/domain/repositories/register_person_repo.dart';
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
}
