import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/model/Radios.dart';
import 'package:islami/modules/islami/radio/cubit/states.dart';
import 'package:islami/network/dioHelper.dart';
import 'package:islami/shared/constants.dart';

class RadioCubit extends Cubit<RadioStates> {
  RadioCubit() : super(initRadioState());

  static RadioCubit get(context) => BlocProvider.of(context);

  RadioResponse? radio;
  String? RadioName;
  int index = 1;
  void ShowRadio() {
    emit(LoadingRadioState());
    DioHelper.getData(url: RDAIOURL).then((value) {
      radio = RadioResponse.fromJson(value.data);
      RadioName = radio!.radios[index].name;
      // print(radio!.radios[1].name);
      emit(SuccessRadioState());
    }).catchError((error) {
      emit(ErrorRadioState(error.toString()));
    });
  }
}
