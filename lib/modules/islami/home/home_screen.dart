import 'package:flutter/material.dart';
import 'package:islami/modules/islami/radio/radio_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/modules/islami/setting/setting_screen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../hadeth/hadeth_screen.dart';
import '../quran/quran_screen.dart';
import '../sebha/sebha_screen.dart';
import 'package:islami/main.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
  static const String routeName = 'home';
}

class _homeScreenState extends State<homeScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkTheme()
            ? Image.asset(
                'assets/images/bg1.png',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              )
            : Image.asset(
                'assets/images/bg2.png',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          body: views[selectedindex],
          backgroundColor: Colors.transparent,
          // backgroundColor: appConfigProvider().isDarkTheme()? myThemeData.darkPrimaryColor:myThemeData.lightPrimaryColor,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                setState(() {
                  selectedindex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              iconSize: 5,
              items: [
                BottomNavigationBarItem(
                  icon: selectedindex == 0
                      ? Image.asset(
                          'assets/images/yellow_radio.png',
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          'assets/images/radio.png',
                          width: 40,
                          height: 35,
                        ),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: selectedindex == 1
                      ? Image.asset(
                          'assets/images/yellow_sebha.png',
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          'assets/images/sebha.png',
                          width: 40,
                          height: 35,
                        ),
                  label: AppLocalizations.of(context)!.tasbeh,
                ),
                BottomNavigationBarItem(
                  icon: selectedindex == 2
                      ? Image.asset(
                          'assets/images/yellow_hadeth.png',
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          'assets/images/hadeth.png',
                          width: 30,
                          height: 35,
                        ),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: selectedindex == 3 && true
                      ? Image.asset(
                          'assets/images/yellow_moshaf.png',
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          'assets/images/moshaf_blue.png',
                          width: 40,
                          height: 35,
                        ),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> views = [
    radioScreen(),
    sebhaScreen(),
    hadethScreen(),
    quranScreen(),
    settingScreen(),
  ];
}
