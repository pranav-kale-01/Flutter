import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String _apiKey = "";   // get you API key at https://www.coinapi.io/Pricing.

  Future<String> getCurrentValue( {required String cryptoType, required String currencyCode})  async {
    String  postUrl = "https://rest.coinapi.io/v1/exchangerate/$cryptoType/$currencyCode/?apikey=";

    http.Response jsonResponse = await http.get( Uri.parse( postUrl + _apiKey ) );

    if( jsonResponse.statusCode == 200 ) {
      // data fetched Successfully
      Map<String,dynamic> decodedData = jsonDecode( jsonResponse.body ) ;

      //returning only the rate of the crypto currency
      return decodedData['rate'].toStringAsFixed(1);

    }
    else {
      // data not fetched successfully

      // print("Json Request Failed with Status Code : ${jsonResponse.statusCode}");
      return "?";
    }
  }
}
