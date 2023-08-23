import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class languageButtomSheet extends StatefulWidget {
  @override
  State<languageButtomSheet> createState() => _languageButtomSheetState();
}

class _languageButtomSheetState extends State<languageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.showAppLanguage('en');
              setState(() {});
            },
            child: provider.appLanguage == 'en'
                ? getSelectedWidget('English')
                : getUnselectedWidget('English'),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.showAppLanguage('ar');
              setState(() {});
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedWidget('الـعربيه')
                : getUnselectedWidget('الـعربيه'),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: myThemeData.whiteTextColor, fontSize: 22),
        ),
      ],
    );
  }
}
