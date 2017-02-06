class Coin extends Temp
{
  
  int coinPoint = 1;
  boolean dead = false;
  
  int xVal = 50;
  int yVal = 80;
  
  Coin(float x, float y)
  {
    super(x,y);
  }
  
  
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
          fill(0);
          ellipse(x,y,70,70);
          //image(coin, x-50, y-90); 
        } 
      }  
  }
  
  
}