import 'dart:io';
import 'dart:typed_data';

import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterAsBusinessCubit extends Cubit<RegisterBusinessState> {
  RegisterAsBusinessCubit() : super(BusinessInitial()) {
    onInintial();
  }
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 0;
  CompanyRegisterModel registerModel = CompanyRegisterModel.empty();

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
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);

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

  TextEditingController nationalityController = TextEditingController();
  disposeCoreInfo() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    userNameController.dispose();
    nationalityController.dispose();
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
}
