class GemData 
{
  //Declare datatypes here
  float randRow;
  float randCol;
  float randChooseX;
  
  int gemVal; //coins = 1
  int gemSize;
  
  int alive;
  int dead;
  
  int xVal;
  int yVal;
  
  int clear1;
  int clear2;
  int clear3;
  int clear4;
  int clear5;
  
  float randX[] = {50, 150, 250, 350, 450, 550, 650, 750, 850};
  float randY[] = {80, 240, 400, 560, 720};

  GemData()
  {
    //constuctors here
    gemSize = 10;
    
    alive = 0;
    dead  = 255;
    
    randRow = random(1,9);
    randCol = random(1,5);
    
    xVal = 50;
    yVal = 80;

  }
  
  void gemMapping1()
  {
    fill(alive);
    
    //Top Section
    ellipse(randX[2], randY[1], gemSize, gemSize);
    ellipse(randX[3], randY[1], gemSize, gemSize);
    ellipse(randX[4], randY[1], gemSize, gemSize); //right here
    
    //Mid Section
    ellipse(randX[1], randY[1], gemSize, gemSize);
    ellipse(randX[1], randY[2], gemSize, gemSize);
    ellipse(randX[1], randY[3], gemSize, gemSize);
    
    //Bot Section
    ellipse(randX[2], randY[3], gemSize, gemSize);
    ellipse(randX[3], randY[3], gemSize, gemSize);
    ellipse(randX[4], randY[3], gemSize, gemSize);
    
    
    //Top Section
    if(clear1 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[2], randY[1], gemSize, gemSize);
    }
    
    if(clear2 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[3], randY[1], gemSize, gemSize);
    }
    
    if(clear3 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[4], randY[1], gemSize, gemSize);
    }
    
  }
  
  void gemScore1()
  {
    //Top Section
    if(charX <= randX[2]+xVal && charX >= randX[2]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      score = score + 1;
      clear1 = 1; 
    }
    
    if(charX <= randX[3]+xVal && charX >= randX[3]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      score = score + 1;
      clear2 = 1; 
    }
    
    if(charX <= randX[4]+xVal && charX >= randX[4]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      score = score + 1;
      clear3 = 1; 
    }
    
    
  }
  
}