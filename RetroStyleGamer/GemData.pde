class GemData
{
  PImage coin;
  
  //Declare datatypes here
  int gemVal; //coins = 1
  int gemSize;
  
  int xVal;
  int yVal;
  int x;
  int y;
  int center;
  boolean state; 
  boolean available;
  boolean dead = false;
  
  GemData(int xGive, int yGive)
  {
    //Constuctors here
    gemSize = 70;
    
    x = xGive;
    y = yGive;
    
    xVal = 50;
    yVal = 80;
    
    available = true;
    
    coin = loadImage("coin0.png");
  }
  
  // This section controls the coin created at each position
  void gemPos()
  {
      //If the character has passed through the coin it dissapears
      if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal && newMap == true)
      {
          dead = true;  
          
      }
      else
      {
        if(dead == false)
        {
          
          image(coin, x-50, y-90);
          
        }
        
      }
      
      
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
    score++;
  }
  
}