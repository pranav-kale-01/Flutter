// represents the basic node which would hold the current situation along with the two options. The two options would be represented as leftOption and rightOption. These Option would take the user to the next stage/part of the story.
class Node{
  String situation="";
  String? leftOption;   // nullable
  String? rightOption;  // nullable
  Node? leftNode;
  Node? rightNode;

  Node( String situation ,{ String? leftOption , String? rightOption, Node? leftNode, Node? rightNode } ) {
    this.situation = situation;
    this.leftOption = leftOption;
    this.rightOption = rightOption;
    this.leftNode = leftNode;
    this.rightNode = rightNode;
  }

  // would choose the leftOption and would continue on the left Branch of the storyline.
  Node? getLeftNode( ) {
      return this.leftNode;
  }

  // would choose the leftOption and would continue on the left Branch of the storyline.
  Node? getRightNode() {
    return this.rightNode;
  }
}

// class StoryTree would hold the complete storyLine in a form of a Tree.
// Like a Tree this story would have a single startPoint, from which the user can go onto one of the either ways by making a decision. Then the further Story Points would be divided like-wise.
class StoryTree {
  // the nodePointer would store the current location of the user in this story, also nodePointer would be responsible for controlling the flow of the story by making jumps to either left of right branch of the current story.
  Node? nodePointer;    // nullable

  // situations are arranged according the NLR (Node-Left-Right)
  // i.e. First priority to the node, followed by left and then the right
  List<String> _situations = [
    'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
    'I\'ll hop in. Thanks for the help!',
    'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
    'I love Elton John! Hand him the cassette tape.',
    'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
    'It\'s him or me! You take the knife and stab him.',
    'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
    'Better ask him if he\'s a murderer first.',
    'He nods slowly, unphased by the question.',

    // index 9
    'At least he\'s honest. I\'ll climb in.',
    'As you begin to drive, the stranger starts talking about his relationship with	his mother. He gets angrier and angrier by the minute. He asks you to open the	glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
    'I love Elton John! Hand him the cassette tape.',
    'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you you know any good places to dump bodies. You reply:  the pier".',
    'It\'s him or me! You take the knife and stab him.',
    'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',

    // index 15
    'Wait for someone else...',
    'After a hour of wait, a young man stops by and asks if he could help to change the tire',
    'Ask him for help',
    'The main repairs the tire and you reach your home safely',
    'Wait for someone else...',
    'As the man leaves, the sun sets and a deadly herd of deadly wolves attacks you while the traffic gets stopped due to a road disaster few miles away from you',
    'End Game'
  ];

  // initializing the root node
  Node? tree1;

  // setting up a boolean value hasWon which would help to determine if the user has won or not
  bool hasWon = false ;

  String situationAt( int index ) {
    if( index < this._situations.length )
      return this._situations.elementAt( index );
    else return "";
  }
  // will return the situation of the Node the nodePointer is currentlyPointing
  // when called this method will help to determine the current location of the user in the story
  String getSituation( ) {
    if( nodePointer == null ) {
      return "End";
    }
    else
      return nodePointer!.situation;
  }

  StoryTree() {
    tree1 = Node(
      _situations.elementAt(0),

      leftOption: _situations.elementAt(1), leftNode: Node(
          _situations.elementAt(2),
          leftOption: _situations.elementAt(3), leftNode: Node(
              _situations.elementAt(4),
          ),
          rightOption: _situations.elementAt(5), rightNode: Node(
              _situations.elementAt(6)
          ),
          // end of left branch of the Story tree

      ),
      rightOption: _situations.elementAt(7), rightNode: Node(
        _situations.elementAt(8),
        leftOption: _situations.elementAt(9), leftNode: Node(
          _situations.elementAt(10),
          leftOption: _situations.elementAt(11), leftNode: Node(
              _situations.elementAt(12),
          ),
          rightOption: _situations.elementAt(13), rightNode: Node(
            _situations.elementAt(14),
          ),
        ),
        rightOption: _situations.elementAt(15), rightNode: Node(
          _situations.elementAt(16),
          leftOption: _situations.elementAt(17), leftNode: Node(
            _situations.elementAt(18), // the game would finish here
          ),
          rightOption: _situations.elementAt(19), rightNode: Node(
            _situations.elementAt(20)
          ),
        ),
      ),
      // end of the right branch of the story tree
    );

    // pointing the nodePointer to the root of the story tree
    nodePointer = this.tree1 ;
  }

    // this method would focus on the right branch of the story
    bool jumpLeft() {
      if( nodePointer!.leftOption == null ) {
        // End of the Story
        return true;
      }
      else {
        if( nodePointer!.leftNode!.situation != _situations.elementAt(18) )
          nodePointer = nodePointer!.getLeftNode();
        else {
          hasWon = true;
        }
        return false;
      }
    }

    // this method would focus on the right branch of the story
    bool jumpRight() {
      if( nodePointer!.rightOption == null ) {
        // End of the Story
        return true;
      }
      else{
        if( nodePointer!.rightNode!.situation != _situations.elementAt(18) )
          nodePointer = nodePointer!.getRightNode();
        else
          hasWon= true ;
        return false;
      }
    }

    String getRightSituation() {
      if( nodePointer!.rightOption != null ){
        return nodePointer!.rightOption!;
      }
      else {
        return "Restart";
      }
    }

    String getLeftSituation() {
      if( nodePointer!.leftOption != null ){
        return nodePointer!.leftOption!;
      }
      else
        return "Restart";
    }

    void reset() {
      this.nodePointer = this.tree1;
      this.hasWon= false;
    }
}