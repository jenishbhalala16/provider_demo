import 'dart:developer';

import '../../config.dart';
import 'language_helper.dart';



class LanguageProvider with ChangeNotifier {
  String currentLanguage = appFonts.english;
  Locale? locale;
  int selectedIndex = 0;
  final SharedPreferences sharedPreferences;

  LanguageProvider(this.sharedPreferences) {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
    log("fdhjgfthj : $selectedLocale");
    if (selectedLocale != null) {
      locale = Locale(selectedLocale);
    } else {
      selectedLocale = "english";
      locale = const Locale("en");
    }
    log("localelocalelocale :$locale");
    setVal(selectedLocale);
  }

  LanguageHelper languageHelper = LanguageHelper();

  void changeLocale(String newLocale) {
    log("sharedPreferences a1: $newLocale");
    Locale convertedLocale;

    currentLanguage = newLocale;
    log("CURRENT $currentLanguage");
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);

    locale = convertedLocale;
    log("CURRENT LOCAL $locale");
    sharedPreferences.setString(
        'selectedLocale', locale!.languageCode.toString());
    notifyListeners();
  }

  getLocal() {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
return selectedLocale;

  }

  defineCurrentLanguage(context) {
    String? definedCurrentLanguage;

    if (currentLanguage.isNotEmpty) {
      definedCurrentLanguage = currentLanguage;
    } else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }

    return definedCurrentLanguage;
  }

  setVal(value) {
    if (value == "en") {
      currentLanguage = "english";
    } else if (value == "fr") {
      currentLanguage = "french";
    } else if (value == "es") {
      currentLanguage = "spanish";
    } else if (value == "ar") {
      currentLanguage = "arabic";
    } else {
      currentLanguage = "english";
    }
    notifyListeners();
    changeLocale(currentLanguage);
  }
}
