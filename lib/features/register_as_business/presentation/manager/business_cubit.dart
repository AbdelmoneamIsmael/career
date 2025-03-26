import 'dart:io';

import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/company_adress_info_model.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';
import 'package:career/features/register_as_business/domain/repo/reister_business_repo.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterAsBusinessCubit extends Cubit<RegisterBusinessState> {
  RegisterAsBusinessCubit({required this.registerBusinessRepo})
      : super(BusinessInitial()) {
    onInintial();
  }
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 0;
  CompanyRegisterModel registerModel = CompanyRegisterModel.empty();
  final RegisterBusinessRepo registerBusinessRepo;
  Governerates? selectedGovernorate;
  Areas? selectedArea;

  @override
  Future<void> close() {
    pageController.dispose();
    disposeCoreInfo();
    disposeCommunicationInfo();
    disposeGovernorate();
    return super.close();
  }

  void setVAlue(int value) {
    currentPage = value;
    emit(ChangePageView());
  }

  void next() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
      );
    }
  }

  void previous() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
      );
    }
  }

  //////////////Cpmpany Image//////////////////////
  Future<void> onInintial() async {
    currentPage = 0;
    await loadDefaultUserImage();
    emit(ChangeCompanyImage());
  }

  Future<void> loadDefaultUserImage() async {
    // Load image as bytes
    final ByteData data =
        await rootBundle.load('assets/images/company-default.png');
    final Uint8List bytes = data.buffer.asUint8List();

    // Get the temporary directory
    final Directory tempDir = await getTemporaryDirectory();
    final String path = '${tempDir.path}/company-default.png';

    // Write the image bytes to a file
    registerModel.image = File(path);
    await registerModel.image!.writeAsBytes(bytes);
  }

  Future<void> pickImage() async {
    await Permission.accessMediaLocation.request();
    await Permission.photos.request();
    await Permission.storage.request();
    await Permission.camera.request();
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? result = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (result != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: result.path,
      );
      if (croppedFile != null) {
        registerModel.image = File(croppedFile.path);
      }
      emit(ChangeCompanyImage());
    }
  }

  ///////////////////////////////core information//////////////////////////
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String code = "+964";
  TextEditingController passwordController = TextEditingController();
  TextEditingController companySizedController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  disposeCoreInfo() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    companySizedController.dispose();
    userNameController.dispose();
    nationalityController.dispose();
  }

  bool coreInformationValid() {
    if (nameController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        companySizedController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nationalityController.text.isNotEmpty) {
      confirmCoreInformation();
      return true;
    } else {
      return false;
    }
  }

  void confirmCoreInformation() {
    registerModel.name = nameController.text;
    registerModel.username = userNameController.text;
    registerModel.email = emailController.text;
    registerModel.password = passwordController.text;
    registerModel.companySize = num.parse(companySizedController.text);
    registerModel.phoneNumber = code + phoneController.text;
    // registerModel.nationalityId = nationalityController.text;
  }

  ////////////////////////// communication information////////////////////////
  TextEditingController webSiteUrlController = TextEditingController();
  TextEditingController facebookUrlController = TextEditingController();
  TextEditingController linkedInUrlrUrlController = TextEditingController();
  TextEditingController specializationController = TextEditingController();

  disposeCommunicationInfo() {
    webSiteUrlController.dispose();
    facebookUrlController.dispose();
    linkedInUrlrUrlController.dispose();
    specializationController.dispose();
  }

  bool communicationInformationValid() {
    if (webSiteUrlController.text.isNotEmpty ||
        facebookUrlController.text.isNotEmpty ||
        linkedInUrlrUrlController.text.isNotEmpty) {
      if (registerModel.scope.isNotEmpty) {
        confirmCommunicationInformation();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void confirmCommunicationInformation() {
    registerModel.websiteUrl = webSiteUrlController.text;
    registerModel.facebookUrl = facebookUrlController.text;
    registerModel.linkedInUrl = linkedInUrlrUrlController.text;
  }

  void addSpecialization() {
    registerModel.scope.add(specializationController.text);
    specializationController.text = "";
    emit(AddSpeacialization());
  }

  void deleteSpecialization(String e) {
    registerModel.scope.remove(e);
    emit(AddSpeacialization());
  }

////////////////////////////////////// governorates and areas /////////////////////////
  void assignGovernorate(Governerates? result) {
    selectedGovernorate = result;
    if (selectedGovernorate != null) {
      governorateController.text = selectedGovernorate!.name!;
    }
    selectedArea = null;
    emit(ChangeGovernorate());
  }

  TextEditingController governorateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  void assignArea(Areas? result) {
    selectedArea = result;
    if (selectedArea != null) {
      areaController.text = selectedArea!.name!;
    }
    emit(ChangeAreas());
  }

  disposeGovernorate() {
    governorateController.dispose();
    areaController.dispose();
    adressController.dispose();
  }

  List<AdressInfoModel> addresses = [];
  void addAddress() {
    if (companyInformationValidation()) {
      addresses.add(
        AdressInfoModel(
          areaName: selectedArea!.name!,
          governorateName: selectedGovernorate!.name!,
          governorateId: selectedGovernorate!.id!,
          areaId: selectedArea!.id!,
          streetAddress: adressController.text,
          isDefault: false,
        ),
      );
      selectedGovernorate = null;
      selectedArea = null;
      adressController.text = "";
      governorateController.text = "";
      areaController.text = "";
      emit(AddAddress());
    }
  }

  void deleteAddress(AdressInfoModel address) {
    addresses.remove(address);
    emit(DeleteAddress());
  }

  void editAddress(AdressInfoModel address) {
    areaController.text = address.areaName!;
    governorateController.text = address.governorateName!;
    adressController.text = address.streetAddress!;
    selectedArea = Areas(
      governorateId: address.governorateId?.toInt(),
      id: address.areaId?.toInt(),
      name: address.areaName,
    );
    selectedGovernorate = Governerates(
      id: address.governorateId?.toInt(),
      name: address.governorateName,
    );

    deleteAddress(address);
  }

  bool companyInformationValidation() {
    if (selectedGovernorate != null &&
        selectedArea != null &&
        adressController.text.isNotEmpty) {
      confirmCompanyInformation();
      return true;
    } else {
      return false;
    }
  }

  void confirmCompanyInformation() {}

  //////////////final review ///////////////////////////
  bool finalReview() {
    if (registerModel.addresses.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void assignAddress() {
    registerModel.addresses = addresses;
  }

  void confirmRegister() async {
    try {
      emit(LoadingRegister());
      var result = await registerBusinessRepo.registerCompany(
          companyRegisterModel: registerModel);
      result.fold((l) {
        emit(ErrorRegister(l.message));
      }, (r) {
        emit(
          SuccessRegister(),
        );
      });
    } catch (e) {
      emit(ErrorRegister(e.toString()));
    }
  }
}
