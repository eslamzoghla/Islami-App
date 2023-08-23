import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/modules/islami/quran/ayat_elsura.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';

class suraNameItems extends StatelessWidget {
  String suraName;
  int index;
  suraNameItems(this.suraName, this.index);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ayatElsura.routeName,
          arguments: ayatElsuraArgument(suraName, index),
        );
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 5),
        child: Text(
          suraName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: provider.isDarkTheme()
                ? myThemeData.whiteTextColor
                : myThemeData.blackTextColor,
          ),
        ),
      ),
    );
  }
}
