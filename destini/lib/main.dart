import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'story_tree.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp( new Destini() );

//creating a stateless app
class Destini extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Destini"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.black87,
            child: MainPage(),
          )
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super( key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Creating an object of class Story Tree which is basically the brain of this application
  StoryTree tree1 = new StoryTree();

  // this method will be responsible for popping an alert when the user completes the game
  void popAlert( String nodeDirection ) {
    setState( () {
      bool isEnd = false ;
      if( nodeDirection == "RIGHT" )
        isEnd = tree1.jumpRight();
      else if( nodeDirection == "LEFT")
        isEnd = tree1.jumpLeft();
      if( tree1.hasWon == true ) {
        Alert(
          style: AlertStyle(
            titleStyle: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w800,
            ),
            isOverlayTapDismiss: false,
            isButtonVisible: false,
            isCloseButton: false,
          ),
          context: context,
          title: "You Won!",
          content: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    tree1.situationAt( 18 ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB( 20.0, 8.0 , 20.0, 8.0 ),
                    child: Text(
                      "Play Again",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      tree1.reset();
                      Navigator.pop( context);
                    });
                  },
                ),
              ),
            ],
          ),
        ).show();
      }
      else if( tree1.hasWon == false  ){
        if( isEnd == true )
          tree1.reset();
      }
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all( 10.0 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)
                ),
                color: Colors.black38,
              ),
              child: Padding(
                padding: EdgeInsets.all( 20.0 ),
                child: Text(
                  tree1.getSituation(),
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: Colors.teal,
                padding: EdgeInsets.all( 16.0 ),
              ),
              child: Text(
                  tree1.getLeftSituation(),
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
              ),
              onPressed: () {
                popAlert("LEFT");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: Colors.teal,
                padding: EdgeInsets.all(16.0),
              ),
              child: Text(
                  tree1.getRightSituation(),
                style: TextStyle(
                  fontSize: 16.0 ,
                ),
              ),
              onPressed: () {
                popAlert("RIGHT");
              },
            ),
          ),
        ],
      ),
    );
  }
}