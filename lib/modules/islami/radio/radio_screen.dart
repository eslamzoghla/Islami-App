import 'package:audioplayers/audioplayers.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/main.dart';
import 'package:islami/model/Radios.dart';
import 'package:islami/modules/islami/radio/cubit/cubit.dart';
import 'package:islami/modules/islami/radio/cubit/states.dart';
import 'package:islami/network/dioHelper.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/shared/constants.dart';
import 'package:provider/provider.dart';

class radioScreen extends StatefulWidget {
  @override
  State<radioScreen> createState() => _radioScreenState();
}

class _radioScreenState extends State<radioScreen> {
  late AudioPlayer audioPlayer;
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()..ShowRadio(),
      child: BlocConsumer<RadioCubit, RadioStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = RadioCubit.get(context);
            var provider = Provider.of<appConfigProvider>(context);
            return ConditionalBuilder(
              fallback: (context) => Center(
                  child: CircularProgressIndicator(
                color: provider.isDarkTheme()
                    ? myThemeData.darkPrimaryColor
                    : myThemeData.lightPrimaryColor,
              )),
              condition: true,
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('assets/images/radio_image.png'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${cubit.RadioName}',
                    style: TextStyle(
                      fontSize: 32,
                      color: provider.isDarkTheme()
                          ? myThemeData.whiteTextColor
                          : myThemeData.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.index--;
                          setState(() {});
                        },
                        icon: Image.asset('assets/images/Icon_last.png'),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/Icon_play.png'),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            cubit.index++;
                          });
                        },
                        icon: Image.asset('assets/images/Icon_next.png'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
