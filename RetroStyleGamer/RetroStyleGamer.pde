/* Retro style game where you play as a greedy X-Banker
    who has dug himself deep into the mines to discover rare gems!
    But "Time is money" for every second your total money will decrease.
*/
int gameScreen = 0;

//Mapping Variables
int startX= 0;
int startY= 0;
int recW = 100;
int recH = 160;

void setup()
{
  size(900,800); //Width and Height
  
}

void draw()
{
  //Display contents of current screen
  switch(gameScreen)
  {
    case(0):
    {
      initScreen();
      break;
    }
    
    case(1):
    {
      gameScreen();
      break;
    }
    
    case(2):
    {
      gameOverScreen();
      break;
    }
    
    
  }//end switch
  
}// end draw
  
  
/************ SCREEN CONTENTS **************/

void initScreen()
{
  background(0);
  //textAlign(CENTER);
  text("Click to Start", height/2, width/2);
  
}

void gameScreen()
{
  background(255);
  mapping();
  
}

void gameOverScreen()
{
  
}

/******** INPUTS *****************/
public void mousePressed()
{
  //if we are on initial screen when clicked it will start the game
  
  if(gameScreen == 0)
  {
    startGame();
  }
  
}


/********** OTHER FUNCTIONS *********/

//This method sets the necessery variables to start the game
void startGame()
{
  gameScreen = 1;
}

//This method discovers the blocks available for character movement
void mapping()
{
  //fill( random(0,255),random(0,255),random(0,255) );
  fill(1,3,255);
  strokeWeight(10);
  stroke(0);
  
  for(int i=0; i<9; i++)
  {
    for(int j = 0; j<5; j++)
    {
      rect(startX,startY,recW,recH);
      startY += 160;
    }
    
    startY = 0;
    startX += 100;
   
  }
  
  startX = 0;
}