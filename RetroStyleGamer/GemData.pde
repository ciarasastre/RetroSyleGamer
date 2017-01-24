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
  
  int topClear1;
  int topClear2;
  int topClear3;
  
  int midClear1;
  int midClear2;
  int midClear3;
  
  int botClear1;
  int botClear2;
  int botClear3;
  
  boolean test;
  
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
    
    test = true;

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
    if(topClear1 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[2], randY[1], gemSize, gemSize);
    }
    
    if(topClear2 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[3], randY[1], gemSize, gemSize);
    }
    
    if(topClear3 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[4], randY[1], gemSize, gemSize);
    }
    
    //Mid Section
    if(midClear1 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[1], randY[1], gemSize, gemSize);
    }
    
    if(midClear2 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[1], randY[2], gemSize, gemSize);
    }
    
    if(midClear3 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[1], randY[3], gemSize, gemSize);
    }
    
    //Bot Section
    if(botClear1 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[2], randY[3], gemSize, gemSize);
    }
    
    if(botClear2 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[3], randY[3], gemSize, gemSize);
    }
    
    
    if(botClear3 == 1)
    {
      fill(dead);
      noStroke();
      ellipse(randX[4], randY[3], gemSize, gemSize);
    }
    
  }
  
  void gemScore1()
  {
    //Top Section
    if(charX <= randX[2]+xVal && charX >= randX[2]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      topClear1 = 1; 
      
      if(test == true)
      {
        score(); // = score + 1;
      }
      
      test = false;
    }
    
    if(charX <= randX[3]+xVal && charX >= randX[3]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      //score();
      topClear2 = 1; 
    }
    
    if(charX <= randX[4]+xVal && charX >= randX[4]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      //score();
      topClear3 = 1; 
    }
    
    //Mid Section
    if(charX <= randX[1]+xVal && charX >= randX[1]-xVal && charY <= randY[1]+yVal && charY >= randY[1]-yVal)
    {
      //score();
      midClear1 = 1; 
    }
    
    if(charX <= randX[1]+xVal && charX >= randX[1]-xVal && charY <= randY[2]+yVal && charY >= randY[2]-yVal)
    {
      //score();
      midClear2 = 1; 
    }
    
    if(charX <= randX[1]+xVal && charX >= randX[1]-xVal && charY <= randY[3]+yVal && charY >= randY[3]-yVal)
    {
      //score();
      midClear3 = 1; 
    }
    
    //Bot Section
    if(charX <= randX[2]+xVal && charX >= randX[2]-xVal && charY <= randY[3]+yVal && charY >= randY[3]-yVal)
    {
      //score();
      botClear1 = 1; 
    }
    
    if(charX <= randX[3]+xVal && charX >= randX[3]-xVal && charY <= randY[3]+yVal && charY >= randY[3]-yVal)
    {
      //score();
      botClear2 = 1; 
    }
    
    if(charX <= randX[4]+xVal && charX >= randX[4]-xVal && charY <= randY[3]+yVal && charY >= randY[3]-yVal)
    {
      //score();
      botClear3 = 1; 
    }

  }
  
  void score()
  {
    score++;
  }
  
}