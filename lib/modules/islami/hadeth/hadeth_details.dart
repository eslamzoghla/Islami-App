import 'package:flutter/material.dart';
import 'package:islami/modules/islami/hadeth/hadeth_screen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/shared/constants.dart';
import 'package:islami/main.dart';
import 'package:provider/provider.dart';

class hadethDetails extends StatefulWidget {
  static const String routeName = 'hadethDetails';

  @override
  State<hadethDetails> createState() => hadethDetailsState();
}

class hadethDetailsState extends State<hadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as dataHadeth;
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
              args.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.all(35),
            decoration: BoxDecoration(
              color: provider.isDarkTheme()
                  ? myThemeData.darkPrimaryColor
                  : myThemeData.lightPrimaryColor,
              borderRadius: BorderRadius.circular(35),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 15),
                    child: args.hadeth.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.yellow,
                          ))
                        : SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(10),
                              child: Text(
                                args.hadeth,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: myThemeData.whiteTextColor,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
