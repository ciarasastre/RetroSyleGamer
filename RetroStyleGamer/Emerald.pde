class Emerald extends GemData
{
  //PImage emerald;
  //PVector xyVal;
  
  boolean dead = false;
  
  int xVal = 50;
  int yVal = 80;

  
  Emerald(float x, float y, int p)
  {
    super(x,y,p);
  }
  
  
  void gemPos()
  {
    //emerald = loadImage("emerald0.png");
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
                    fill(0);
          ellipse(x,y,70,70);
          //image(emerald, x-50, y-90); 
        } 
      }  
  }
  
  
}