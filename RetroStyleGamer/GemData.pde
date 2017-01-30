class GemData 
{
  //Declare datatypes here

  int gemVal; //coins = 1
  int gemSize;
  
  boolean state; // 1=alive 0=dead
  
  int xVal;
  int yVal;
  
  boolean available;
  
  int x;
  int y;
  
  GemData(int xGive, int yGive)
  {
    //Constuctors here
    gemSize = 45;
    
    x = xGive;
    y = yGive;
    
    xVal = 50;
    yVal = 80;
    
    available = true;

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