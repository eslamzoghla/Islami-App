import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/modules/islami/setting/language_bottom_sheet.dart';
import 'package:islami/modules/islami/setting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';

class settingScreen extends StatefulWidget {
  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Container(
      margin: EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: TextStyle(
                color: provider.isDarkTheme()
                    ? myThemeData.whiteTextColor
                    : myThemeData.blackTextColor,
                fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageSheet();
              setState(() {});
            },
            child: Container(
              margin: EdgeInsetsDirectional.all(10),
              padding: EdgeInsetsDirectional.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.getSelectedProviderLanguage(),
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Theme',
            style: TextStyle(
                color: provider.isDarkTheme()
                    ? myThemeData.whiteTextColor
                    : myThemeData.blackTextColor,
                fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeSheet();
              setState(() {});
            },
            child: Container(
              margin: EdgeInsetsDirectional.all(10),
              padding: EdgeInsetsDirectional.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.getSelectedProviderTheme(),
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageSheet() {
    showModalBottomSheet(
      backgroundColor: myThemeData.darkTheme.primaryColor,
      context: context,
      builder: (BuildContext) => languageButtomSheet(),
    );
  }

  void showThemeSheet() {
    showModalBottomSheet(
      backgroundColor: myThemeData.lightTheme.primaryColor,
      context: context,
      builder: (BuildContext) => themeBottomSheet(),
    );
  }
}
