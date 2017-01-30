class GemData 
{
  //Declare datatypes here
  int gemVal; //coins = 1
  int gemSize;
  
  int xVal;
  int yVal;
  int x;
  int y;
  
  boolean state; 
  boolean available;
  boolean dead = false;
  
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
      //If the character has passed through the coin it dissapears
      if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal)
      {
        dead = true;
      }
      else
      {
        if(dead == false)
        {
          fill(252,232,5);
          ellipse(x,y, gemSize, gemSize); 
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
        //erase();
      }
      available = false;
    }
  }
  
  void score()
  {
    score++;
  }
  
}