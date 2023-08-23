import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/modules/islami/quran/ayat_elsura.dart';
import 'package:islami/modules/islami/quran/sura_name_items.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';
import 'package:islami/main.dart';

class quranScreen extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/quran_top_log.png'),
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
            'اسم السورة',
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
              itemBuilder: (context, index) =>
                  suraNameItems(suraNames[index], index),
              separatorBuilder: (BuildContext, index) => Container(
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: 80),
                    width: double.infinity,
                    color: Colors.grey,
                  ),
              itemCount: suraNames.length),
        ),
      ],
    );
  }
}
