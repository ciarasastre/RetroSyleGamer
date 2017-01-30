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
  
  boolean topCoin1;
  boolean topCoin2;
  boolean topCoin3;
  
  boolean midCoin1;
  boolean midCoin2;
  boolean midCoin3;
  
  boolean botCoin1;
  boolean botCoin2;
  boolean botCoin3;
  
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
    
    topCoin1 = true;
    topCoin2 = true;
    topCoin3 = true;
  
    midCoin1 = true;
    midCoin2 = true;
    midCoin3 = true;
  
    botCoin1 = true;
    botCoin2 = true;
    botCoin3 = true;
    
    state = true;

  }
  
  // This section controls the coin created at each position
  void gemPos()
  {
      fill(252,232,5);
      ellipse(x,y, gemSize, gemSize); 
  }
  
  void gemState()
  {
    
  }
  
  void gemScore()
  {
    //Top Section
    if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal)
    {
      //This makes sure no more than 1 coin gets added
      if(topCoin1 == true)
      {
        score();
      }
      topCoin1 = false;
    }
  }
  
  void erase()
  {
    fill(0);
    ellipse(x,y,gemSize, gemSize);
  }
  void score()
  {
    score++;
  }
  
}