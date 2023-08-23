import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/modules/islami/hadeth/hadeth_details.dart';
import 'package:islami/modules/islami/home/home_screen.dart';
import 'package:islami/modules/islami/quran/ayat_elsura.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/network/dioHelper.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  DioHelper.init();
  // Show();
  runApp(ChangeNotifierProvider<appConfigProvider>(
      create: (buildContext) => appConfigProvider(), child: MyApp()));
}

class myThemeData {
  static final Color lightPrimaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static final Color darkPrimaryColor = Color.fromARGB(255, 20, 26, 46);
  static final Color whiteTextColor = Colors.white;
  static final Color blackTextColor = Colors.black;
  static final Color yellowColor = Colors.yellow;
  static final ThemeData darkTheme = ThemeData(
    primaryColorDark: whiteTextColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),
    primaryColor: myThemeData.darkPrimaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: myThemeData.darkPrimaryColor,
      selectedItemColor: myThemeData.yellowColor,
      unselectedItemColor: Colors.white,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColorLight: blackTextColor,
    appBarTheme: AppBarTheme(
      foregroundColor: myThemeData.blackTextColor,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),
    primaryColor: myThemeData.lightPrimaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: myThemeData.lightPrimaryColor,
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      unselectedItemColor: Colors.white,
    ), 
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return MaterialApp(
      theme: myThemeData.lightTheme,
      darkTheme: myThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: provider.appTheme,
      routes: {
        homeScreen.routeName: (BuildContext) => homeScreen(),
        ayatElsura.routeName: (BuildContext) => ayatElsura(),
        hadethDetails.routeName: (BuildContext) => hadethDetails(),
      },
      initialRoute: homeScreen.routeName,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
