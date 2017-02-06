class PowerUpData
{
  int coffeeX;
  int coffeeY;
  int coffeeSize = 20;
  boolean coffee;
  float coffeeTime = 0;
  
  boolean coffeeDead = false;
  
  
  int multiX;
  int multiY;
  int multiSize = 20;
  boolean multi;
  float multiTime = 0;
  
  boolean multiDead = false;
  
  void coffeeDisplay()
  {
    coffeeX = 450;
    coffeeY = 560;
    coffee = true;

    if(charX+50 > coffeeX && charX+50 < coffeeX+100 && charY+80 > coffeeY && charY+80 < coffeeY+160)
    {
       coffeeDead = true;
    }
    else
    {
      if(coffeeDead == false)
      {
        fill(0);
        ellipse(coffeeX,coffeeY,coffeeSize,coffeeSize);    
      }
      
    }
    
  }
  
  void getCoffee()
  {
    if(charX+50 > coffeeX && charX+50 < coffeeX+100 && charY+80 > coffeeY && charY+80 < coffeeY+160)
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
  
  void multiDisplay()
  {
    multiX = 650;
    multiY = 560;
    multi = true;

    if(charX+50 > multiX && charX+50 < multiX+100 && charY+80 > multiY && charY+80 < multiY+160)
    {
       multiDead = true;
    }
    else
    {
      if(multiDead == false)
      {
        fill(255);
        ellipse(multiX,multiY,multiSize,multiSize);    
      }
      
    }
  }
    
    void getMulti()
    {
      if(charX+50 > multiX && charX+50 < multiX+100 && charY+80 > multiY && charY+80 < multiY+160)
      {
        multi = false;
      }
      
      if(multi == true)
      {
        multiTime++;
        
        //charSpeed = 20;
        
        if(multiTime > 200)
        {
          //charSpeed = 5;
        }
      }
      
    }
}