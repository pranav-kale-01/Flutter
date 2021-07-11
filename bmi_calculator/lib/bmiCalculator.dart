import 'dart:math';

class BMICalculator {
  BMICalculator( {required this.height,required this.weight } );

  final int height;
  final int weight;
  double _bmi=0;

  calcBMI( ) {
    this._bmi =  weight / pow( (height/100) , 2 );
    return _bmi.toStringAsFixed(1);
  }

  String getPerformance () {
    if( _bmi >= 25 ){
      return "OVER-WEIGHT";
    }
    else if( _bmi >18.5 ) {
      return "NORMAL";
    }
    else {
      return "UNDER-WEIGHT"; 
    }
  }
  
  String getDescription( ) {
    if( _bmi >= 25 ){
      return "You have a BMI greater than normal, try doing some exercies to stay fit..!"; 
    }
    else if( _bmi >= 18.5 ) {
      return "You have a normal BMI, you are doing a good job in keeping yourself healthy";  
    }
    else {
      return "You have a BMI lesser than normal, maybe you should focus more on your health..!"; 
    }
  }
}