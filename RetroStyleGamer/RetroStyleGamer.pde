/* Retro style game where you play as a greedy X-Banker
    who has dug himself deep into the mines to discover rare gems!
    But "Time is money" for every second your total money will decrease.
*/

//CLASSES
DoorData door;
EnemyData boss;
PowerUpData item;
BulletData hitBullet;

PImage[] manFront = new PImage[3];
PImage[] manLeft = new PImage[3];
PImage[] manRight= new PImage[3];
PImage[] manBack= new PImage[3];

ArrayList<BulletData> bullets; //this is where our bullets will be stored
GemData[] coin = new GemData[21]; 

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
boolean newMap = false;

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
int charSpeed = 5;
int charIndex = 0;
int charTime = 0;

int extra = 0;
void setup()
{
  size(900,800); //Width and Height
  
  door = new DoorData();
  boss = new EnemyData();
  item = new PowerUpData();
  //hitBullet = new BulletData();
  
  bullets = new ArrayList();
  
  coin[0] = new GemData(150,240);
  coin[1] = new GemData(250,240);
  coin[2] = new GemData(350,240);
  coin[3] = new GemData(450,240);
  coin[4] = new GemData(550,240);
  coin[5] = new GemData(650,240);
  coin[6] = new GemData(750,240);
  
  //Set Middle coins
  coin[7] = new GemData(150,400);
  coin[8] = new GemData(250,400);
  coin[9] = new GemData(350,400);
  coin[10] = new GemData(450,400);
  coin[11] = new GemData(550,400);
  coin[12] = new GemData(650,400);
  coin[13] = new GemData(750,400);
  
  //Set Bottom coins
  coin[14] = new GemData(150,560);
  coin[15] = new GemData(250,560);
  coin[16] = new GemData(350,560);
  coin[17] = new GemData(450,560);
  coin[18] = new GemData(550,560);
  coin[19] = new GemData(650,560);
  coin[20] = new GemData(750,560);
  
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
  
  mapDisplay();
  charLoad();
  charMove();
  
  moveBL();
  displayAllBull();
  bulletControls();
}

void gameOverScreen()
{
    background(0);
    text("YOU WIN", height/2, width/2);
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
void charLoad()
{
  for(int i = 0; i<manFront.length; i++)
  {
    manFront[i] = loadImage("frontManW"+i+".png");
  }
  
  for(int i = 0; i<manLeft.length; i++)
  {
    manLeft[i] = loadImage("leftManW"+i+".png");
  }
  
  for(int i = 0; i<manRight.length; i++)
  {
    manRight[i] = loadImage("rightManW"+i+".png");
  }
  
  for(int i = 0; i<manBack.length; i++)
  {
    manBack[i] = loadImage("backManW"+i+".png");
  }
  
}

//Moves Character
void charMove()
{
  if(keyPressed)
  {
    
    if(keyCode == RIGHT)
    {
      charX += charSpeed;
      
      if(charIndex == manRight.length-1)
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex = 0;
          charTime = 0;
        }
      }
      else
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex++;
          charTime = 0;
        }
      }
      image(manRight[charIndex],charX,charY);
    
    }
    
    if(keyCode == LEFT)
    {
      charX -= charSpeed;
      
      if(charIndex == manLeft.length-1)
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex = 0;
          charTime = 0;
        }
      }
      else
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex++;
          charTime = 0;
        }
      }
      image(manLeft[charIndex],charX,charY);
    }
    
    if(keyCode == UP)
    {
      charY -= charSpeed;
      
      if(charIndex == manBack.length-1)
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex = 0;
          charTime = 0;
        }
      }
      else
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex++;
          charTime = 0;
        }
      }
      image(manBack[charIndex],charX,charY);
    
    
    }
    
    if(keyCode == DOWN)
    {
      charY += charSpeed;
      
      if(charIndex == manFront.length-1)
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex = 0;
          charTime = 0;
        }
      }
      else
      {
        charTime+=1;
        
        if(charTime == 10)
        {
          charIndex++;
          charTime = 0;
        }
      }
      image(manFront[charIndex],charX,charY);
    }
    
  }
  else
  {
    charWait();
  }
  
}

void charWait()
{
  image(manFront[charIndex],charX,charY);
}

//Here is where gems are displayed
void mapDisplay()
{
  switch(map)
  {
    case(1):
    {
      newMap = true;
      //Change colour to PINK
      mapColourR = 242;
      mapColourG = 144;
      mapColourB = 255;
      
      //Coin Distribution
      for(int i =0; i<21; i++)
      {
          coin[i].gemPos();
        
      }
      
      for(int i =0; i<21; i++)
      {
        coin[i].gemScore();
      }
      
      //Door Section
      door.doorPosR();
      door.doorPosB();
      
      door.doorPosRTrigger();
      door.doorPosBTrigger();
      break;
    }
    
    case(2):
    {
      newMap = true;
      //Change colour to GREEN
      mapColourR = 0;
      mapColourG = 255;
      mapColourB = 0;
      
      //Coin Distribution
      coin[0].gemPos();
      coin[6].gemPos();
      coin[14].gemPos();
      coin[20].gemPos();
      
      
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
      
      item.coffeeDisplay();
      item.getCoffee();
      
      item.multiDisplay();
      item.getMulti();
      
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
      
      //Coin Distribution
      coin[0].gemPos();
      coin[6].gemPos();
      coin[14].gemPos();
      coin[20].gemPos();
      
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
      
      boss.enDisplay();
      boss.enMove();
      boss.hit();
      boss.drawHealth();
      break;
    }
  }//End switch
  
}

void moveBL() //Move Bullets Left
{
  for(BulletData temp : bullets)
  {
     temp.shootLeft();
  }
}

void displayAllBull()
{
  for(BulletData temp : bullets)
  {
     temp.display(); 
  }
}

void bulletControls()//mousePressed()//add a new bullet if mouse is clicked
{
  if(keyPressed)
  {
    if(key == ' ')
    {
      BulletData temp = new BulletData(charX, charY);
      bullets.add(temp);
    }
  }
  
}