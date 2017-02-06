class Temp
{
  float x;
  float y;
  int gemsize = 70;
  
  int xVal = 50;
  int yVal = 80;
  boolean available = true;
  
  Temp(float giveX, float giveY)
  {
    x = giveX;
    y = giveY;
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
    score = score + point;
  }
}