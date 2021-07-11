import  'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/Location.dart';
import 'package:clima/utilities/WeatherData.dart';
import 'package:flutter/rendering.dart';
import 'package:clima/Cards/BasicContainerCard.dart';
import 'package:clima/Cards/FailedToLoadCard.dart';

GlobalKey my_key = GlobalKey();

class HomePage extends StatefulWidget{
  const HomePage( {Key? key } ) : super( key : key );

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState( {Key? my_key });

  Map<String, dynamic> weatherData = {};
  bool takeLocationFromCoords = true;
  bool failedToLoad = false;
  Container content = new Container();

  Future<bool> loadWeatherByCity( String cityName ) async {
    WeatherData currentWeather = new WeatherData();
    await currentWeather.loadDataFromCity(cityName: cityName);

    // checking if the weather has been loaded from the server
    if( currentWeather.gotWeather == false ) {
     this.failedToLoad = true ;
     return false;
    }
    else {
      this.failedToLoad = false;
      this.weatherData = await currentWeather.getWeather();
      return true;
    }
  }

  Future<bool> loadWeatherByCoords( ) async  {
    if( takeLocationFromCoords == false )
      return true;

    // new instance of Location to get user location
    Location userLocation = new Location();
    Map<String, String> location = {};
    try{
      location = await userLocation.getLocation();
    }
    catch( e ) {
      this.failedToLoad = true ;
      return false;
    }

    WeatherData currentWeather = new WeatherData();
    await currentWeather.loadData( latitude: location['lat']!, longitude: location['lon']! );

    // checking if the weather has been loaded from the server
    if( currentWeather.gotWeather == false ){
      this.failedToLoad = true ;
      return false ;
    }
    else {
      this.failedToLoad = false;
      this.weatherData = currentWeather.getWeather();
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build( BuildContext context ) => FutureBuilder(
      future: loadWeatherByCoords(),
      builder: (context,snapshot ) {
        if( this.failedToLoad == true ) {
          content = FailedToLoadCard().getContainer();
        }
        else {
          content = Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              weatherData['city'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30.0,
                          )
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30.0, right: 30.0 ),
                        child: Image.asset( "images/" + kWeatherCondition[ weatherData['weather'] ]! ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only( left : 40.0 ),
                          child: Text(
                            weatherData['temperature'],
                            style: TextStyle(
                              fontSize: 120.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                            "°",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 70.0,
                            ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        weatherData['weather'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      )
                    ),
                    SizedBox(
                      height: 10.0,
                      child: Container(
                        margin: EdgeInsets.only(left: 50.0, right: 50.0 , top: 6.0, bottom: 3.0),
                        color: Colors.white38,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                            color: Colors.white24,
                            ),
                            height: 70,
                            margin: EdgeInsets.all(10.0),
                            ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                              color: Colors.white24,
                            ),
                            height: 70,
                            margin: EdgeInsets.all(10.0),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                              color: Colors.white24,
                            ),
                            height: 70,
                            margin: EdgeInsets.all(10.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
        }
        return Scaffold(
            drawerEnableOpenDragGesture: false,
            backgroundColor: kScaffoldBackgroundTheme,
            body: SafeArea(
              child: GestureDetector(
                  onVerticalDragDown: (DragDownDetails d) {
                    print("reload") ;
                    this.takeLocationFromCoords = true;
                    loadWeatherByCoords();

                    setState(() {});
                  },
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                            color: Color(0xFF5e99f7),
                            ),
                            child: content,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only( left: 10.0),
                                child:Text(
                                    "DETAILS",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 24.0,
                                    ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white60,
                                  size: 24.0,
                                )
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                                  color: Colors.white24,
                                ),
                                width: 100,
                                height: 124,
                                margin: EdgeInsets.all(2.0),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                                  color: Colors.white24,
                                ),
                                width: 100,
                                height: 122,
                                margin: EdgeInsets.all(2.0),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                                  color: Colors.white24,
                                ),
                                width: 100,
                                height: 120,
                                margin: EdgeInsets.all(2.0),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    ),
                  ),
              ),
          );
      }
  );
}