import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpleweather/components/components.dart';
import 'package:simpleweather/cubit/cubit.dart';
import 'package:simpleweather/cubit/states.dart';
import 'package:simpleweather/shared/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {
        if (state is WeatherErrorStates) {
          print(state.error);
        }
      },
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: ConditionalBuilder(
              condition: cubit.weather != null,
              builder: (context) => Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Currently in",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.city,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Cairo",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "longitude:${cubit.weather!.coord.lon}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[300]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "latitude: ${cubit.weather!.coord.lat}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[300]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          defaultListTile(
                              text: "Temperature",
                              data:
                                  "${((cubit.weather!.main.temperature) - 273.15).round()}\u00B0",
                              icon: const FaIcon(FontAwesomeIcons.thermometer)),
                          defaultListTile(
                              text: "Weather",
                              data: "${cubit.weather!.cloud.all}",
                              icon: const FaIcon(FontAwesomeIcons.cloud)),
                          defaultListTile(
                              text: "TemperaHumidityure",
                              data: "${cubit.weather!.main.humidity}",
                              icon: const FaIcon(Icons.sunny)),
                          defaultListTile(
                              text: "WindSpeed",
                              data: "${cubit.weather!.wind.speed}",
                              icon: const Icon(Icons.wind_power)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
