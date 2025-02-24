import 'package:career/features/company_page/presentation/manager/company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyState>{
  CompanyCubit(): super(CompanyInitial());
  int selectIndex=0;
  void changeTap({required int index}) {
    selectIndex=index;
    emit(ChangeTapState());
  }
}