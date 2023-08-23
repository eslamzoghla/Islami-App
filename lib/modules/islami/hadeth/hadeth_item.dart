import 'package:flutter/material.dart';
import 'package:islami/modules/islami/hadeth/hadeth_details.dart';
import 'package:islami/modules/islami/hadeth/hadeth_screen.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';

class hadethItem extends StatelessWidget {
  dataHadeth datahadeth;
  hadethItem(this.datahadeth);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, hadethDetails.routeName,
            arguments: this.datahadeth);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 5),
        child: Text(
          datahadeth.title,
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
