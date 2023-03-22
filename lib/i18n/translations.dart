import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Translations {
  Translations(this._languageCode);

//  final Locale locale;

  final String _languageCode;

  Map<String, String>? get _vocabularies => _localizedValues[_languageCode];

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations) ??
        Translations('ar');
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'switch_language': 'Switch Language',
      'Home': 'Home',
      'search_for_bank_blood': 'Search for bank blood',
      'choose': 'Choose',
      'choose_blood_type': 'Choose Blood Type',
      'search': 'Search',
      'Search_by_compatible_type': 'Search by compatible type',
      'donors': 'Donors',
      'Name': 'Name ',
      'address': 'Address',
      'age': 'Age',
      'donate': 'Donate',
      'full_name': 'Full name',
      'donor_name': 'Donor Name',
      'donor_age': 'Donor Age',
      'donor_address': 'Donor Address',
      'phone_number': 'Phone Number',
      'Donor_blood_type': 'Donor Blood Type',
      'Sign_as_volunteer': 'Sign as a donor',
      'hospital_name': 'Hospital Name',
      'available_bottles': 'Available Bottles',
      'result': 'Results',
      'language': 'Language',
      'account_info': 'Account Information',
      'dark_mode': 'Dark Mode',
      'logout': 'Logout',
      'settings': 'Settings',
      'account_information': 'Account Information',
      'karekh': 'Karekh',
      'rassafa': 'Rassafa',
      'a+': 'A+',
      'a-': 'A-',
      'ab+': 'AB+',
      'ab-': 'AB-',
      'b+': 'B+',
      'b-': 'B-',
      'o+': 'O+',
      'o-': 'O-',
      'call': 'Call',
      'cancel': 'Cancel',
      'do_you_want_to_call': 'Do you want to call?',
      'help_to_save_millions_by_donating_blood':
          'Help to save millions by donating blood',
      'donorPhoneNumber': 'Donor Phone Number',
      'compatible_types': 'Compatible Types',

      'first_name': 'First Name',
      'enter_first_name': 'Enter your first Name',
      'last_name': 'Last Name',
      'enter_last_name': 'Enter your last Name',
      'email_address': 'Email address',
      'email_hint': 'user@example.com',
      'enter_address': 'Enter your address',
      'gender': 'Gender',
      'birth_date': 'Birth date',
      'blood_type': 'Blood Type',
      'register': 'Register',
      'choose_your_blood_type': 'Choose your blood type',
      'not_available': 'Not Available',
      'have_account': 'If you already have an account',
      'you_can': 'You can',
      'login_here': 'Login here!',
      'password': 'Password',
      'password_hint': 'at least 8 characters',
      'loading': 'Loading...',
      'thisFieldIsRequired': 'This field is required',
      'male': 'Male',
      'female': 'Female',
      'select_your_gender': 'Select your gender',
      'register_here': 'Register here!',
      'login': 'Login',
      'dont_have_account': 'If you don\'t have an account',
      'please_enter_valid_information': 'Please enter valid information!',
      'please_login_first': 'Please login  first!',
      'enter_phone_number': 'Enter phone number',
      'error': 'Error, check your data and make sure you are online',
      'are_you_sure': 'Are you sure?',
      'no_donors': 'We couldn\'t find any donor',
      'not_found': 'Not found',

      'cancel_order': 'Cancel Order',
      'back': 'Back',
      'msg_cancel_order': 'Will cancel order?',
      'order_now': 'Order Now',
      'nearest_location': 'Nearest Location',
      'customer_name': 'Customer Name',
      'customer_mobile_number': 'Customer Mobile Number',
      'order_total': 'Order Total',
      'review_order': 'Review Order',
      'msg_enter_pin_code_from_sms':
          'Please enter the pin code sent to you by SMS',
      'the_restaurant': 'A Restaurant',
      'msg_enter_mobile_name': 'Please Enter Mobile Number',
      'msg_enter_restaurant_name': 'Please Enter Restaurant Name',
      'msg_enter_pin_code': 'Please Enter PIN Code Correctly',
      'verify': 'Verify',
      'proceed': 'Proceed',
      'pin': 'PIN',
      // 'name': 'Restaurant Name',
      'mobile_number': 'Mobile Number',
      'ok': 'Ok',
      // 'cancel': 'Cancel',
      'location_permission_required': 'Location Required',
      'msg_location_permission_required':
          'Too access all of the app\'s features, consider granting GPS permissions',
      'confirm_order': 'Confirm Order',
      'total_price': 'Total Price',
      'delivery_cost': 'Delivery Cost',
      'add_to_order': 'Add to Order',
      'special_notes': 'Special Notes',
      'dish_order_special_instructions':
          'If you have any note about the order, please write it here..',
      'all_dishes': 'All Dishes',
      'disabled_dishes': 'Disabled dishes',
      'find_city_name': 'find city name...',
      'new_order': 'New Order',
      'order': 'Order',
      'more': 'More',
      'not_found': 'Not found!',
      'food_categories': 'Dishes',
      'msg_error_loading_content': 'Error Loading Content!',
      'empty': 'Empty content',
      'app_name': 'Talabatey Partner',
      'no_internet': 'No Internet Connection',
    },
    'ar': {
      'switch_language': 'تغيير اللغة',
      'Home': 'الصفحة الرئيسية',
      'search_for_bank_blood': 'بحث عن مصرف دم',
      'choose': 'اختر',
      'choose_blood_type': 'اختر فصيلة الدم',
      'search': 'بحث',
      'Search_by_compatible_type': 'بحث عن طريق الفصيلة المتوافقة',
      'donors': 'المتبرعين',
      'Name': 'الأسم: ',
      'address': 'العنوان:',
      'age': 'العمر:',
      'donate': 'تبرع',
      'full_name': 'الأسم الكامل',
      'donor_name': 'اسم المتبرع',
      'donor_age': 'عمر المتبرع',
      'donor_address': 'عنوان المتبرع',
      'phone_number': 'رقم الموبايل',
      'Donor_blood_type': 'فصيلة دم المتبرع',
      'Sign_as_volunteer': 'سجل كـمتبرع',
      'hospital_name': 'أسم المستشفى',
      'available_bottles': 'عدد الأكياس المتاحة',
      'result': 'النتائج',
      'language': 'اللغة',
      'account_info': 'معلومات الحساب',
      'dark_mode': 'الوضع المظلم',
      'logout': 'تسجيل الخروج',
      'settings': 'الأعدادت',
      'account_information': 'معلومات الحساب',
      'karekh': 'كرخ',
      'rassafa': 'رصافة',
      'a+': '+A',
      'a-': '-A',
      'ab+': '+AB',
      'ab-': '-AB',
      'b+': '+B',
      'b-': '-B',
      'o+': '+O',
      'o-': '-O',
      'do_you_want_to_call': 'هل تريد الأتصال؟',
      'call': 'اتصال',
      'cancel': 'الغاء',
      'help_to_save_millions_by_donating_blood':
          'تبرع وساهم بأنقاذ حياة الملايين',
      'donorPhoneNumber': 'رقم هاتف المتبرع',
      'compatible_types': 'الفصائل المتوافقة',
      'no_internet': 'لا يوجد اتصال بالأنترنت',
      'first_name': 'الأسم الأول',
      'enter_first_name': 'ادخل اسمك الأول',
      'last_name': 'الأسم الأخير',
      'enter_last_name': 'ادخل اسمك الأخير',
      'email_address': 'عنوان البريد الألكتروني',
      'email_hint': 'user@example.com',
      'enter_address': 'ادخل عنوانك',
      'gender': 'الجنس',
      'birth_date': 'تأريخ الميلاد',
      'blood_type': 'فصيلة الدم',
      'register': 'التسجيل',
      'choose_your_blood_type': 'اختر فصيلة دمك',
      'not_available': 'غير متوفر',
      'password': 'كلمة السر',
      'password_hint': 'يجب ان تحتوي 8 احرف او ارقام على الأقل',
      'loading': 'يرجى الأنتظار...',
      'thisFieldIsRequired': 'هذا الحقل مطلوب',
      'male': 'ذكر',
      'female': 'انثى',
      'select_your_gender': 'اختر الجنس',
      'register_here': 'التسجيل',
      'login': 'تسجيل الدخول',
      'dont_have_account': 'اذا لم يكن لديك حساب',
      'you_can': 'تستطيع',
      'have_account': 'لديك حساب بالفعل؟',
      'login_here': 'تسجيل الدخول!',
      'please_enter_valid_information': 'الرجاء ادخال معلومات صحيحة!',
      'please_login_first': 'الرجاء تسجيل الدخول اولًا',
      'enter_phone_number': 'ادخل رقم الهاتف',
      'error': 'خطأ, تأكد من ادخال معلومات صحيحة وانك متصل بالأنترنت!',
      'are_you_sure': 'هل انت متأكد؟',
      'no_donors': 'لم نستطع ايجاد اي متبرع!',
      'not_found': 'غير متاح'
    },
  };

  String get switchLanguage => _vocabularies?['switch_language'] as String;

  String get error => _vocabularies?['error'] as String;

  String get noDonors => _vocabularies?['no_donors'] as String;

  String get notFound => _vocabularies?['not_found'] as String;

  String get choose => _vocabularies?['choose'] as String;

  String get chooseBloodType => _vocabularies?['choose_blood_type'] as String;

  String get search => _vocabularies?['search'] as String;

  String get searchByCompatibleTypes =>
      _vocabularies?['Search_by_compatible_type'] as String;

  String get donors => _vocabularies?['donors'] as String;

  String get name => _vocabularies?['Name'] as String;

  String get address => _vocabularies?['address'] as String;

  String get age => _vocabularies?['age'] as String;

  String get enterPhoneNumber => _vocabularies?['enter_phone_number'] as String;

  String get donate => _vocabularies?['donate'] as String;

  String get fullName => _vocabularies?['full_name'] as String;

  String get donorName => _vocabularies?['donor_name'] as String;

  String get donorAge => _vocabularies?['donor_age'] as String;

  String get donorAddress => _vocabularies?['donor_address'] as String;

  String get phoneNumber => _vocabularies?['phone_number'] as String;

  String get hospitalName {
    return _vocabularies?['hospital_name'] as String;
  }

  String get donorBloodType {
    return _vocabularies?['Donor_blood_type'] as String;
  }

  String get signAsDonor {
    return _vocabularies?['Sign_as_volunteer'] as String;
  }

  String get availableBottles {
    return _vocabularies?['available_bottles'] as String;
  }

  String get result {
    return _vocabularies?['result'] as String;
  }

  String get language {
    return _vocabularies?['language'] as String;
  }

  String get darkMode {
    return _vocabularies?['dark_mode'] as String;
  }

  String get logout {
    return _vocabularies?['logout'] as String;
  }

  String get searchForBankBlood {
    return _vocabularies?['search_for_bank_blood'] as String;
  }

  String get home {
    return _vocabularies?['Home'] as String;
  }

  String get logOut {
    return _vocabularies?['logout'] as String;
  }

  String get settings {
    return _vocabularies?['settings'] as String;
  }

  String get accountInformation {
    return _vocabularies?['account_information'] as String;
  }

  String get karekh {
    return _vocabularies?['karekh'] as String;
  }

  String get rassafa {
    return _vocabularies?['rassafa'] as String;
  }

  String get aPlus {
    return _vocabularies?['a+'] as String;
  }

  String get aMinus {
    return _vocabularies?['a-'] as String;
  }

  String get bPlus {
    return _vocabularies?['b+'] as String;
  }

  String get bMinus {
    return _vocabularies?['b-'] as String;
  }

  String get abPlus {
    return _vocabularies?['ab+'] as String;
  }

  String get abMinus {
    return _vocabularies?['ab-'] as String;
  }

  String get oPlus {
    return _vocabularies?['o+'] as String;
  }

  String get oMinus {
    return _vocabularies?['o-'] as String;
  }

  String get doYouWantToCall {
    return _vocabularies?['do_you_want_to_call'] as String;
  }

  String get call {
    return _vocabularies?['call'] as String;
  }

  // ignore: non_constant_identifier_names
  String get help_to_save_millions_by_donating_blood {
    return _vocabularies?['help_to_save_millions_by_donating_blood'] as String;
  }

  String get donorPhoneNumber {
    return _vocabularies?['donorPhoneNumber'] as String;
  }

  String get compatibleTypes {
    return _vocabularies?['compatible_types'] as String;
  }

  String get verify {
    return _vocabularies?['verify'] as String;
  }

  String get areYouSure {
    return _vocabularies?['are_you_sure'] as String;
  }

  String get proceed {
    return _vocabularies?['proceed'] as String;
  }

  String get mobileNumber {
    return _vocabularies?['mobile_number'] as String;
  }

  String get noInternet {
    return _vocabularies?['no_internet'] as String;
  }

  // String get name {
  //   return _vocabularies?['name'] as String;
  // }

  String get ok {
    return _vocabularies?['ok'] as String;
  }

  String get cancel {
    return _vocabularies?['cancel'] as String;
  }

  String get firstName {
    return _vocabularies?['first_name'] as String;
  }

  String get enterFirstName {
    return _vocabularies?['enter_first_name'] as String;
  }

  String get lastName {
    return _vocabularies?['last_name'] as String;
  }

  String get enterLastName {
    return _vocabularies?['enter_last_name'] as String;
  }

  String get emailAddress {
    return _vocabularies?['email_address'] as String;
  }

  String get enterAddress {
    return _vocabularies?['enter_address'] as String;
  }

  String get emailHint {
    return _vocabularies?['email_hint'] as String;
  }

  String get gender {
    return _vocabularies?['gender'] as String;
  }

  String get birthDate {
    return _vocabularies?['birth_date'] as String;
  }

  String get bloodType {
    return _vocabularies?['blood_type'] as String;
  }

  String get register {
    return _vocabularies?['register'] as String;
  }

  String get chooseYourBloodType {
    return _vocabularies?['choose_your_blood_type'] as String;
  }

  String get notAvailable {
    return _vocabularies?['not_available'] as String;
  }

  String get haveAccount {
    return _vocabularies?['have_account'] as String;
  }

  String get youCan {
    return _vocabularies?['you_can'] as String;
  }

  String get loginHere {
    return _vocabularies?['login_here'] as String;
  }

  String get passwordHint {
    return _vocabularies?['password_hint'] as String;
  }

  String get password {
    return _vocabularies?['password'] as String;
  }

  String get loading {
    return _vocabularies?['loading'] as String;
  }

  String get thisFieldIsRequired {
    return _vocabularies?['thisFieldIsRequired'] as String;
  }

  String get male {
    return _vocabularies?['male'] as String;
  }

  String get female {
    return _vocabularies?['female'] as String;
  }

  String get pleaseEnterValidInformation {
    return _vocabularies?['please_enter_valid_information'] as String;
  }

  String get pleaseLoginFirst {
    return _vocabularies?['please_login_first'] as String;
  }

  String get chooseYourGender {
    return _vocabularies?['select_your_gender'] as String;
  }

  String get dontHaveAccount {
    return _vocabularies?['dont_have_account'] as String;
  }

  String get registerHere {
    return _vocabularies?['register_here'] as String;
  }

  String get login {
    return _vocabularies?['login'] as String;
  }
}

