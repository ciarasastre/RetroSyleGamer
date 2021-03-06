/* Retro style game where you play as a greedy X-Banker
    who has dug himself deep into the mines to discover rare gems!
    But "Time is money" for every second your total money will decrease.
*/

//MUSIC 
import ddf.minim.*;

Minim minim; //audio context
AudioPlayer main;
AudioPlayer bossM;

//CLASSES
DoorData door;
EnemyData boss;
Coffee item;
BulletData hitBullet;

//FONTS
PFont base;
PFont title;
PFont scoreF;
PFont norm;

//IMAGES
PImage[] manFront = new PImage[3];
PImage[] manLeft = new PImage[3];
PImage[] manRight= new PImage[3];
PImage[] manBack= new PImage[3];
PImage[] intro = new PImage[2];

PImage keyImg;
PImage floor;
PImage introCoin;
PImage introBack;
PImage win;
PImage lose;

//ARRAYLIST
ArrayList<BulletData> bullets; //this is where our bullets will be stored

Coin[] coin = new Coin[21];
Ruby[] ruby = new Ruby[21];
Emerald[] emerald = new Emerald[21];

//Game Navigation Variables
int gameScreen = 0;
int index = 0;
int time = 0;
  
//Mapping Variables
int startX= 0;
int startY= 0;
int recW = 100;
int recH = 160;
int map = 1;

//Score Variables
int scoreX = 20;
int scoreY = 50;
int score = 1;
int highScore = 0;

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

//Key Variables
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
  
  //FONTS
  base = loadFont("ARDELANEY-48.vlw"); 
  title = loadFont("Broadway-48.vlw");
  scoreF = loadFont("Constantia-Bold-30.vlw"); 
  norm = loadFont("Constantia-Bold-20.vlw");
  
  //Music
  minim = new Minim(this);
  main = minim.loadFile("main.mp3");
  bossM = minim.loadFile("bossM.mp3");
  

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
      winScreen();
      break;
    }
    
    case(3):
    {
      loseScreen();
      break;
    }
    
    
  }//end switch
  
}// end draw
  
  
/************ SCREEN CONTENTS **************/

void initScreen()
{
  background(0);
  main.play();
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

void winScreen()
{
  //Background
  win = loadImage("win0.png");
  win.resize(900,800);
  image(win, startX, startY);
    
  //Writing
  fill(0);
  textFont(base);
  text("YOU WIN!", 290, 380);
  
  text("Your HighScore : "+highScore, 10, 780);
    
}

void loseScreen()
{
  lose = loadImage("lost.png");
  lose.resize(900,800);

  //Background
  image(lose, 0, 0); 
  
  //Writing
  fill(0);
  textFont(base);
  text("YOU LOSE", 340, 300);
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
  textFont(scoreF);
  text("Score = "+score, scoreX, scoreY);
  
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
      //Coin Distribution
      coin[0].gemPos();
      coin[6].gemPos();
      coin[14].gemPos();
      coin[20].gemPos();
      
      ruby[3].gemPos();
      
      emerald[10].gemPos(); 
      
      coin[0].gemScore();
      coin[6].gemScore();
      coin[14].gemScore();
      coin[20].gemScore();
      
      ruby[3].gemScore();
      
      emerald[10].gemScore(); 
      
      item.getCoffee();
      
      //Door Section
      door.doorPosR();
      door.doorPosB();
      
      door.doorPosRTrigger();
      door.doorPosBTrigger();
      
      //Possible Lose
      coin[0].lose();
      break;
    }
    
    case(2):
    {
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
      
      //Possible Lose
      coin[0].lose();
      break;
    }
    
    case(3):
    {
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
      
      ruby[5].gemScore();
      ruby[6].gemScore();
      
      item.getCoffee();
      
      door.doorPosL();
      door.doorPosB();
      
      door.doorPosLTrigger();
      door.doorPosBTrigger();
      
      //Possible Lose
      coin[0].lose();
      
      break;
    }
    
    case(4):
    {
      coin[18].gemPos();
      coin[19].gemPos();
      
      coin[18].gemScore();
      coin[19].gemScore();
      
      ruby[10].gemPos();
      
      ruby[10].gemScore();
      
      item.getCoffee();
      
      door.doorPosT();
      door.doorPosB();
      
      door.doorPosTTrigger();
      door.doorPosBTrigger();
      
      //Possible Lose
      coin[0].lose();
      
      break;
    }
    
    case(5):
    {
      emerald[7].gemPos();
      emerald[13].gemPos();
      
      emerald[7].gemScore();
      emerald[13].gemScore();
      
      ruby[17].gemPos();
      ruby[17].gemScore();
      
      item.getCoffee();
      
      door.doorPosT();
      
      door.doorPosTTrigger();
      
      //Possible Lose
      coin[0].lose();
      
      break;
    }
    
    case(6):
    {
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
      
      ruby[19].gemScore();
      
      item.getCoffee();
      
      door.doorPosT();
      door.doorPosB();
      
      door.doorPosTTrigger();
      
      //Possible Lose
      coin[0].lose();
      
      //You cannot access Map 7 with out key
      if(keyAvail == true)
      {
        door.doorPosBTrigger();
      }
      
      break;
    }
    
    case(7):
    {
      main.pause();
      bossM.play();
      
      door.doorPosT();
      door.doorPosTTrigger();
        
      item.getCoffee();
        
      boss.enDisplay();
      boss.enMove();
      boss.hit();
      boss.drawHealth();
        
      //Possible Lose
      coin[0].lose();
      
      break;
    }
  }//End switch
  
}

void moveBL() //Move Bullets Left
{
  for(BulletData temp : bullets)
  {
     temp.shootDown();
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
       keyImg.resize(100,100);
       image(keyImg, 800, 0);
    }
    else
    {
      fill(255);
      textFont(norm);
      text("You need a Key!", 700, 50);
    }
}

void introScreen()
{
  //Background
  introBack = loadImage("introBack.png");
  introBack.resize(900,800);
  image(introBack, startX, startY); 
  
  //Writing
  fill(255);
  textFont(title);
  text(" $$ Time Is Money $$ ", 190, 180);
  
  textFont(norm);
  text("Every second your score goes down so hurry!", 240, 240);
  text("Click to Start", 380, 300);  
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
     image(intro[index],400,500);
  }
  
}