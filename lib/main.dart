import 'dart:developer';
import 'config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => ThemeService(snapData.data!)),
                  ChangeNotifierProvider(create: (_) => LanguageProvider(snapData.data!)),

                ],
                child: Consumer<ThemeService>(builder: (context, theme, child) {
                  log("THEME ${theme.isDarkMode}");
                  return Consumer<LanguageProvider>(
                      builder: (context, lang, child) {
                        return MaterialApp(
                            title: 'Provider demo',
                            debugShowCheckedModeBanner: false,
                            theme: AppTheme.fromType(ThemeType.light).themeData,
                            darkTheme:
                            AppTheme.fromType(ThemeType.dark).themeData,
                            locale: lang.locale,
                            localizationsDelegates:  const [
                              AppLocalizations.delegate,
                              AppLocalizationDelagate(),
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate
                            ],
                            supportedLocales: appArray.localList,
                            themeMode: theme.theme,
                            initialRoute: "/",
                            routes: appRoute.route);
                      });
                }));

          } else {
            return MaterialApp(
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: Container());
          }
        });
  }
}
