import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Translations {
  Translations(this._languageCode);

//  final Locale locale;

  final String _languageCode;

  Map<String, String>? get _vocabularies => _localizedValues[_languageCode];

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations) ?? Translations('ar');
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'switch_language': 'Switch Language',
      'msg_please_enter_all_fields': 'Please enter all required fields',
      'two_hours': 'hours',
      'hour': 'hour',
      'hours': 'hours',
      'msg_will_close_restaurant_hours': 'Will close the restaurant for',
      'msg_close_restaurant_hours': 'How many hours would you like to close the restaurant?',
      'about_app': 'About',
      'msg_please_enter_text': 'Please type the note...',
      'notes': 'Notes',
      'send': 'Send',
      'msg_complaints_and_suggestions': 'If you have any feedback, complaints, or suggestions, please type it here',
      'complaints_and_suggestions': 'Complaints and Suggestions',
      'notifications_history': 'Notifications',
      'msg_logout_confirmation': 'Are you sure you want to logout?',
      'msg_all_dishes_enabled': 'All dishes are enabled',
      'msg_rest_is_opened': 'Restaurant is open now',
      'msg_rest_is_closed': 'Restaurant is closed',
      'msg_rest_closed_open_it': 'Restaurant is closed. Would you like to open it?',
      'enter_closing_hours_here': 'For how many hours do you want to close the restaurant?',
      'msg_close_restaurant': 'Restaurant is open, do you want to close it?',
      'msg_open_restaurant': 'Restaurant is closed, do you want to open it?',
      'close_restaurant': 'Close Restaurant',
      'open_restaurant': 'Open Restaurant',
      'previous_orders': 'Previous Orders',
      'logout': 'Logout',
      'request_driver': 'Request a Driver',
      'cancel_order': 'Cancel Order',
      'back': 'Back',
      'msg_cancel_order': 'Will cancel order?',
      'order_now': 'Order Now',
      'nearest_location': 'Nearest Location',
      'customer_name': 'Customer Name',
      'customer_mobile_number': 'Customer Mobile Number',
      'order_total': 'Order Total',
      'review_order': 'Review Order',
      'msg_enter_pin_code_from_sms': 'Please enter the pin code sent to you by SMS',
      'the_restaurant': 'A Restaurant',
      'msg_enter_mobile_name': 'Please Enter Mobile Number',
      'msg_enter_restaurant_name': 'Please Enter Restaurant Name',
      'msg_enter_pin_code': 'Please Enter PIN Code Correctly',
      'verify': 'Verify',
      'proceed': 'Proceed',
      'pin': 'PIN',
      'name': 'Restaurant Name',
      'mobile_number': 'Mobile Number',
      'ok': 'Ok',
      'cancel': 'Cancel',
      'location_permission_required': 'Location Required',
      'msg_location_permission_required': 'Too access all of the app\'s features, consider granting GPS permissions',
      'confirm_order': 'Confirm Order',
      'total_price': 'Total Price',
      'delivery_cost': 'Delivery Cost',
      'add_to_order': 'Add to Order',
      'special_notes': 'Special Notes',
      'dish_order_special_instructions': 'If you have any note about the order, please write it here..',
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
    },
    'ar': {
      'switch_language': 'تغيير اللغة',
      'msg_please_enter_all_fields': 'يرجى كتابة كافة الحقول',
      'two_hours': 'ساعتين',
      'hour': 'ساعة',
      'hours': 'ساعات',
      'msg_will_close_restaurant_hours': 'سيتم إغلاق المطعم لمدة',
      'msg_close_restaurant_hours': 'يرجى تحديد عدد ساعات إغلاق المطعم',
      'about_app': 'حول التطبيق',
      'msg_please_enter_text': 'يرجى كتابة الملاحظة...',
      'notes': 'الملاحظات',
      'send': 'إرسال',
      'msg_complaints_and_suggestions': 'يرجى كتابة الملاحظات ، أو الشكاوي والإقتراحات هنا',
      'complaints_and_suggestions': 'الشكاوي والإقتراحات',
      'notifications_history': 'الإشعارات',
      'msg_logout_confirmation': 'متأكد من تسجيل الخروج؟',
      'msg_all_dishes_enabled': 'لا توجد أطباق متوقفة',
      'msg_rest_is_opened': 'المطعم مفتوح الآن',
      'msg_rest_is_closed': 'تم إغلاق المطعم',
      'msg_rest_closed_open_it': 'المطعم مغلق. هل تريد فتح المطعم؟',
      'enter_closing_hours_here': 'كم ساعة تريد اغلاق المطعم؟',
      'msg_close_restaurant': 'المطعم مفتوح، هل تريد إغلاقه؟',
      'msg_open_restaurant': 'المطعم مغلق، هل تريد فتحة؟',
      'close_restaurant': 'غلق المطعم',
      'open_restaurant': 'فتح المطعم',
      'previous_orders': 'طلبات سابقة',
      'logout': 'تسجيل الخروج',
      'request_driver': 'إستدعاء سائق',
      'cancel_order': 'إلغاء الطلب',
      'back': 'رجوع',
      'msg_cancel_order': 'سوف يتم إلغاء الطلب',
      'order_now': 'أطلب الآن',
      'nearest_location': 'أقرب نقطة دالّة',
      'customer_mobile_number': 'رقم موبايل الزبون',
      'customer_name': 'إسم الزبون',
      'order_total': 'مجموع الطلب',
      'review_order': 'مراجعة الطلب',
      'msg_enter_pin_code_from_sms': 'يرجى إدخال الرمز الذي تم إرساله إليك عن طريق الـ SMS',
      'the_restaurant': 'مطعم',
      'msg_enter_mobile_name': 'يرجى إدخال رقم الموبايل',
      'msg_enter_restaurant_name': 'يرجى إدخال إسم المطعم',
      'msg_enter_pin_code': 'يرجى إدخال الرمز صحيحاً',
      'verify': 'تأكيد',
      'proceed': 'متابعة',
      'pin': 'الرمز من الرسالة التي وصلتك',
      'name': 'إسم المطعم',
      'mobile_number': 'رقم الموبايل',
      'ok': 'موافق',
      'cancel': 'إلغاء',
      'location_permission_required': 'السماح للموقع',
      'msg_location_permission_required': 'للحصول على كافه ميزات وعروض التطبيق ، الرجاء السماح باستخدام خدمات المواقع GPS',
      'confirm_order': 'تأكيد الطلب',
      'total_price': 'السعر الكلي',
      'delivery_cost': 'كلفة التوصيل',
      'add_to_order': 'إضافة إلى الطلب',
      'special_notes': 'ملاحظات خاصة',
      'dish_order_special_instructions': 'إذا كانت لديك أي ملاحظة تخص الطلب ، يرجى كتابتها هنا..',
      'all_dishes': 'كافة الأطباق',
      'disabled_dishes': 'أطباق متوقفة',
      'find_city_name': 'بحث عن مدينة...',
      'new_order': 'طلبية جديدة',
      'order': 'طلبية',
      'more': 'المزيد',
      'not_found': 'غير موجود!',
      'food_categories': 'الأصناف',
      'msg_error_loading_content': 'مشكلة في تنزيل المحتويات!',
      'empty': 'فارغ',
      'app_name': 'طلباتي للمطاعم',
    },
  };

  String get switchLanguage => _vocabularies?['switch_language'] as String;

  String get msgPleaseEnterAllFields => _vocabularies?['msg_please_enter_all_fields'] as String;

  String get twoHours => _vocabularies?['two_hours'] as String;

  String get hour => _vocabularies?['hour'] as String;

  String get hours => _vocabularies?['hours'] as String;

  String get msgWillCloseRestaurantHours => _vocabularies?['msg_will_close_restaurant_hours'] as String;

  String get msgCloseRestaurantHours => _vocabularies?['msg_close_restaurant_hours'] as String;

  String get aboutApp => _vocabularies?['about_app'] as String;

  String get msgPleaseEnterText => _vocabularies?['msg_please_enter_text'] as String;

  String get notes => _vocabularies?['notes'] as String;

  String get send => _vocabularies?['send'] as String;

  String get msgComplaintsAndSuggestions => _vocabularies?['msg_complaints_and_suggestions'] as String;

  String get complaintsAndSuggestions => _vocabularies?['complaints_and_suggestions'] as String;

  String get notificationsHistory => _vocabularies?['notifications_history'] as String;

  String get msgLogoutConfirmation => _vocabularies?['msg_logout_confirmation'] as String;

  String get msgNoDisabledDishes {
    return _vocabularies?['msg_all_dishes_enabled'] as String;
  }

  String get msgRestaurantIsOpened {
    return _vocabularies?['msg_rest_is_opened'] as String;
  }

  String get msgRestaurantIsClosed {
    return _vocabularies?['msg_rest_is_closed'] as String;
  }

  String get msgRestClosedOpenIt {
    return _vocabularies?['msg_rest_closed_open_it'] as String;
  }

  String get openRestaurant {
    return _vocabularies?['open_restaurant'] as String;
  }

  String get closeRestaurant {
    return _vocabularies?['close_restaurant'] as String;
  }

  String get msgOpenRestaurant {
    return _vocabularies?['msg_open_restaurant'] as String;
  }

  String get msgCloseRestaurant {
    return _vocabularies?['msg_close_restaurant'] as String;
  }

  String get enterClosingHours {
    return _vocabularies?['enter_closing_hours_here'] as String;
  }

  String get previousOrders {
    return _vocabularies?['previous_orders'] as String;
  }

  String get logout {
    return _vocabularies?['logout'] as String;
  }

  String get openCloseRestaurant {
    return _vocabularies?['open_close_restaurant'] as String;
  }

  String get requestDriver {
    return _vocabularies?['request_driver'] as String;
  }

  String get pin {
    return _vocabularies?['pin'] as String;
  }

  String get msgCancelOrder {
    return _vocabularies?['msg_cancel_order'] as String;
  }

  String get back {
    return _vocabularies?['back'] as String;
  }

  String get cancelOrder {
    return _vocabularies?['cancel_order'] as String;
  }

  String get orderNow {
    return _vocabularies?['order_now'] as String;
  }

  String get customerNearestLocation {
    return _vocabularies?['nearest_location'] as String;
  }

  String get customerMobile {
    return _vocabularies?['customer_mobile_number'] as String;
  }

  String get customerName {
    return _vocabularies?['customer_name'] as String;
  }

  String get orderTotal {
    return _vocabularies?['order_total'] as String;
  }

  String get reviewOrder {
    return _vocabularies?['review_order'] as String;
  }

  String get msgEnterPinCodeFromSMS {
    return _vocabularies?['msg_enter_pin_code_from_sms'] as String;
  }

  String get theRestaurant {
    return _vocabularies?['the_restaurant'] as String;
  }

  String get msgEnterMobileNumber {
    return _vocabularies?['msg_enter_mobile_name'] as String;
  }

  String get msgEnterRestaurantName {
    return _vocabularies?['msg_enter_restaurant_name'] as String;
  }

  String get msgEnterPinCode {
    return _vocabularies?['msg_enter_pin_code'] as String;
  }

  String get verify {
    return _vocabularies?['verify'] as String;
  }

  String get proceed {
    return _vocabularies?['proceed'] as String;
  }

  String get mobileNumber {
    return _vocabularies?['mobile_number'] as String;
  }

  String get name {
    return _vocabularies?['name'] as String;
  }

  String get ok {
    return _vocabularies?['ok'] as String;
  }

  String get cancel {
    return _vocabularies?['cancel'] as String;
  }

  String get locationPermissionRequiredMessage {
    return _vocabularies?['msg_location_permission_required'] as String;
  }

  String get locationPermissionRequired {
    return _vocabularies?['location_permission_required'] as String;
  }

  String get confirmOrder {
    return _vocabularies?['confirm_order'] as String;
  }

  String get totalPrice {
    return _vocabularies?['total_price'] as String;
  }

  String get deliveryCost {
    return _vocabularies?['delivery_cost'] as String;
  }

  String get addToOrder {
    return _vocabularies?['add_to_order'] as String;
  }

  String get specialNotes {
    return _vocabularies?['special_notes'] as String;
  }

  String get dishOrderSpecialInstructions {
    return _vocabularies?['dish_order_special_instructions'] as String;
  }

  String get allDishes {
    return _vocabularies?['all_dishes'] as String;
  }

  String get disabledDishes {
    return _vocabularies?['disabled_dishes'] as String;
  }

  String get findCityName {
    return _vocabularies?['find_city_name'] as String;
  }

  String get newOrder {
    return _vocabularies?['new_order'] as String;
  }

  String get order {
    return _vocabularies?['order'] as String;
  }

  String get more {
    return _vocabularies?['more'] as String;
  }

  String get notFound {
    return _vocabularies?['not_found'] as String;
  }

  String get foodCategories {
    return _vocabularies?['food_categories'] as String;
  }

  String get empty {
    return _vocabularies?['empty'] as String;
  }

  String get msgErrorLoadingContent {
    return _vocabularies?['msg_error_loading_content'] as String;
  }

  String get appName {
    return _vocabularies?['app_name'] as String;
  }
}

class MyDefaultCupertinoLocalizations extends CupertinoLocalizations {
  MyDefaultCupertinoLocalizations(this._languageCode) : assert(_languageCode != null);

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
  DatePickerDateTimeOrder get datePickerDateTimeOrder => _en.datePickerDateTimeOrder;

  @override
  String datePickerDayOfMonth(int dayIndex) => _en.datePickerDayOfMonth(dayIndex);

  @override
  String datePickerHour(int hour) => _en.datePickerHour(hour);

  @override
  String datePickerHourSemanticsLabel(int hour) => _en.datePickerHourSemanticsLabel(hour);

  @override
  String datePickerMediumDate(DateTime date) => _en.datePickerMediumDate(date);

  @override
  String datePickerMinute(int minute) => _en.datePickerMinute(minute);

  @override
  String datePickerMinuteSemanticsLabel(int minute) => _en.datePickerMinuteSemanticsLabel(minute);

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
  String timerPickerMinuteLabel(int minute) => _en.timerPickerMinuteLabel(minute);

  @override
  String timerPickerSecond(int second) => _en.timerPickerSecond(second);

  @override
  String timerPickerSecondLabel(int second) => _en.timerPickerSecondLabel(second);

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
