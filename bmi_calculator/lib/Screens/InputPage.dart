import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ResultsPage.dart';
import '../constants.dart';
import '../Cards/MainCard.dart';
import '../Cards/GenderCard.dart';
import '../Cards/AdjustableValueCard.dart';
import '../bmiCalculator.dart';

GlobalKey <AdjustableValueCardState> _mykey = GlobalKey();

class InputPage extends StatefulWidget {
  const InputPage( {Key? key} ) : super( key : key );

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height=180;
  AdjustableValueCard weight = AdjustableValueCard( key: _mykey, label1: "weight", startValue: 50 );
  AdjustableValueCard age = AdjustableValueCard( label1: "Age", startValue: 25 );

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only( top: 10.0 ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.male ;
                            });
                          },
                          child: MainCard(
                            cardColor: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor ,
                            cardChild: Container(
                              alignment: Alignment.center,
                              child: GenderCard( contentColor: selectedGender== Gender.male? kActiveContentColor : kInactiveContentColor , cardName: "MALE", cardIcon: FontAwesomeIcons.mars ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.female ;
                            });
                          },
                          child: MainCard(
                            cardColor: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor ,
                            cardChild: GenderCard( contentColor: selectedGender == Gender.female ? kActiveContentColor : kInactiveContentColor , cardName: "FEMALE", cardIcon: FontAwesomeIcons.venus ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MainCard(
                  cardColor: kActiveCardColor,
                  cardChild: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: kLabelStyle.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              this.height.toString(),
                              style: kLabelStyle.copyWith(
                                color: Colors.white,
                                fontSize: 80.0,
                              ),
                            ),
                            Text(
                              "cm",
                              style: kLabelStyle.copyWith(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context),
                          child: Slider(
                            onChanged: (double value ) {
                              setState( () {
                                this.height = value.round();
                              });
                            } ,
                            value: this.height.toDouble(),
                            min: 130,
                            max: 250,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: MainCard(
                          cardColor: kActiveCardColor,
                          cardChild: this.weight,
                        ),
                      ),
                      Expanded(
                        child: MainCard(
                          cardColor: kActiveCardColor,
                          cardChild: this.age,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                        padding: EdgeInsets.all( 10.0 ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "CALCULATE",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        )
                    )
                ),
                onTap: () {
                  BMICalculator bmicalc = BMICalculator(height: height, weight: _mykey.currentState!.getValue() );
                  String bmi = bmicalc.calcBMI();
                  String performance = bmicalc.getPerformance() ;
                  String description = bmicalc.getDescription();

                  Navigator.push(
                      context,
                      MaterialPageRoute (
                        builder: (context) => ResultsPage( bmi: bmi, performance: performance, description: description ),
                      ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}