class PowerUpData
{
  int pX;
  int pY;
  int pSize = 20;
  
  boolean coffee;
  float coffeeTime = 0;
  boolean dead = false;
  
  void coffeeDisplay()
  {
    pX = 450;
    pY = 560;
    coffee = true;

    if(charX+50 > pX && charX+50 < pX+100 && charY+80 > pY && charY+80 < pY+160)
    {
       dead = true;
    }
    else
    {
      if(dead == false)
      {
        fill(0);
        ellipse(pX,pY,pSize,pSize);
          
      }
      
    }
    
  }
  
  void getCoffee()
  {
    if(charX+50 > pX && charX+50 < pX+100 && charY+80 > pY && charY+80 < pY+160)
    {
      coffee = false;
    }
    
    if(coffee == true)
    {
      coffeeTime++;
      
      charSpeed = 20;
      
      if(coffeeTime > 200)
      {
        charSpeed = 5;
      }
    }
    
  }
}