import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app_texts/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @areYou.
  ///
  /// In en, this message translates to:
  /// **'Are you'**
  String get areYou;

  /// No description provided for @person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get person;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get business;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @begainDate.
  ///
  /// In en, this message translates to:
  /// **'Begin Date'**
  String get begainDate;

  /// No description provided for @languageOfCV.
  ///
  /// In en, this message translates to:
  /// **'Language of CV'**
  String get languageOfCV;

  /// No description provided for @uploadCV.
  ///
  /// In en, this message translates to:
  /// **'Upload CV'**
  String get uploadCV;

  /// No description provided for @workExperiances.
  ///
  /// In en, this message translates to:
  /// **'Work Experiances'**
  String get workExperiances;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for?'**
  String get searchHint;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @studies.
  ///
  /// In en, this message translates to:
  /// **'Studies'**
  String get studies;

  /// No description provided for @university.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get university;

  /// No description provided for @degree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get degree;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year '**
  String get year;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @fillterPage.
  ///
  /// In en, this message translates to:
  /// **'Search Filter'**
  String get fillterPage;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @jopTitle.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get jopTitle;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @guestLogin.
  ///
  /// In en, this message translates to:
  /// **'Guest Login'**
  String get guestLogin;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @areYouLokingFor.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for? '**
  String get areYouLokingFor;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'days ago'**
  String get daysAgo;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'hours ago'**
  String get hoursAgo;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'minutes ago'**
  String get minutesAgo;

  /// No description provided for @secondsAgo.
  ///
  /// In en, this message translates to:
  /// **'seconds ago'**
  String get secondsAgo;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Search Result'**
  String get searchResult;

  /// No description provided for @noResult.
  ///
  /// In en, this message translates to:
  /// **'No Result'**
  String get noResult;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternetConnection;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait'**
  String get pleaseWait;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name Required'**
  String get nameRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password Required'**
  String get passwordRequired;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password Required'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password Not Match'**
  String get passwordNotMatch;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email Required'**
  String get emailRequired;

  /// No description provided for @emailNotValid.
  ///
  /// In en, this message translates to:
  /// **'Email Not Valid'**
  String get emailNotValid;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone Required'**
  String get phoneRequired;

  /// No description provided for @phoneNotValid.
  ///
  /// In en, this message translates to:
  /// **'Phone Not Valid'**
  String get phoneNotValid;

  /// No description provided for @addressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address Required'**
  String get addressRequired;

  /// No description provided for @descriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Description Required'**
  String get descriptionRequired;

  /// No description provided for @locationRequired.
  ///
  /// In en, this message translates to:
  /// **'Location Required'**
  String get locationRequired;

  /// No description provided for @dateRequired.
  ///
  /// In en, this message translates to:
  /// **'Date Required'**
  String get dateRequired;

  /// No description provided for @timeRequired.
  ///
  /// In en, this message translates to:
  /// **'Time Required'**
  String get timeRequired;

  /// No description provided for @priceRequired.
  ///
  /// In en, this message translates to:
  /// **'Price Required'**
  String get priceRequired;

  /// No description provided for @priceNotValid.
  ///
  /// In en, this message translates to:
  /// **'Price Not Valid'**
  String get priceNotValid;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get somethingWentWrong;

  /// No description provided for @tryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'Try Again Later'**
  String get tryAgainLater;

  /// No description provided for @somethingWentWrongPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong, Please Try Again'**
  String get somethingWentWrongPleaseTryAgain;

  /// No description provided for @noInternetConnectionPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection, Please Try Again'**
  String get noInternetConnectionPleaseTryAgain;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noData;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Data Available'**
  String get noDataAvailable;

  /// No description provided for @noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No Data Found'**
  String get noDataFound;

  /// No description provided for @noDataFoundPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'No Data Found, Please Try Again'**
  String get noDataFoundPleaseTryAgain;

  /// No description provided for @noDataFoundPleaseTryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'No Data Found, Please Try Again Later'**
  String get noDataFoundPleaseTryAgainLater;

  /// No description provided for @workType.
  ///
  /// In en, this message translates to:
  /// **'Work Type'**
  String get workType;

  /// No description provided for @workTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Work Type Required'**
  String get workTypeRequired;

  /// No description provided for @workTypeNotValid.
  ///
  /// In en, this message translates to:
  /// **'Work Type Not Valid'**
  String get workTypeNotValid;

  /// No description provided for @partTime.
  ///
  /// In en, this message translates to:
  /// **'Part Time'**
  String get partTime;

  /// No description provided for @fullTime.
  ///
  /// In en, this message translates to:
  /// **'Full Time'**
  String get fullTime;

  /// No description provided for @hourly.
  ///
  /// In en, this message translates to:
  /// **'Hourly'**
  String get hourly;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @hybrid.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get hybrid;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @genderRequired.
  ///
  /// In en, this message translates to:
  /// **'Gender Required'**
  String get genderRequired;

  /// No description provided for @genderNotValid.
  ///
  /// In en, this message translates to:
  /// **'Gender Not Valid'**
  String get genderNotValid;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @ageRequired.
  ///
  /// In en, this message translates to:
  /// **'Age Required'**
  String get ageRequired;

  /// No description provided for @ageNotValid.
  ///
  /// In en, this message translates to:
  /// **'Age Not Valid'**
  String get ageNotValid;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @statusRequired.
  ///
  /// In en, this message translates to:
  /// **'Status Required'**
  String get statusRequired;

  /// No description provided for @single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get single;

  /// No description provided for @married.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get married;

  /// No description provided for @divorced.
  ///
  /// In en, this message translates to:
  /// **'Divorced'**
  String get divorced;

  /// No description provided for @widowed.
  ///
  /// In en, this message translates to:
  /// **'Widowed'**
  String get widowed;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageRequired.
  ///
  /// In en, this message translates to:
  /// **'Language Required'**
  String get languageRequired;

  /// No description provided for @languageNotValid.
  ///
  /// In en, this message translates to:
  /// **'Language Not Valid'**
  String get languageNotValid;

  /// No description provided for @otpVerification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerification;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @thanksRegister.
  ///
  /// In en, this message translates to:
  /// **'Thanks for registering,please Type your OTP for verification your mobiele number'**
  String get thanksRegister;

  /// No description provided for @didntReceiveOtp.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive OTP?'**
  String get didntReceiveOtp;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @forma.
  ///
  /// In en, this message translates to:
  /// **'Forma'**
  String get forma;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @experienceRequired.
  ///
  /// In en, this message translates to:
  /// **'Experience Required'**
  String get experienceRequired;

  /// No description provided for @ads.
  ///
  /// In en, this message translates to:
  /// **'Ads'**
  String get ads;

  /// No description provided for @paswordHint.
  ///
  /// In en, this message translates to:
  /// **'Min . 8 Character'**
  String get paswordHint;

  /// No description provided for @profileImage.
  ///
  /// In en, this message translates to:
  /// **'Profile Image'**
  String get profileImage;

  /// No description provided for @coreInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get coreInfo;

  /// No description provided for @cvInfo.
  ///
  /// In en, this message translates to:
  /// **'CV Information'**
  String get cvInfo;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @applySuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Apply Successfully'**
  String get applySuccessfully;

  /// No description provided for @applySuccessfullyMessage.
  ///
  /// In en, this message translates to:
  /// **'Apply Successfully, please wait until the request is accepted'**
  String get applySuccessfullyMessage;

  /// No description provided for @applySuccessfullyMessageLater.
  ///
  /// In en, this message translates to:
  /// **'Apply Successfully, please wait until the request is accepted later'**
  String get applySuccessfullyMessageLater;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @jopkind.
  ///
  /// In en, this message translates to:
  /// **'Job '**
  String get jopkind;

  /// No description provided for @searchFor.
  ///
  /// In en, this message translates to:
  /// **'Search For'**
  String get searchFor;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @noExperience.
  ///
  /// In en, this message translates to:
  /// **'No Experience'**
  String get noExperience;

  /// No description provided for @noForma.
  ///
  /// In en, this message translates to:
  /// **'No Forma'**
  String get noForma;

  /// No description provided for @noAds.
  ///
  /// In en, this message translates to:
  /// **'No Ads'**
  String get noAds;

  /// No description provided for @noSavedPosts.
  ///
  /// In en, this message translates to:
  /// **'No Saved Posts'**
  String get noSavedPosts;

  /// No description provided for @junior.
  ///
  /// In en, this message translates to:
  /// **'Junior'**
  String get junior;

  /// No description provided for @middle.
  ///
  /// In en, this message translates to:
  /// **'Middle'**
  String get middle;

  /// No description provided for @senior.
  ///
  /// In en, this message translates to:
  /// **'Senior'**
  String get senior;

  /// No description provided for @entryLevel.
  ///
  /// In en, this message translates to:
  /// **'Entry Level'**
  String get entryLevel;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get salary;

  /// No description provided for @salaryRequired.
  ///
  /// In en, this message translates to:
  /// **'Salary from'**
  String get salaryRequired;

  /// No description provided for @salaryFrom.
  ///
  /// In en, this message translates to:
  /// **'Salary From'**
  String get salaryFrom;

  /// No description provided for @salaryTo.
  ///
  /// In en, this message translates to:
  /// **'Salary To'**
  String get salaryTo;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPost;

  /// No description provided for @updatePost.
  ///
  /// In en, this message translates to:
  /// **'Update Post'**
  String get updatePost;

  /// No description provided for @deletePost.
  ///
  /// In en, this message translates to:
  /// **'Delete Post'**
  String get deletePost;

  /// No description provided for @createPostSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Create Post Successfully'**
  String get createPostSuccessfully;

  /// No description provided for @createPostSuccessfullyMessage.
  ///
  /// In en, this message translates to:
  /// **'Post Created Successfully, please wait until the request is accepted'**
  String get createPostSuccessfullyMessage;

  /// No description provided for @createPostSuccessfullyMessageLater.
  ///
  /// In en, this message translates to:
  /// **'Post Created Successfully, please wait until the request is accepted later'**
  String get createPostSuccessfullyMessageLater;

  /// No description provided for @createPostNow.
  ///
  /// In en, this message translates to:
  /// **'Create Post Now'**
  String get createPostNow;

  /// No description provided for @createJopPost.
  ///
  /// In en, this message translates to:
  /// **'Create Jop Post'**
  String get createJopPost;

  /// No description provided for @postTitle.
  ///
  /// In en, this message translates to:
  /// **'Post Title'**
  String get postTitle;

  /// No description provided for @postTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Post Title Required'**
  String get postTitleRequired;

  /// No description provided for @postTitleNotValid.
  ///
  /// In en, this message translates to:
  /// **'Post Title Not Valid'**
  String get postTitleNotValid;

  /// No description provided for @postDescription.
  ///
  /// In en, this message translates to:
  /// **'Post Description'**
  String get postDescription;

  /// No description provided for @postDescriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Post Description Required'**
  String get postDescriptionRequired;

  /// No description provided for @postDescriptionNotValid.
  ///
  /// In en, this message translates to:
  /// **'Post Description Not Valid'**
  String get postDescriptionNotValid;

  /// No description provided for @postImage.
  ///
  /// In en, this message translates to:
  /// **'Post Image'**
  String get postImage;

  /// No description provided for @postImageRequired.
  ///
  /// In en, this message translates to:
  /// **'Post Image Required'**
  String get postImageRequired;

  /// No description provided for @postImageNotValid.
  ///
  /// In en, this message translates to:
  /// **'Post Image Not Valid'**
  String get postImageNotValid;

  /// No description provided for @postType.
  ///
  /// In en, this message translates to:
  /// **'Post Type'**
  String get postType;

  /// No description provided for @postTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Post Type Required'**
  String get postTypeRequired;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @dateOfCreate.
  ///
  /// In en, this message translates to:
  /// **'Date of Create'**
  String get dateOfCreate;

  /// No description provided for @companyInfo.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInfo;

  /// No description provided for @specialization.
  ///
  /// In en, this message translates to:
  /// **'specialization'**
  String get specialization;

  /// No description provided for @upgradePro.
  ///
  /// In en, this message translates to:
  /// **'Upgrade Now - Go Pro'**
  String get upgradePro;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting;

  /// No description provided for @mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get mode;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lang;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @privicy.
  ///
  /// In en, this message translates to:
  /// **'Privicy'**
  String get privicy;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'Apout'**
  String get about;

  /// No description provided for @youShouldFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'You Should Fill All Fields'**
  String get youShouldFillAllFields;

  /// No description provided for @passwordNotVailid.
  ///
  /// In en, this message translates to:
  /// **'Password Not Vailid Enter more than 6 characters'**
  String get passwordNotVailid;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
