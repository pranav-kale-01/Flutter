import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';
import 'package:bitcoin_ticker/utilities/NetworkHelper.dart';
import 'package:bitcoin_ticker/utilities/constants.dart';
import 'package:bitcoin_ticker/Cards/ValueContainerCard.dart';

class HomePage extends StatefulWidget {
  const HomePage( {Key? key}) : super( key: key );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentValue = 'INR';
  String currentBTCPrice = "?";
  String currentETHPrice = "?";
  String currentLTCPrice = "?";

  //returns DropDownMenu with preloaded options and behaviour
  DropdownButton<String> getDropDownMenu() {
    // list of all the items to add into the DropDownMenu
    List<DropdownMenuItem<String>> itemsList = [];

    for( String value in currenciesList ) {
      DropdownMenuItem<String> item = DropdownMenuItem<String>(
        value: value,
        child: Text( value, style: TextStyle( fontSize: 24.0 ) ),
      );
      itemsList.add( item );
    }

    return DropdownButton<String>(
      value: currentValue,
      onChanged: (String? currencyCode) async  {
        // new object of NetworkHelper
        NetworkHelper obj = new NetworkHelper();

        // getting current Values of the Crypto Currencies
        String locale1 = await obj.getCurrentValue( cryptoType: "BTC",currencyCode: currencyCode! );
        String locale2 = await obj.getCurrentValue( cryptoType: "ETH",currencyCode: currencyCode );
        String locale3 = await obj.getCurrentValue( cryptoType: "LTC",currencyCode: currencyCode );

        setState(() {
          currentValue = currencyCode;
          currentBTCPrice = locale1;
          currentETHPrice = locale2;
          currentLTCPrice = locale3;
        });
      },
      items: itemsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 60.0,
        shape: kAppbarShape,
        elevation: 15.0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        minimum: EdgeInsets.only( top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueContainerCard(crytoType: "BITCOIN",label: currentBTCPrice, value: currentValue ),
            ValueContainerCard(crytoType: "EHTEREUM", label: currentETHPrice, value: currentValue ),
            ValueContainerCard(crytoType: "LITECOIN", label: currentLTCPrice, value: currentValue ),
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only( topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0) ),
                gradient: kContainerLinearGradient,
              ),
              child: Container(
                alignment: Alignment.center,
                child: getDropDownMenu(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}