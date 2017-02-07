/* Retro style game where you play as a greedy X-Banker
    who has dug himself deep into the mines to discover rare gems!
    But "Time is money" for every second your total money will decrease.
*/

//CLASSES
DoorData door;
EnemyData boss;
Coffee item;
BulletData hitBullet;

PImage[] manFront = new PImage[3];
PImage[] manLeft = new PImage[3];
PImage[] manRight= new PImage[3];
PImage[] manBack= new PImage[3];

PImage[] intro = new PImage[2];
PImage introCoin;
ArrayList<BulletData> bullets; //this is where our bullets will be stored

Coin[] coin = new Coin[21];
Ruby[] ruby = new Ruby[21];
Emerald[] emerald = new Emerald[21];

//Game Navigation Variables
int gameScreen = 0;
int option;
int index = 0;
int time = 0;

//Mapping Variables
PImage floor;
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
int point = 0;

//Character Variables
int charX = 450;
int charY = 400;
int charSize = 20;
int charSpeed = 5;
int charIndex = 0;
int charTime = 0;

//Gem Variables
int xCount = 150;
int coinPoint = 1;
int rubyPoint = 3;
int emeraldPoint = 5;
boolean multi = true;

//Key Variables
PImage keyImg;
int keyX = 450;
int keyY = 700;
int keySize = 70;
boolean keyAvail = false;

void setup()
{
  size(900,800); //Width and Height
  
  door = new DoorData();
  boss = new EnemyData();
  item = new Coffee();
  
  bullets = new ArrayList();
  
  //Placing coin in set position
  for(int i = 0; i<7; i++)
  {
    coin[i] = new Coin(xCount, 240,coinPoint);
    xCount = xCount+100;  
  }
  
  //Reset counter each time
  xCount = 150;
  
  for(int i = 7; i<14; i++)
  {
    coin[i] = new Coin(xCount, 400,coinPoint);
    xCount = xCount+100;  
  }
  
  //Reset counter each time
  xCount = 150;
  
  for(int i = 14; i<21; i++)
  {
    coin[i] = new Coin(xCount, 560,coinPoint);
    xCount = xCount+100;  
  }
  
  /////////////////////////////////
  
  xCount = 150;
  
  //Placing RUBY in set position
  for(int i = 0; i<7; i++)
  {
    ruby[i] = new Ruby(xCount, 240,rubyPoint);
    xCount = xCount+100;  
  }
  
  //Reset counter each time
  xCount = 150;
  
  for(int i = 7; i<14; i++)
  {
    ruby[i] = new Ruby(xCount, 400,rubyPoint);
    xCount = xCount+100;  
  }
  
  //Reset counter each time
  xCount = 150;
  
  for(int i = 14; i<21; i++)
  {
    ruby[i] = new Ruby(xCount, 560,rubyPoint);
    xCount = xCount+100;  
  }
  
  /////////////////////////////////
  
  xCount = 150;
  
  //Placing EMERALD in set position
  for(int i = 0; i<7; i++)
  {
    emerald[i] = new Emerald(xCount, 240, emeraldPoint);
    xCount = xCount+100;  
  }
  
  //Reset counter each time
  xCount = 150;
  
  for(int i = 7; i<14; i++)
  {
    emerald[i] = new Emerald(xCount, 400, emeraldPoint);
    xCount = xCount+100;  
  }
  
  //Reset counter each time
  xCount = 150;
  
  for(int i = 14; i<21; i++)
  {
    emerald[i] = new Emerald(xCount, 560, emeraldPoint);
    xCount = xCount+100;  
  }
  
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
  introScreen();
  introMan();
  
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
  key();
  
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
  floor = loadImage("floor0.png");
  
  for(int i=0; i<9; i++)
  {
    for(int j = 0; j<5; j++)
    {
      image(floor, startX, startY); 
      startY += 160;
    }
    
    startY = 0;
    startX += 100;
   
  }
  
  startX = 0;
  
  fill(70,47,1);
  rect(0,0,900,80);
}

