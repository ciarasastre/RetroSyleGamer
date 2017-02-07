class GemData
{
  
  float x;
  float y;
  int p;
  int gemsize = 70;
  
  int xVal = 50;
  int yVal = 80;
  boolean available = true;
  
  
  GemData(float giveX, float giveY, int giveP)
  {
    x = giveX;
    y = giveY;
    p = giveP;
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
        
      }
      available = false;
    }
  }
  
  void score()
  {
    score = score + p;
    
  }
  
  void lose()
  {
    if(score < 0)
    {
      gameScreen = 3;
    }
  }
  
}