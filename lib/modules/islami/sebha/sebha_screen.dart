import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/shared/constants.dart';
import 'package:provider/provider.dart';

class sebhaScreen extends StatefulWidget {
  @override
  State<sebhaScreen> createState() => _sebhaScreenState();
}

class _sebhaScreenState extends State<sebhaScreen> {
  List<String> tasbehList = [
    'سبحـان الله',
    'الحـمد لله',
    'اللـه اكبـر',
    'أستغفر الله العظيم',
    'لا اله الا اللـه',
  ];
  int currentIndex = 0;
  int tasbehCounter = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.048),
                  //padding: EdgeInsetsDirectional.only(end: 36),
                  child: Image.asset('assets/images/head_of_seb7a.png')),
              InkWell(
                // ignore: unnecessary_lambdas
                onTap: () {
                  nextTesbeh();
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: Transform.rotate(
                        angle: (pi / 180) * angle,
                        child: Image.asset('assets/images/body_of_seb7a.png'))),
              ),
            ],
          ),
          Container(
            padding: EdgeInsetsDirectional.all(10),
            child: Text(
              'عدد التسبيحات',
              style: TextStyle(
                  color: provider.isDarkTheme()
                      ? myThemeData.whiteTextColor
                      : myThemeData.blackTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(20, 26, 46, 1.0),
            ),
            child: Text(
              '$tasbehCounter',
              textAlign: TextAlign.center,
              style: TextStyle(color: myThemeData.whiteTextColor, fontSize: 32),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.all(15),
            padding: EdgeInsetsDirectional.all(10),
            // width: 200,
            // height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromRGBO(250, 204, 29, 1.0),
            ),
            child: Text(
              tasbehList[currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }

  void nextTesbeh() {
    tasbehCounter++;
    angle += 90;
    if (tasbehCounter % 33 == 0) {
      currentIndex++;
      if (currentIndex == 5) {
        currentIndex = 0;
      }
    }
    setState(() {});
  }
}
