import 'package:clima/services/networking.dart';
import '../services/location.dart';

const String apiKey = '13c2765f7729b7e23b6455916935d984';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location locator = Location();
    await locator.getCurrentLocation();
    double lat = locator.getLatitude();
    double lon = locator.getLongitude();
    print("Position found: ($lat, $lon)");
    NetworkHelper net = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
    var weatherData = await net.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async {
    NetworkHelper net = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");
    var weatherData = await net.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
