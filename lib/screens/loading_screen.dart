import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lon = 0;
  double lat = 0;

  void locationSetup() async {
    WeatherModel wmodel = WeatherModel();
    var weatherData = await wmodel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData,)));
  }

  @override
  void initState() {
    super.initState();
    locationSetup();
  }
  
  @override
  Widget build(BuildContext context) {
    String myMargin = '100';
    double myMarginD = 30;
    try {
      myMarginD = double.parse(myMargin);
    }
    catch (e) {
      print(e);
    }
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
