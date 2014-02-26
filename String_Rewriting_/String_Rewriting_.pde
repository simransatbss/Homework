// Contains the starting, or intial, word (axiom)
String axiom = "Ff-+fF";

//Contains the new word 
String word = "";

// Will contain all the rules that apply for this L-system
StringDict rules; 

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
  
  //slow down the refresh rate 
  frameRate(1);
  
  //Create the String dictionary 
  // "Using the StringDIct class, create a new StringDict object, named "rules" " 
  rules =  new StringDict(); 
  
  //Add rules (key-value pairs)
  //Add a key and then provide a value
  rules.set("F", "F-F");
  rules.set("-", "fff");
  rules.set("+", "+F+");

}

// This function runs repeatedly ( unless we stop it with noLoop() )
void draw() {
  // Re-paint the background
  background(255, 255, 255); //white 
  
  // Print text to the screen
  // Arguments:
  //   string, x, y
  // This draws it on the screen at 0, 100
  text("The axiom is: " + axiom, 0, 100);
  
  //show what frame is being displayed 
  text("current frame is: " + frameCount, 0, 200);
  
  //Check each character - if it matches a rule, replace it 
  if (axiom.charAt(frameCount - 1) == 'F') {
    //replace
    word += rules.get("F");
  }else if(axiom.charAt(frameCount - 1) == '-')  {
    word += rules.get("-");
    
  }else if(axiom.charAt(frameCount - 1) == '+')  {
    word += rules.get("+");
  }else{
    // copy the character directly 
    word += axiom.charAt(frameCount - 1);
  }
  
  
  
  //Print the word 
  text("current word is: " + word, 0, 300);
  
  //Stope before we go out of bounds.. past the end of the string 
  if (frameCount == axiom.length() ) {
    noLoop();
    
  }
  
}
