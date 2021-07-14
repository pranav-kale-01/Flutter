# clima

Clima is a weather Forecasting applicaiton created in Flutter. The openweather API is used to get the weather based on the current location of the user. 


## V2.1 Changelog 
 - Bux Fixes:
  
   - Reduced loading time while launching the app.
   - Added new reloading animation for the locate button in the HomePage.
   - Improved Visuals for SecondPage. 

## Sample Images 
  
  <img src="https://github.com/pranav-kale-01/Flutter/blob/master/clima/samples/Screenshot_1.png" width="250"> <img src="https://github.com/pranav-kale-01/Flutter/blob/master/clima/samples/Screenshot_2.png" width="250"> <img src="https://github.com/pranav-kale-01/Flutter/blob/master/clima/samples/Screenshot_3.png" width="250">
  

### Cards
  
  The whole project is divided into smaller individual Cards which can be used seperately. 
  
  ### BasicContainerCard:- 

   A conatiner that can hold a Title text, a Icon and a Discription Text.

  - Card parameters: 

     - required parameter : Title Text for the Card ,
     - required icon : Icon for the Card,
     - required value: Descrption Text,
     - parameterColor : Title Color,
     - iconColor : Icon Color,
     - valueColor : Description Color,
     - margin : margin around the Card,
     - backgroundColor : background Color of the Card.

   - Sample Code: 

   <div style="background-color: rgb(0, 0, 0);"> 

   ```dart
    body: Container(
         decoration: BoxDecoration(
           gradient: RadialGradient(
             radius: 1.0,
             colors: [ Colors.lightBlueAccent, Colors.greenAccent ],
         ),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           BasicContainerCard( parameter: "SAMPLE TEXT", icon: Icons.add, value: "22.0", margin: EdgeInsets.all(10.0), backgroundColor: Colors.white24),
           BasicContainerCard( parameter: "SAMPLE TEXT", icon: Icons.add, value: "22.0", margin: EdgeInsets.all(10.0), backgroundColor: Colors.white24),
           BasicContainerCard( parameter: "SAMPLE TEXT", icon: Icons.add, value: "22.0", margin: EdgeInsets.all(10.0), backgroundColor: Colors.white24),
         ],
       ),
     )
   ),
   ```

   </div>


  - Sample Output: 

    <img src="https://github.com/pranav-kale-01/Flutter/blob/master/clima/samples/Screenshot_2021-07-14-18-38-41-84.png" width="250">


### Resources Used

  * openweathermap API - https://openweathermap.org/current
  * GeoLocator package - https://pub.dev/packages/geolocator
  * Loading animation Spinner - https://pub.dev/packages/flutter_spinkit
  * Awesome 3D icons - https://uifreebies.net/icon/3d-weather-icons-free