//Score is kept here
void score()
{
  fill(255);
  noStroke();
  textSize(30);
  text("Score = "+score, scoreX, scoreY);
  text("HighScore = "+highScore, highScoreX,  highScoreY);
  
  // Highscore 
  if(score >= highScore)
  {
    highScore = score;
  }
  
  //coin deplete every second
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
      //Coin Distribution
      coin[0].gemPos();
      coin[6].gemPos();
      emerald[10].gemPos(); // should be an emerald / ruby
      coin[14].gemPos();
      coin[20].gemPos();
      
      ruby[3].gemPos();
      ruby[3].gemScore();
      
      coin[0].gemScore();
      coin[6].gemScore();
      emerald[10].gemScore(); // should be an emerald / ruby
      coin[14].gemScore();
      coin[20].gemScore();
      
      item.getCoffee();
      
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
      coin[1].gemPos();
      coin[4].gemPos();
      coin[5].gemPos();
      coin[16].gemPos();
      
      coin[1].gemScore();
      coin[4].gemScore();
      coin[5].gemScore();
      coin[16].gemScore();
      
      //Coffee powerUp
      item.coffeeDisplay();
      item.getCoffee();
      
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
      
      coin[2].gemPos();
      coin[3].gemPos();
      coin[11].gemPos();
      coin[12].gemPos();
      coin[13].gemPos();
      coin[15].gemPos();
      coin[17].gemPos();
      
      coin[2].gemScore();
      coin[3].gemScore();
      coin[11].gemScore();
      coin[12].gemScore();
      coin[13].gemScore();
      coin[15].gemScore();
      coin[17].gemScore();
      
      ruby[5].gemPos();
      ruby[6].gemPos();
      
      item.getCoffee();
      
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

      coin[18].gemPos();
      coin[19].gemPos();
      
      coin[18].gemScore();
      coin[19].gemScore();
      
      ruby[10].gemPos();
      
      item.getCoffee();
      
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
      
      emerald[7].gemPos();
      emerald[13].gemPos();
      
      emerald[7].gemScore();
      emerald[13].gemScore();
      
      ruby[17].gemPos();
      ruby[17].gemScore();
      
      item.getCoffee();
      
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
      coin[7].gemPos();
      coin[8].gemPos();
      coin[9].gemPos();
      coin[10].gemPos();
      
      coin[7].gemScore();
      coin[8].gemScore();
      coin[9].gemScore();
      coin[10].gemScore();
      
      ruby[19].gemPos();
      
      item.getCoffee();
      
      door.doorPosT();
      door.doorPosB();
      
      door.doorPosTTrigger();
      
      //You cannot access Map 7 with out key
      if(keyAvail == true)
      {
        door.doorPosBTrigger();
      }
      
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
        
        item.getCoffee();
        
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

void key()
{
  keyImg = loadImage("key0.png");
  
  if(map == 5)
    {
    if(charX+50 > keyX && charX+50 < keyX+100 && charY+80 > keyY && charY+80 < keyY+160)
      {
         keyAvail = true;
         
      }
      else
      {
        if(keyAvail == false)
        {
          image(keyImg, keyX-50, keyY-50); 
        }
        
      }
    }//end if map
    
    if(keyAvail == true)
    {
       keyImg.resize(90,10);
       image(keyImg, 800, 0);
    }    
}

void introScreen()
{
  //Background
  introCoin = loadImage("coin0.png");
  
  for(int i=0; i<9; i++)
  {
    for(int j = 0; j<5; j++)
    {
      image(introCoin, startX, startY); 
      startY += 160;
    }
    
    startY = 0;
    startX += 100;
   
  } 
  startX = 0;
  
  //Writing
  textSize(40);
  text("Time Is Money", 250, 100);
  
  textSize(20);
  text("Click to Start!", 300, 300);
 
  
}

void introMan()
{
  
  //This is for the intro/animation parts
  for(int i = 0; i<intro.length; i++)
  {
    intro[i] = loadImage("intro"+i+".png");
  }
  
  if(gameScreen == 0)
  {
    if(index == intro.length-1)
    {
          time+=1;
          
          if(time == 10)
          {
            index = 0;
            time = 0;
          }
     }
     else
     {
        time+=1;
          
        if(time == 10)
        {
          index++;
          time = 0;
          
         }
     }
        image(intro[index],400,400);
  }
  
}

    
  