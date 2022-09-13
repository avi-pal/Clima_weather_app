import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

      var weatherData = await WeatherModel().getLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(locationWeather: weatherData,);
      }));


  }

  // void getData() async {
  //   // http.Response response = await http.get(Uri.parse(
  //   //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
  //   // //print(response.body);
  //   // if (response.statusCode == 200) {
  //   //   String data = response.body;
  //   //   // print(data);
  //   //   // var longitude = jsonDecode(data)['coord']['lon'];
  //   //   // print(longitude);
  //   //   // var weatherDescribtion = jsonDecode(data)['weather'][0]['description'];
  //   //   // print(weatherDescribtion);
  //   //   var decodedData = jsonDecode(data);
  //
  //   // } else {
  //   //   print(response.statusCode);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       //Get the current location
        //       getLocation();
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),

        );
  }
}
