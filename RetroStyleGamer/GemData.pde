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

    
  }
  
  void gemMapping()
  {
    fill(alive);
    ellipse(randX[0], randY[3], gemSize, gemSize);
    ellipse(randX[1], randY[2], gemSize, gemSize);
    
    if(charX == randX[0] && charY == randY[3])
    {
      score+=1;
      
    }
    
    if(charX == randX[1] && charY == randY[2])
    {
      score+=1;
    }

  }
  
}