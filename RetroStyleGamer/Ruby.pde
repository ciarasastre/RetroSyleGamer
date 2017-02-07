class Ruby extends GemData
{
  PImage ruby;
  
  int rubyPoint = 3;
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
      if(charX <= x+xVal && charX >= x-xVal && charY <= y+yVal && charY >= y-yVal && newMap == true)
      {
          dead = true;  
          
      }
      else
      {
        if(dead == false)
        {
          //fill(0);
          //ellipse(x,y,70,70);
          image(ruby, x-50, y-90); 
        } 
      }  
  }
  
  
}