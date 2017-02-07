class Coin extends GemData
{
  PImage coin;
  boolean dead = false;
  
  int xVal = 50;
  int yVal = 80;

  Coin(float x, float y, int p)
  {
    super(x,y,p);
  }
  
  
  void gemPos()
  {
    coin = loadImage("coin0.png");
    
    //If the character has passed through the coin it dissapears
    if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal)
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
   
}