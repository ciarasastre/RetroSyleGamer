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

    if(charX > pX && charX < pX+100 && charY > pY && charY < pY+160)
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
    if(charX > pX && charX < pX+100 && charY > pY && charY < pY+160)
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