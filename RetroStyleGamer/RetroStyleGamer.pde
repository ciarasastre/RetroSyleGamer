/* Retro style game where you play as a greedy X-Banker
    who has dug himself deep into the mines to discover rare gems!
    But "Time is money" for every second your total money will decrease.
*/

//CLASSES
GemData coin;
DoorData door;
BulletData bullet;

int gameScreen = 0;

//Mapping Variables
int startX= 0;
int startY= 0;
int recW = 100;
int recH = 160;
int mapColourR = 242;
int mapColourG = 144;
int mapColourB = 255;
int map = 1;

//Score Variables
int scoreX = 10;
int scoreY = 30;
int score = 0;
int highScoreX = 10;
int highScoreY = 60;
int highScore = 0;
int time = 0;

//Character Variables
int charX = 450;
int charY = 400;
int charSize = 20;
int charSpeed = 10;

//Bullet Variables
int bullX = 450;
int bullY = 400;
int bullSize = 5;
//Array for Gems
ArrayList<GemData> coins = new ArrayList<GemData>();

void setup()
{
  size(900,800); //Width and Height
  coin = new GemData();
  door = new DoorData();
  bullet = new BulletData();
  
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
  text("Click to Start", height/2, width/2);
  
}

void gameScreen()
{
  background(255);
  mapping();
  score();
  character();
  charMove();
  mapDisplay();
  bullets();
  
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
  fill(mapColourR, mapColourG, mapColourB);
  
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

//Score is kept here
void score()
{
  fill(0);
  textSize(30);
  text("Score = "+score, scoreX, scoreY);
  text("HighScore = "+highScore, highScoreX,  highScoreY);
  
  // Highscore 
  if(score >= highScore)
  {
    highScore = score;
  }
  
  //Coins deplete every second
  time++;
  
  if(time >= 100)
  {
    score--;
    time = 0 ;
  }
  
}

//This creates the character
void character()
{
  fill(0);
  ellipse(charX, charY, charSize, charSize);
  
}

//Moves Character
void charMove()
{
  if(keyPressed)
  {
    
    if(keyCode == RIGHT)
    {
      charX += charSpeed;
    }
    
    if(keyCode == LEFT)
    {
      charX -= charSpeed;
    }
    
    if(keyCode == UP)
    {
      charY -= charSpeed;
    }
    
    if(keyCode == DOWN)
    {
      charY += charSpeed;
    }
    
  }
}

//Here is where gems are displayed
void mapDisplay()
{
  switch(map)
  {
    case(1):
    {
      //Change colour to PINK
      mapColourR = 242;
      mapColourG = 144;
      mapColourB = 255;
      
      coin.gemMapping1();
      coin.gemScore1();
      door.doorPosR();
      door.doorPosB();
      
      door.doorPosRTrigger();
      door.doorPosBTrigger();
      break;
    }
    
    case(2):
    {
      //Change colour to GREEN
      mapColourR = 0;
      mapColourG = 255;
      mapColourB = 0;
      
      door.doorPosL();
      door.doorPosR();
      
      door.doorPosLTrigger();
      door.doorPosRTrigger();
      break;
    }
    
    case(3):
    {
      //Change colour to PINK
      mapColourR = 242;
      mapColourG = 144;
      mapColourB = 255;
      
      door.doorPosL();
      door.doorPosB();
      
      door.doorPosLTrigger();
      door.doorPosBTrigger();
      break;
    }
    
    case(4):
    {
      //Change colour to GREEN
      mapColourR = 0;
      mapColourG = 255;
      mapColourB = 0;
      
      door.doorPosT();
      door.doorPosB();
      
      door.doorPosTTrigger();
      door.doorPosBTrigger();
      break;
    }
    
    case(5):
    {
      //Change colour to YELLOW
      mapColourR = 240;
      mapColourG = 255;
      mapColourB = 77;

      door.doorPosT();
      
      door.doorPosTTrigger();
      break;
    }
    
    case(6):
    {
      //Change colour to GREEN
      mapColourR = 0;
      mapColourG = 255;
      mapColourB = 0;
      
      door.doorPosT();
      door.doorPosB();
      
      door.doorPosTTrigger();
      door.doorPosBTrigger();
      break;
    }
    
    case(7):
    {
      //Change colour to YELLOW
      mapColourR = 240;
      mapColourG = 255;
      mapColourB = 77;

      door.doorPosT();
      
      door.doorPosTTrigger();
      break;
    }
  }//End switch
  
}

void bullets()
{
      //This section is for shooting
      bullet.display();
      bullet.shootLeft();
      
      
      /* this creates 1 that moves across only when i hold down
          try changing it to AWSD and turning BULLET into a class
          Object so a new bullet can be called each time a button is pressed
      */
      
    
}