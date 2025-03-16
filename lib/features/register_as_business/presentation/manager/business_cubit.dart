import 'dart:io';
import 'dart:typed_data';

import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
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

  @override
  Future<void> close() {
    pageController.dispose();
    disposeCoreInfo();
    disposeCommunicationInfo();
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
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
      ],
    );

    if (result != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: result.files.first.path!,
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
}
