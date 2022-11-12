import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleweather/cubit/states.dart';
import 'package:simpleweather/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialStates());
  static WeatherCubit get(context) => BlocProvider.of(context);

  // Future<Weather> getData() async {
  //   var data = await http.get(Uri.parse(
  //       "https://api.openweathermap.org/data/2.5/weather?lat=30.033333&lon=31.233334&appid=d63e90607e296f7e3ff3475f1f374bae"));
  //   var response = jsonDecode(data.body);
  //   if (data.statusCode == 200) {
  //     return Weather.fromjson(response);
  //   } else {
  //     throw Exception("error");
  //   }
  // }
  Weather? weather;
  void getData() {
    emit(WeatherLoadinglStates());
    http
        .get(Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=30.033333&lon=31.233334&appid=d63e90607e296f7e3ff3475f1f374bae"))
        .then((value) {
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);
        weather = Weather.fromjson(response);
        print(response);
        print(value);
      }
      emit(WeatherSuccessStates());
    }).catchError((error) {
      print("hi");
      emit(WeatherErrorStates(error: error));
    });
  }
}
