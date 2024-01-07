import 'package:provider/provider.dart';
import 'common/app_array.dart';
import 'common/app_fonts.dart';
import 'common/languages/app_language.dart';
import 'common/session.dart';
import 'common/theme/app_css.dart';
import 'common/theme/theme_service.dart';
import 'helper/navigation_class.dart';
export 'package:flutter/material.dart';
export '../packages_list.dart';
export '../common/extension/text_style_extensions.dart';
export '../common/extension/widget_extension.dart';
export '../common/extension/spacing.dart';
export '../common/theme/app_css.dart';
export '../routes/index.dart';
export 'common/languages/app_language.dart';
export 'common/languages/language_change.dart';
export 'common/theme/app_theme.dart';
export 'common/theme/theme_service.dart';


Session session = Session();
AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
AppArray appArray = AppArray();
AppCss appCss = AppCss();


ThemeService appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}

String language(context, text) {
  return AppLocalizations.of(context)!.translate(text);
}