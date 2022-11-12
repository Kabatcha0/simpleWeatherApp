abstract class WeatherStates {}

class WeatherInitialStates extends WeatherStates {}

class WeatherLoadinglStates extends WeatherStates {}

class WeatherSuccessStates extends WeatherStates {}

class WeatherErrorStates extends WeatherStates {
  dynamic error;
  WeatherErrorStates({this.error});
}
