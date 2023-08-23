import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/shared/constants.dart';
import 'package:islami/main.dart';
import 'package:provider/provider.dart';

class ayatElsura extends StatefulWidget {
  static const String routeName = 'ayat';

  @override
  State<ayatElsura> createState() => _ayatElsuraState();
}

class _ayatElsuraState extends State<ayatElsura> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as ayatElsuraArgument;
    loadAyatElsura(args.SuraIndex);
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
              args.suraName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: provider.isDarkTheme()
                    ? myThemeData.whiteTextColor
                    : myThemeData.blackTextColor,
                fontSize: 32,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            //height: double.infinity,
            margin: EdgeInsetsDirectional.all(35),
            padding: EdgeInsetsDirectional.all(5),
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
                    child: verses.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.yellow,
                          ))
                        : ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (buildContext, index) {
                              return Text(
                                verses[index] + '{${index + 1}}',
                                style: TextStyle(
                                  color: provider.isDarkTheme()
                                      ? myThemeData.whiteTextColor
                                      : myThemeData.blackTextColor,
                                  fontSize: 26,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              );
                            },
                            separatorBuilder: (buildContext, index) =>
                                Container(
                              margin: EdgeInsetsDirectional.all(5),
                              height: 2,
                              width: double.infinity,
                              color: provider.isDarkTheme()
                                  ? myThemeData.whiteTextColor
                                  : myThemeData.blackTextColor,
                            ),
                            itemCount: verses.length,
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

  void loadAyatElsura(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/file_suer/${index + 1}.txt');
    List<String> verses = fileContent.split('\n');
    this.verses = verses;
    setState(() {});
  }
}

class ayatElsuraArgument {
  String suraName;
  int SuraIndex;
  ayatElsuraArgument(this.suraName, this.SuraIndex);
}
