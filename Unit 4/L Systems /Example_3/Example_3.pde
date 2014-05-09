// Contains the starting, or intial, word (axiom)
String axiom = "F+F+F+F";

// Contains the existing word
String existingWord = "";

// Contains the new (re-written) word
String newWord = "";

// Tracks how many times existing word has been re-written
int rewriteCount = 0;

// Will contain all the rules that apply for this L-system
StringDict rules; 

float intialX = 100;

float intialY = 300;

float lineLength = 300;

float currentLinelength = 0;

//float lineReduction = lineLength*3;

float turtleDirection = 0;

float angle = 90; 


// This function runs once.
void setup() {

  // Create the canvas
  size(800, 600);

  // White background
  background(255, 255, 255);

  // Black text
  fill(0, 0, 0);

  // Set text size
  textSize(24);

  // Slow down the refresh rate
  frameRate(1);

  // Create the string dictionary object
  // "Using the StringDict class, create a new StringDict object, named 'rules' "
  rules = new StringDict();

  // Add rules (key-value pairs)
  //         key     value
  rules.set("F", "F+fF-FF-F-FF+fFF-fF+FF+F+F-fFFF");

  // For the first re-write, the existing word is set to the axiom
  existingWord = axiom;
  rewriteCount = 1;

  //Rewrite the existing word according to the rules
  rewriteWord();
}

void draw() {
}


// Responds to key presses
void keyPressed() {

  // When the right arrow key is pressed, do another round of replacement
  if (key == CODED) {
    if (keyCode == RIGHT) {

      // New word from last time becomes existing word for this round of replacement
      existingWord = newWord;

      // Need to reset these variables to get ready for another round of replacement 
      newWord = "";
      rewriteCount += 1;

      // Do another level of replacement
      rewriteWord();
    }
  }
  // if the user presses the d key, draw the new word 
  if (key == 'd') {
    turtleDraw(); //draw the current word
  }
}

// rewriteWord
//
//Purpose: 
void rewriteWord() {

  // clean the canvas
  background (255, 255, 255);

  // Re-paint the background
  background(255, 255, 255); // white

  // Print what generation of replacement this is
  text("Have re-written word this many times: " + rewriteCount, 0, 450);


  //Iterate over each character
  for (int currentCharacter = 0; currentCharacter < existingWord.length(); currentCharacter ++) {

    // Check each character - if it matches a rule, replace it
    if ( existingWord.charAt(currentCharacter) == 'F') {
      // replace
      newWord += rules.get("F");
    } 
    else {
      // copy the character directly
      newWord += existingWord.charAt(currentCharacter);
    }

 
  }
}

void turtleDraw() {
  println("TURTTLE DRAW");
  translate(intialX, intialY);
  ellipse(0,0,5,5);
  currentLinelength = lineLength/pow(6,rewriteCount);
  for (int currentCharacter = 0; currentCharacter < newWord.length(); currentCharacter++) {

    // Print text to the screen
    // Arguments:
    //   string, x, y

    // Check each character - if it matches a rule, replace it
    if ( newWord.charAt(currentCharacter) == 'F') {
      line(0, 0, currentLinelength, 0);
      translate(currentLinelength,0);
    } 
    else if (newWord.charAt(currentCharacter) == '+') {
      rotate(radians(-1*angle));
    } 
    else if (newWord.charAt(currentCharacter) == '-') {
      rotate(radians(1*angle));
    }

  }
 
}
