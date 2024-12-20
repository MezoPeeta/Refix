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
/// import 'gen_l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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

  /// Title Description
  ///
  /// In en, this message translates to:
  /// **'Write the title here'**
  String get title;

  /// No description provided for @sentence.
  ///
  /// In en, this message translates to:
  /// **'This sentence is used as a substitute for real text in the fields of printing and design.'**
  String get sentence;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **' Skip'**
  String get skip;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello! Register to get started'**
  String get hello;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your new email'**
  String get enter_email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @or_register.
  ///
  /// In en, this message translates to:
  /// **'Or Register with'**
  String get or_register;

  /// No description provided for @or_login.
  ///
  /// In en, this message translates to:
  /// **'Or Login with'**
  String get or_login;

  /// No description provided for @otp_verification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otp_verification;

  /// No description provided for @verify_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we just sent on your phone Number +966XXX XXX XXXX'**
  String get verify_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code after'**
  String get resend_code;

  /// No description provided for @second.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get second;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// User profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get your_profile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Application Language'**
  String get language;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @payment_methods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get payment_methods;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get enter_password;

  /// No description provided for @password_8.
  ///
  /// In en, this message translates to:
  /// **'Password must be atleast 8 characters'**
  String get password_8;

  /// No description provided for @confirm_valid.
  ///
  /// In en, this message translates to:
  /// **'Must be exactly as your password'**
  String get confirm_valid;

  /// No description provided for @renter.
  ///
  /// In en, this message translates to:
  /// **'Please re-enter your password'**
  String get renter;

  /// No description provided for @forgot_pass.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_pass;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enter_address.
  ///
  /// In en, this message translates to:
  /// **'Please add your address'**
  String get enter_address;

  /// No description provided for @add_notes.
  ///
  /// In en, this message translates to:
  /// **'Add Notes'**
  String get add_notes;

  /// No description provided for @have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get have_account;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get register_now;

  /// No description provided for @enter_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get enter_phone;

  /// No description provided for @not_account.
  ///
  /// In en, this message translates to:
  /// **'Already Have An Account?'**
  String get not_account;

  /// No description provided for @signup_welcome.
  ///
  /// In en, this message translates to:
  /// **'Hello! Register to get started'**
  String get signup_welcome;

  /// No description provided for @enter_username.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get enter_username;

  /// No description provided for @sign_in_hello.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Happy to see you, Again!'**
  String get sign_in_hello;

  /// No description provided for @electrical_systems.
  ///
  /// In en, this message translates to:
  /// **'Electrical Systems'**
  String get electrical_systems;

  /// No description provided for @plumbing_systems.
  ///
  /// In en, this message translates to:
  /// **'Plumbing Systems'**
  String get plumbing_systems;

  /// No description provided for @air.
  ///
  /// In en, this message translates to:
  /// **'Air Conditioning'**
  String get air;

  /// No description provided for @fire.
  ///
  /// In en, this message translates to:
  /// **'Fire Fighting Systems'**
  String get fire;

  /// No description provided for @control.
  ///
  /// In en, this message translates to:
  /// **'Control And Automation'**
  String get control;

  /// No description provided for @emergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency Services'**
  String get emergency;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat with us'**
  String get chat;

  /// No description provided for @not_available.
  ///
  /// In en, this message translates to:
  /// **'You want service that is not available'**
  String get not_available;

  /// No description provided for @not_available2.
  ///
  /// In en, this message translates to:
  /// **'You have issue or service you want that is not available in the options'**
  String get not_available2;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search for ‘Air conditioning maintenance’'**
  String get search;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select and it will change throughout the app'**
  String get select;
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
