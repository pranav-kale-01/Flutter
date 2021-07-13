import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/Location.dart';
import 'package:clima/utilities/WeatherData.dart';
import 'package:flutter/rendering.dart';
import 'package:clima/Cards/BasicContainerCard.dart';
import 'package:clima/Cards/weatherDetailsCard.dart';
import 'package:clima/Pages/SecondPage.dart';
import 'package:flutter/widgets.dart';


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
  bool Reloading = true ;
  Container content = new Container();

  Future<bool> loadWeatherByCoords( ) async  {
    if( takeLocationFromCoords == false ) {
      this.Reloading = false;
      setState(() { });
      return true;
    }

    // new instance of Location to get user location
    Location userLocation = new Location();

    Map<String, String> location = {};
    try{
      location = await userLocation.getLocation();
    }
    catch( e ) {
      this.failedToLoad = true ;
      this.Reloading = false ;
      setState(() { });
      return true;
    }

    WeatherData currentWeather = new WeatherData();
    await currentWeather.loadData( latitude: location['lat']!, longitude: location['lon']! );

    // checking if the weather has been loaded from the server
    if( currentWeather.gotWeather == false ){
      this.failedToLoad = true ;
      this.Reloading = false;
      setState(() { });
      return true ;
    }
    else {
      this.failedToLoad = false;
      this.weatherData = currentWeather.getWeather();
      this.Reloading = false;
      setState(() { });
      return true;
    }
  }

  @override
  Widget build( BuildContext context ) => FutureBuilder(
      future: loadWeatherByCoords(),
      builder: (context,snapshot ) {
        if( this.Reloading == true  ) {
          return Scaffold(
            backgroundColor: kScaffoldBackgroundTheme,
            body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: kGradientBoxDecoration,
                alignment: Alignment.center,
                child: kSpinningLoadingWheel,
              ),
            );
        }
        return Scaffold(
            drawerEnableOpenDragGesture: false,
            backgroundColor: kScaffoldBackgroundTheme,
            body: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                                color: Color(0xFF06408f),
                              ),
                              margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0 , 0.0 ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: kGradientBoxDecoration,
                              child: SafeArea(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: ()  async {
                                                await loadWeatherByCoords();

                                                setState( () {
                                                  this.Reloading = true;
                                                } );
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Icon(
                                                    Icons.location_city,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  )
                                              ),
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
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext context ) => SecondPage( ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Icon(
                                                    Icons.search,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                        WeatherDetailsCard( weather: weatherData['weather'], temperature: weatherData['temperature'], ),
                                      ],
                                    ),
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only( top: 10.0, left: 10.0, bottom: 10),
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
                              padding: EdgeInsets.only( top:10, right: 10.0, bottom: 10.0 ),
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
                          BasicContainerCard( parameter: "M I N", icon: Icons.cloud , value: weatherData['min_temp'],),
                          BasicContainerCard( parameter: "M A X", icon: Icons.cloud, value: weatherData['max_temp'],),
                          BasicContainerCard( parameter: "VISIBLE", icon: Icons.remove_red_eye , value: weatherData['visibility']+' m',),
                        ],
                      )
                    ],
                  ),
                  ),
          );
      }
  );
}