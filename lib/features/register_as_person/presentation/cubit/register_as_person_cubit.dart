import 'dart:io';
import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/core/src/language.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/company_adress_info_model.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterAsPersonCubit extends Cubit<RegisterAsPersonState> {
  RegisterAsPersonCubit() : super(RegisterAsPersonInitial()) {
    onInintial();
  }
  //global variabels
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 0;
  RegisterModel registerModel = RegisterModel.empty();
  Governerates? selectedGovernorate;
  Areas? selectedArea;
  @override
  Future<void> close() {
    pageController.dispose();
    disposeStudyInfo();
    disposeCvInfo();
    disposeCoreInfo();
    disposeWorkExperianceInfo();
    disposeCirtificationsInfo();
    return super.close();
  }

  Future<void> onInintial() async {
    currentPage = 0;
    await loadDefaultUserImage();
    emit(ChangeProfileImage());
  }

  Future<void> loadDefaultUserImage() async {
    // Load image as bytes
    final ByteData data =
        await rootBundle.load('assets/images/profile_avatar.png');
    final Uint8List bytes = data.buffer.asUint8List();

    // Get the temporary directory
    final Directory tempDir = await getTemporaryDirectory();
    final String path = '${tempDir.path}/profile_avatar.png';

    // Write the image bytes to a file
    registerModel.image = File(path);
    await registerModel.image!.writeAsBytes(bytes);
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

  ///////////////////////////////core information//////////////////////////
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String code = "+964";
  TextEditingController passwordController = TextEditingController();
  TextEditingController jopTitleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  disposeCoreInfo() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    jopTitleController.dispose();
    dateController.dispose();
    nationalityController.dispose();
  }

  PlatformFile? profileImagePlatformFile;
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
      emit(ChangeProfileImage());
    }
  }

  bool checkCoreInfoValidate(
    BuildContext context,
  ) {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        jopTitleController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        nationalityController.text.isNotEmpty) {
      if (phoneController.text.length <= 8) {
        UiHelper.showSnakBar(
          message: AppLocalizations.of(context).phoneNotValid,
          context: context,
          type: MotionToastType.info,
        );
        return false;
      }
      if (passwordController.text.length < 8) {
        UiHelper.showSnakBar(
          message: AppLocalizations.of(context).passwordNotVailid,
          context: context,
          type: MotionToastType.info,
        );
        return false;
      }
      fillCoreInfo();

      return true;
    }
    UiHelper.showSnakBar(
      message: AppLocalizations.of(context).youShouldFillAllFields,
      context: context,
      type: MotionToastType.info,
    );
    return false;
  }

  void fillCoreInfo() {
    registerModel.name = nameController.text;
    registerModel.email = emailController.text;
    registerModel.phoneNumber = code + phoneController.text;
    registerModel.password = passwordController.text;
    registerModel.jopName = jopTitleController.text;
    registerModel.dateOfBirth = DateTime.parse(dateController.text);
    registerModel.username = userNameController.text;
  }

  /////////////////////////////cv information//////////////////////////
  TextEditingController cvLanguage =
      TextEditingController(text: popularLanguages[0]);
  TextEditingController adress = TextEditingController();
  TextEditingController governorateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();

  disposeCvInfo() {
    cvLanguage.dispose();

    governorateController.dispose();
    areaController.dispose();
    adress.dispose();
    facebookController.dispose();
    websiteController.dispose();
    linkedinController.dispose();
  }

  void assignGovernorate(Governerates? result) {
    selectedGovernorate = result;
    if (selectedGovernorate != null) {
      governorateController.text = selectedGovernorate!.name!;
    }
    selectedArea = null;
    emit(ChangeGovernorate());
  }

  void assignArea(Areas? result) {
    selectedArea = result;
    if (selectedArea != null) {
      areaController.text = selectedArea!.name!;
    }
    emit(ChangeAreas());
  }

  PlatformFile? cv;
  Future<void> pdfPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      cv = result.files.first;
      emit(PdfPicked());
    }
  }

  bool checkCVInfo(BuildContext context) {
    if (cvLanguage.text.isNotEmpty &&
        adress.text.isNotEmpty &&
        cv != null &&
        selectedArea != null &&
        selectedGovernorate != null) {
      registerModel.addresses = [
        AdressInfoModel(
          areaName: selectedArea!.name!,
          governorateName: selectedGovernorate!.name!,
          governorateId: selectedGovernorate!.id!,
          areaId: selectedArea!.id!,
          streetAddress: adress.text,
          isDefault: false,
        ),
      ];
      if (registerModel.addresses.isNotEmpty) {
        if (websiteController.text.isNotEmpty ||
            facebookController.text.isNotEmpty ||
            linkedinController.text.isNotEmpty) {
          fillCvInfo();
          return true;
        } else {
          UiHelper.showSnakBar(
            message: AppLocalizations.of(context).fillAtListOneSocialMedia,
            context: context,
            type: MotionToastType.info,
          );
          return false;
        }
      }
    }
    print(
        "${cvLanguage.text.isNotEmpty} ${adress.text.isNotEmpty} ${cv != null}");
    UiHelper.showSnakBar(
      message: AppLocalizations.of(context).youShouldFillAllFields,
      context: context,
      type: MotionToastType.info,
    );
    return false;
  }

  void fillCvInfo() {
    registerModel.cvLanguage = cvLanguage.text;

    registerModel.cvFile = File(cv!.path!);
  }

  ////////////////////////////studies information//////////////////////////
  TextEditingController university = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController degree = TextEditingController();
  disposeStudyInfo() {
    university.dispose();
    department.dispose();
    year.dispose();
    degree.dispose();
  }

  bool checkStudiesInfo(BuildContext context) {
    if (university.text.isNotEmpty &&
        department.text.isNotEmpty &&
        year.text.isNotEmpty &&
        degree.text.isNotEmpty) {
      fillStudiesInfo();
      return true;
    }
    UiHelper.showSnakBar(
      message: AppLocalizations.of(context).youShouldFillAllFields,
      context: context,
      type: MotionToastType.info,
    );
    return false;
  }

  void fillStudiesInfo() {
    registerModel.studies.add(
      Study(
        university: university.text,
        department: department.text,
        year: DateTime.parse(year.text),
        degree: degree.text,
      ),
    );
    clearStudiesForm();
    emit(AddStudy());
  }

  void clearStudiesForm() {
    university.clear();
    degree.clear();
    department.clear();
    year.clear();
  }

  void deleteStudy(int index) {
    registerModel.studies.removeAt(index);
    emit(DeleteStudy());
  }

  void editStudy(int index) {
    university.text = registerModel.studies[index].university!;
    degree.text = registerModel.studies[index].degree!.toString();
    department.text = registerModel.studies[index].department!;
    year.text = registerModel.studies[index].year.toString();
    deleteStudy(index);
  }

  ////////////////////////////work experiance information//////////////////////////
  TextEditingController jobTitle = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController jopDescription = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController beginDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  bool workHereNow = false;

  disposeWorkExperianceInfo() {
    jobTitle.dispose();
    companyName.dispose();
    jopDescription.dispose();
    location.dispose();
    beginDate.dispose();
    endDate.dispose();
  }

  void changeWorkHereNow(bool? value, BuildContext context) {
    if (canISelectNow()) {
      workHereNow = value!;
      if (workHereNow) {
        endDate.text = DateTime.now().toString();
      }
      emit(ChangeWorkHereNow());
    } else {
      UiHelper.showSnakBar(
        message: AppLocalizations.of(context).anotherJopSelected,
        context: context,
        type: MotionToastType.info,
      );
    }
  }

  bool canISelectNow() {
    for (var element in registerModel.experiences) {
      if (element.isWorkingNow == true) {
        return false;
      }
    }
    return true;
  }

  void validateWorkExperiance(BuildContext context) {
    if (jobTitle.text.isNotEmpty &&
        companyName.text.isNotEmpty &&
        jopDescription.text.isNotEmpty &&
        location.text.isNotEmpty &&
        beginDate.text.isNotEmpty &&
        endDate.text.isNotEmpty) {
      fillWorkExperianceInfo();
      emit(AddWorkExperiance());
    } else {
      UiHelper.showSnakBar(
        message: AppLocalizations.of(context).youShouldFillAllFields,
        context: context,
        type: MotionToastType.info,
      );
    }
  }

  void fillWorkExperianceInfo() {
    registerModel.experiences.add(
      Experience(
        jopTitle: jobTitle.text,
        companyName: companyName.text,
        description: jopDescription.text,
        location: location.text,
        startDate: DateTime.parse(beginDate.text),
        endDate: DateTime.parse(endDate.text),
        isWorkingNow: workHereNow,
      ),
    );
    clearWorkExperianceForm();
  }

  void clearWorkExperianceForm() {
    jobTitle.clear();
    companyName.clear();
    jopDescription.clear();
    location.clear();
    beginDate.clear();
    endDate.clear();
    workHereNow = false;
  }

  void deleteWork(int index) {
    registerModel.experiences.removeAt(index);
    emit(DeleteWorkExperiance());
  }

  void editWork(int index) {
    jobTitle.text = registerModel.experiences[index].jopTitle!;
    companyName.text = registerModel.experiences[index].companyName!;
    jopDescription.text = registerModel.experiences[index].description!;
    location.text = registerModel.experiences[index].location!;
    beginDate.text = registerModel.experiences[index].startDate.toString();
    endDate.text = registerModel.experiences[index].endDate.toString();
    workHereNow = registerModel.experiences[index].isWorkingNow!;
    deleteWork(index);
  }
  //////////////////////////Cirtifications information//////////////////////////

  TextEditingController cirtificationTitle = TextEditingController();
  TextEditingController cirtificationdescription = TextEditingController();
  TextEditingController cirtificationGivenDate = TextEditingController();
  TextEditingController cirtificationGivenBy = TextEditingController();

  disposeCirtificationsInfo() {
    cirtificationTitle.dispose();
    cirtificationdescription.dispose();
    cirtificationGivenDate.dispose();
    cirtificationGivenBy.dispose();
  }

  void validateCirtificationsInfo(BuildContext context) {
    if (cirtificationTitle.text.isNotEmpty &&
        cirtificationdescription.text.isNotEmpty &&
        cirtificationGivenDate.text.isNotEmpty &&
        cirtificationGivenBy.text.isNotEmpty) {
      fillCirtificationsInfo();
      emit(AddCirtifications());
    } else {
      UiHelper.showSnakBar(
        message: AppLocalizations.of(context).youShouldFillAllFields,
        context: context,
        type: MotionToastType.info,
      );
    }
  }

  void fillCirtificationsInfo() {
    registerModel.certificationRequests.add(CertificationRequest(
      name: cirtificationTitle.text,
      given: cirtificationGivenBy.text,
      givenAt: DateTime.parse(cirtificationGivenDate.text),
      description: cirtificationdescription.text,
    ));
    clearCirtificationsForm();
  }

  void clearCirtificationsForm() {
    cirtificationTitle.clear();
    cirtificationdescription.clear();
    cirtificationGivenDate.clear();
    cirtificationGivenBy.clear();
  }

  void addLanguageToUser(String suggestion) {
    registerModel.languages.add(suggestion);
    var lang = registerModel.languages.toSet();
    registerModel.languages = lang.toList();

    emit(AddLanguage());
  }

  void deleteLanguage(String e) {
    registerModel.languages.remove(e);
    emit(DeleteLanguage());
  }

  void addSkills(
    int suggestion,
  ) {
    registerModel.skills.add(suggestion);
    var skills = registerModel.skills.toSet();
    registerModel.skills = skills.toList();

    emit(AddLanguage());
  }

  void deleteSkill(String e) {
    registerModel.skills.remove(e);
    emit(DeleteLanguage());
  }
}
