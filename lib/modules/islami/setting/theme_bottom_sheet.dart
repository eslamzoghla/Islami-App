import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'package:islami/main.dart';

class themeBottomSheet extends StatefulWidget {

  @override
  State<themeBottomSheet> createState() => _themeBottomSheetState();
}

class _themeBottomSheetState extends State<themeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
              setState(() {});
            },
            child: !provider.isDarkTheme()?getSelectedWidget('Light'): getUnselectedWidget('Light'),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
              setState(() {});
            },
            child: provider.isDarkTheme()?getSelectedWidget('Dark'): getUnselectedWidget('Dark'),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: myThemeData.whiteTextColor, fontSize: 22),
        ),
        Icon(
          Icons.check,
          color: myThemeData.whiteTextColor,
        ),
      ],
    );
  }

  Widget getUnselectedWidget(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(color: myThemeData.whiteTextColor, fontSize: 22),
        ),
      ],
    );
  }
}
