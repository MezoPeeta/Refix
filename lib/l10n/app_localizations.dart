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
/// import 'l10n/app_localizations.dart';
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
  /// **'Please enter your email'**
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

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @get_discount.
  ///
  /// In en, this message translates to:
  /// **'Get {percentage} discount if you order now'**
  String get_discount(String percentage);

  /// No description provided for @order_now.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get order_now;

  /// No description provided for @choose_service.
  ///
  /// In en, this message translates to:
  /// **'Please choose a service'**
  String get choose_service;

  /// Prompt message asking the user to fill in the input box if they have questions
  ///
  /// In en, this message translates to:
  /// **'If you have any questions, please fill in the input box below.'**
  String get fillInputBox;

  /// A prompt for the user to select the name of a service
  ///
  /// In en, this message translates to:
  /// **'Select Service Name'**
  String get selectServiceName;

  /// Prompt asking the user to app or track a photo related to an issue
  ///
  /// In en, this message translates to:
  /// **'Please App/Track Photo the issue.'**
  String get appTrackPhotoIssue;

  /// A placeholder text commonly used in printing and design to simulate actual content
  ///
  /// In en, this message translates to:
  /// **'This sentence is used as a substitute for real text in the fields of printing and design.'**
  String get substituteTextExplanation;

  /// Option to add or track a photo
  ///
  /// In en, this message translates to:
  /// **'Add/Track Photo'**
  String get addTrackPhoto;

  /// Option to add a new address
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get addAddress;

  /// Prompt to select a date
  ///
  /// In en, this message translates to:
  /// **'Pick Date'**
  String get pickDate;

  /// Button or option to book a service immediately
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// Instruction to take or upload a photo related to the user's problem
  ///
  /// In en, this message translates to:
  /// **'Photo your problem'**
  String get photoYourProblem;

  /// Prompt asking the user to add an address
  ///
  /// In en, this message translates to:
  /// **'Please add address'**
  String get pleaseAddAddress;

  /// Prompt asking the user to add a date
  ///
  /// In en, this message translates to:
  /// **'Please add date'**
  String get pleaseAddDate;

  /// Message informing the user that they can add more services to their current booking
  ///
  /// In en, this message translates to:
  /// **'You can add more services in this booking'**
  String get addMoreServices;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All As Read'**
  String get markAllRead;

  /// Message displayed when there are no notifications available
  ///
  /// In en, this message translates to:
  /// **'You don\'t have notifications at the moment, check later.'**
  String get noNotifications;

  /// Prompt asking the user to enter a new email address
  ///
  /// In en, this message translates to:
  /// **'Enter New Email'**
  String get enterNewEmail;

  /// Prompt asking the user to enter a new phone number
  ///
  /// In en, this message translates to:
  /// **'Enter New Number'**
  String get enterNewPhone;

  /// Payment method option for cash
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// Payment method option for Visa
  ///
  /// In en, this message translates to:
  /// **'Visa'**
  String get visa;

  /// Prompt asking the user to add a credit or debit card
  ///
  /// In en, this message translates to:
  /// **'Add a credit/debit card'**
  String get addCard;

  /// Button label to continue the process
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @discount_next.
  ///
  /// In en, this message translates to:
  /// **'Get a {percentage} discount on your next booking'**
  String discount_next(String percentage);

  /// No description provided for @pointsBalance.
  ///
  /// In en, this message translates to:
  /// **'Points Balance'**
  String get pointsBalance;

  /// No description provided for @endsWithin.
  ///
  /// In en, this message translates to:
  /// **'Ends within {days} days'**
  String endsWithin(String days);

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms And Conditions'**
  String get terms_and_conditions;

  /// No description provided for @about_refix.
  ///
  /// In en, this message translates to:
  /// **'About Refix'**
  String get about_refix;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @discounts_and_updates.
  ///
  /// In en, this message translates to:
  /// **'Discounts and Updates'**
  String get discounts_and_updates;

  /// No description provided for @sms_message.
  ///
  /// In en, this message translates to:
  /// **'SMS Message'**
  String get sms_message;

  /// No description provided for @pop_up_notifications.
  ///
  /// In en, this message translates to:
  /// **'Pop-Up Notifications'**
  String get pop_up_notifications;

  /// No description provided for @share_locations.
  ///
  /// In en, this message translates to:
  /// **'Share locations'**
  String get share_locations;

  /// No description provided for @access_permissions_to_the_system.
  ///
  /// In en, this message translates to:
  /// **'Access permissions to the system'**
  String get access_permissions_to_the_system;

  /// No description provided for @location_sharing_info.
  ///
  /// In en, this message translates to:
  /// **'Location sharing helps the driver provide you with better services. If location sharing is disabled, the driver will not be able to see your location in real-time.'**
  String get location_sharing_info;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Search Results for: {query}'**
  String searchResult(String query);

  /// No description provided for @fineBooking.
  ///
  /// In en, this message translates to:
  /// **'A fine of {fine} SAR will be added if the cancellation is made after'**
  String fineBooking(String fine);

  /// No description provided for @changeEmail.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t changed your email'**
  String get changeEmail;

  /// No description provided for @switchToNewNumber.
  ///
  /// In en, this message translates to:
  /// **'Switch To New Number'**
  String get switchToNewNumber;

  /// No description provided for @currentlyRegisteredNumber.
  ///
  /// In en, this message translates to:
  /// **'The currently registered mobile number is {phone}. Your balance, data, and other account-related information will not be affected.'**
  String currentlyRegisteredNumber(Object phone);

  /// No description provided for @switchNow.
  ///
  /// In en, this message translates to:
  /// **'Switch Now'**
  String get switchNow;

  /// No description provided for @changePhone.
  ///
  /// In en, this message translates to:
  /// **'You\'ve not changed your phone number'**
  String get changePhone;

  /// No description provided for @deleteAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete the account?'**
  String get deleteAccountQuestion;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'Your account will be deleted within 4 days from now.'**
  String get deleteAccountWarning;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @addNoteForWorker.
  ///
  /// In en, this message translates to:
  /// **'Add Note For Worker'**
  String get addNoteForWorker;

  /// No description provided for @cancelBooking.
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking'**
  String get cancelBooking;

  /// No description provided for @addReview.
  ///
  /// In en, this message translates to:
  /// **'Add Review'**
  String get addReview;

  /// No description provided for @costOfService.
  ///
  /// In en, this message translates to:
  /// **'Cost Of Service'**
  String get costOfService;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Payment Method'**
  String get choosePaymentMethod;

  /// No description provided for @sendReview.
  ///
  /// In en, this message translates to:
  /// **'Send Review'**
  String get sendReview;

  /// No description provided for @addStars.
  ///
  /// In en, this message translates to:
  /// **'Please drag or click on the stars for rating'**
  String get addStars;

  /// The cost of the service with the currency symbol.
  ///
  /// In en, this message translates to:
  /// **'{cost} SAR'**
  String cost(String cost);

  /// No description provided for @error_with_pay_title.
  ///
  /// In en, this message translates to:
  /// **'Error With Pay'**
  String get error_with_pay_title;

  /// No description provided for @reservation_added_message.
  ///
  /// In en, this message translates to:
  /// **'Your Reservation Has Been Added, And You Will Be Contacted Soon To Confirm The Reservation At The Phone Number We Have On File.'**
  String get reservation_added_message;

  /// No description provided for @try_another_card.
  ///
  /// In en, this message translates to:
  /// **'Try Another Card'**
  String get try_another_card;

  /// No description provided for @booking_done_title.
  ///
  /// In en, this message translates to:
  /// **'Booking Done!'**
  String get booking_done_title;

  /// No description provided for @show_your_booking.
  ///
  /// In en, this message translates to:
  /// **'Show Your Booking'**
  String get show_your_booking;

  /// No description provided for @back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back To Home'**
  String get back_to_home;

  /// No description provided for @dont_worry_title.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Worry It Occurs.'**
  String get dont_worry_title;

  /// No description provided for @enter_email_message.
  ///
  /// In en, this message translates to:
  /// **'Please Enter The Email Address Linked With Your Account.'**
  String get enter_email_message;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @send_code.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get send_code;

  /// No description provided for @password_changed_title.
  ///
  /// In en, this message translates to:
  /// **'Password Changed!'**
  String get password_changed_title;

  /// No description provided for @password_changed_message.
  ///
  /// In en, this message translates to:
  /// **'Your Password Has Been Changed Successfully.'**
  String get password_changed_message;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back To Login'**
  String get back_to_login;

  /// No description provided for @otp_verification_title.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otp_verification_title;

  /// No description provided for @otp_verification_message.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we just sent to your email'**
  String get otp_verification_message;

  /// No description provided for @points_redeemed_message.
  ///
  /// In en, this message translates to:
  /// **'Points were Redeemed and {percentage}% Discount was obtained'**
  String points_redeemed_message(Object percentage);

  /// No description provided for @report_problem_not_resolved.
  ///
  /// In en, this message translates to:
  /// **'Report the problem not resolved'**
  String get report_problem_not_resolved;

  /// No description provided for @upload_images.
  ///
  /// In en, this message translates to:
  /// **'Uploading images..'**
  String get upload_images;

  /// No description provided for @check_discount.
  ///
  /// In en, this message translates to:
  /// **'Checking discounts..'**
  String get check_discount;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @passwordUniqueness.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be unique from those previously used.'**
  String get passwordUniqueness;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createNewPassword;

  /// No description provided for @photoLimit.
  ///
  /// In en, this message translates to:
  /// **'You can only add 4 photos'**
  String get photoLimit;

  /// No description provided for @addServices.
  ///
  /// In en, this message translates to:
  /// **'Add Services'**
  String get addServices;

  /// No description provided for @fillOtp.
  ///
  /// In en, this message translates to:
  /// **'Please fill OTP'**
  String get fillOtp;

  /// No description provided for @otpVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified OTP successfully'**
  String get otpVerified;

  /// No description provided for @updatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Updated Successfully'**
  String get updatedSuccessfully;

  /// No description provided for @otpLimit.
  ///
  /// In en, this message translates to:
  /// **'You can\'t send more OTPs, maximum 3'**
  String get otpLimit;

  /// No description provided for @notBookedYet.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t booked yet'**
  String get notBookedYet;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @noReviews.
  ///
  /// In en, this message translates to:
  /// **'No reviews for the current service'**
  String get noReviews;

  /// No description provided for @cancelled_succ.
  ///
  /// In en, this message translates to:
  /// **'Booking has cancelled successfully'**
  String get cancelled_succ;
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