class MyDefaultCupertinoLocalizations extends CupertinoLocalizations {
  MyDefaultCupertinoLocalizations(this._languageCode)
      : assert(_languageCode != null);

  final _en = const DefaultCupertinoLocalizations();

  final String _languageCode;

  static final Map<String, Map<String, String>> _dict = {
    'en': {
      'alert': 'Alert',
      'copy': 'Copy',
      'paste': 'Paste',
      'cut': 'Cut',
      'selectAll': 'Select all',
      'today': 'Today',
      'dismiss_the_tab': 'Dismiss the tab',
      'find': 'Find',
    },
    'ar': {
      'alert': 'تنبيه',
      'copy': 'نسخ',
      'paste': 'لصق',
      'cut': 'قص',
      'selectAll': 'تحديد الكل',
      'today': 'اليوم',
      'dismiss_the_tab': 'إلغاء الضغط',
      'find': 'بحث'
    }
  };

  @override
  String get alertDialogLabel => _get('alert');

  @override
  String get anteMeridiemAbbreviation => _en.anteMeridiemAbbreviation;

  @override
  String get postMeridiemAbbreviation => _en.postMeridiemAbbreviation;

  @override
  String get copyButtonLabel => _get('copy');

  @override
  String get cutButtonLabel => _get('cut');

