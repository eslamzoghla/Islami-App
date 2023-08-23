import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/islami/hadeth/hadeth_item.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';
import 'package:islami/main.dart';

class hadethScreen extends StatefulWidget {
  @override
  State<hadethScreen> createState() => _hadethScreenState();
}

class _hadethScreenState extends State<hadethScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    if (allhadeth.isEmpty) loadAHadeth();
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/hadeth_top_icon.png'),
            ],
          ),
        ),
        Container(
          height: 3,
          width: double.infinity,
          color: myThemeData.yellowColor,
        ),
        Container(
          margin: EdgeInsetsDirectional.all(5),
          child: Text(
            'الأحاديث',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: provider.isDarkTheme()
                  ? myThemeData.whiteTextColor
                  : myThemeData.blackTextColor,
              fontSize: 32,
            ),
          ),
        ),
        Container(
          height: 3,
          width: double.infinity,
          color: myThemeData.yellowColor,
        ),
        Expanded(
          flex: 5,
          child: ListView.separated(
              itemBuilder: (context, index) => hadethItem(allhadeth[index]),
              separatorBuilder: (BuildContext, index) => Container(
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: 80),
                    width: double.infinity,
                    color: Colors.grey,
                  ),
              itemCount: allhadeth.length),
        ),
      ],
    );
  }

  List<dataHadeth> allhadeth = [];

  void loadAHadeth() async {
    for (int i = 1; i <= 50; i++) {
      String fileContent =
          await rootBundle.loadString('assets/ahadeth/h$i.txt');
      List<String> lines = fileContent.split('\n');
      String title = lines[0];
      String hadeth = '';
      for (int j = 1; j < lines.length; j++) {
        hadeth += lines[j];
      }
      var h = dataHadeth(title, hadeth);
      allhadeth.add(h);
    }
    setState(() {});
  }
}

class dataHadeth {
  String title;
  String hadeth;
  dataHadeth(this.title, this.hadeth);
}
