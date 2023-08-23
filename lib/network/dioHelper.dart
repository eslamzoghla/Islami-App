import 'package:dio/dio.dart';
import 'package:islami/shared/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://mp3quran.net/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url, String? lang}) async {
    dio.options.headers = {
      'lang': lang,
    };
    return await dio.get(
      url,
    );
  }
}

/*
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  Test Dio  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

RadioResponse? rad;
void Show() {
  DioHelper.getData(url: RDAIOURL).then((value) {
    rad = RadioResponse.fromJson(value.data);
    print('${rad!.radios![0].name} Dio');
  });
}
*/