  @override
  String get pasteButtonLabel => _get('paste');

  @override
  String get selectAllButtonLabel => _get('selectAll');

  @override
  DatePickerDateOrder get datePickerDateOrder => _en.datePickerDateOrder;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      _en.datePickerDateTimeOrder;

  @override
  String datePickerDayOfMonth(int dayIndex) =>
      _en.datePickerDayOfMonth(dayIndex);

  @override
  String datePickerHour(int hour) => _en.datePickerHour(hour);

  @override
  String datePickerHourSemanticsLabel(int hour) =>
      _en.datePickerHourSemanticsLabel(hour);

  @override
  String datePickerMediumDate(DateTime date) => _en.datePickerMediumDate(date);

  @override
  String datePickerMinute(int minute) => _en.datePickerMinute(minute);

  @override
  String datePickerMinuteSemanticsLabel(int minute) =>
      _en.datePickerMinuteSemanticsLabel(minute);

  @override
  String datePickerMonth(int monthIndex) => _en.datePickerMonth(monthIndex);

  @override
  String datePickerYear(int yearIndex) => _en.datePickerYear(yearIndex);

  @override
  String timerPickerHour(int hour) => _en.timerPickerHour(hour);

  @override
  String timerPickerHourLabel(int hour) => _en.timerPickerHourLabel(hour);

  @override
  String timerPickerMinute(int minute) => _en.timerPickerMinute(minute);

  @override
  String timerPickerMinuteLabel(int minute) =>
      _en.timerPickerMinuteLabel(minute);

  @override
  String timerPickerSecond(int second) => _en.timerPickerSecond(second);

  @override
  String timerPickerSecondLabel(int second) =>
      _en.timerPickerSecondLabel(second);

  String _get(String key) {
    return _dict[_languageCode]?[key] ?? "unknown";
  }

  @override
  String get todayLabel => _get('today');

  @override
  String get modalBarrierDismissLabel => _get('dismiss_the_tab');

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    return 'Tab $tabIndex, tab count: $tabCount';
  }

  @override
  String get searchTextFieldPlaceholderLabel => _get('find');

  @override
  List<String> get timerPickerHourLabels => [];

  @override
  List<String> get timerPickerMinuteLabels => [];

  @override
  List<String> get timerPickerSecondLabels => [];
}
