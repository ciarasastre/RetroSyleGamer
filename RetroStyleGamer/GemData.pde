class GemData 
{
  //Declare datatypes here
  float randRow;
  float randCol;
  float randChooseX;
  
  int gemVal; //coins = 1
  int gemSize;
  
  int alive;
  boolean state; // 1=alive 0=dead
  int refNum;
  
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
  
  boolean available;
  
  float randX[] = {50, 150, 250, 350, 450, 550, 650, 750, 850};
  float randY[] = {80, 240, 400, 560, 720};
  
  int x;
  int y;
  
  GemData(int xGive, int yGive)
  {
    //constuctors here
    gemSize = 45;
    
    randRow = random(1,9);
    randCol = random(1,5);
    
    x = xGive;
    y = yGive;
    
    xVal = 50;
    yVal = 80;
    
    available = true;
    state = true;

  }
  
  // This section controls the coin created at each position
  void gemPos()
  {
      fill(252,232,5);
      ellipse(x,y, gemSize, gemSize); 
  }
  
  void gemScore()
  {
    //Checks if character goes over coin AND gives player 1 point
    if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal)
    {
      //This makes sure no more than 1 coin gets added
      if(available == true)
      {
        score();
        //erase();
      }
      available = false;
    }
  }
  
  void erase()
  {
    fill(0,255,0);
    ellipse(x,y,gemSize, gemSize);
  }
  
  void score()
  {
    score++;
  }
  
}