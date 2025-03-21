import 'package:career/features/register_as_business/data/remote_data/regester_company_remote.dart';
import 'package:career/features/register_as_business/data/repo/register_company_repo_imple.dart';
import 'package:career/features/register_as_business/domain/repo/reister_business_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt.registerSingleton<RegisterBusinessRepo>(
    RegisterCompanyRepoImple(
      regesterCompanyRemote: RegesterCompanyRemote(),
    ),
  );
}
