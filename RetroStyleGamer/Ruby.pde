class Ruby extends GemData
{
  PImage ruby;
  
  boolean dead = false;
  
  int xVal = 50;
  int yVal = 80;

  Ruby(float x, float y, int p)
  {
    super(x,y,p);
  }
  
  
  void gemPos()
  {
    ruby = loadImage("ruby0.png");
    //xyVal = new PVector(50,80);
    
      //If the character has passed through the coin it dissapears
      if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal)
      {
          dead = true;  
          
      }
      else
      {
        if(dead == false)
        {
          image(ruby, x-50, y-90); 
        } 
      }  
  }
}