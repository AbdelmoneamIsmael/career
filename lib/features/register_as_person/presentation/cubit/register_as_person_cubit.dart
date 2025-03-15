import 'dart:io';
import 'dart:typed_data';
import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/src/language.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:career/features/register_as_person/presentation/views/cirtifications/cirtifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:equatable/equatable.dart';
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
    registerModel.profileImage = File(path);
    await registerModel.profileImage!.writeAsBytes(bytes);
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
  disposeCoreInfo() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    jopTitleController.dispose();
    dateController.dispose();
    nationalityController.dispose();
  }

  Gender? gender;

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
        registerModel.profileImage = File(croppedFile.path);
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
        nationalityController.text.isNotEmpty &&
        gender != null) {
      print(phoneController.text.length);
      print(phoneController.text.length <= 8);
      if (phoneController.text.length > 9) {
        print(code + phoneController.text);

        UiHelper.showSnakBar(
          message: AppLocalizations.of(context).phoneNotValid,
          context: context,
          type: MotionToastType.info,
        );
        return false;
      }
      if (passwordController.text.length <= 6) {
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
    registerModel.fullName = nameController.text;
    registerModel.email = emailController.text;
    registerModel.phone = code + phoneController.text;
    registerModel.password = passwordController.text;
    registerModel.jopName = jopTitleController.text;
    registerModel.dateOfBirth = DateTime.parse(dateController.text);
    registerModel.nationality = nationalityController.text;
    registerModel.gender = gender;
  }

  /////////////////////////////cv information//////////////////////////
  TextEditingController cvLanguage =
      TextEditingController(text: popularLanguages[0]);
  TextEditingController adress = TextEditingController();
  disposeCvInfo() {
    cvLanguage.dispose();
    adress.dispose();
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
    if (cvLanguage.text.isNotEmpty && adress.text.isNotEmpty && cv != null) {
      fillCvInfo();
      return true;
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
    registerModel.languageOfCv = cvLanguage.text;
    registerModel.address = adress.text;
    registerModel.cv = File(cv!.path!);
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
    registerModel.studies.add(Study(
      univirsity: university.text,
      department: department.text,
      year: DateTime.parse(year.text),
      degree: degree.text,
    ));
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
    university.text = registerModel.studies[index].univirsity!;
    degree.text = registerModel.studies[index].degree!;
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
    for (var element in registerModel.work) {
      if (element.now == true) {
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
    registerModel.work.add(
      Work(
        jopTitle: jobTitle.text,
        companyName: companyName.text,
        discrib: jopDescription.text,
        location: location.text,
        startDate: DateTime.parse(beginDate.text),
        endDate: DateTime.parse(endDate.text),
        now: workHereNow,
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
    registerModel.work.removeAt(index);
    emit(DeleteWorkExperiance());
  }

  void editWork(int index) {
    jobTitle.text = registerModel.work[index].jopTitle!;
    companyName.text = registerModel.work[index].companyName!;
    jopDescription.text = registerModel.work[index].discrib!;
    location.text = registerModel.work[index].location!;
    beginDate.text = registerModel.work[index].startDate.toString();
    endDate.text = registerModel.work[index].endDate.toString();
    workHereNow = registerModel.work[index].now!;
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
    registerModel.certifications.add(Certification(
      name: cirtificationTitle.text,
      given: cirtificationGivenBy.text,
      at: DateTime.parse(cirtificationGivenDate.text),
      describ: cirtificationdescription.text,
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
    registerModel.language.add(suggestion);
    var lang = registerModel.language.toSet();
    registerModel.language = lang.toList();

    emit(AddLanguage());
  }

  void deleteLanguage(String e) {
    registerModel.language.remove(e);
    emit(DeleteLanguage());
  }
  void addSkills(String suggestion) {
    registerModel.skills.add(suggestion);
    var skills = registerModel.skills.toSet();
    registerModel.language = skills.toList();

    emit(AddLanguage());
  }

  void deleteSkill(String e) {
    registerModel.language.remove(e);
    emit(DeleteLanguage());
  }
}
