class PowerUpData
{
  PImage coffeeImg;
  int coffeeX;
  int coffeeY;
  int coffeeSize = 20;
  boolean coffee;

  int coffeeTime = 200;
  boolean coffeeDead = false;
  
  
  int multiX;
  int multiY;
  int multiSize = 20;
  boolean multi;
  float multiTime = 0;
  
  boolean multiDead = false;
  
  void coffeeDisplay()
  {
    coffeeImg = loadImage("coffee0.png");
    
    coffeeX = 350;
    coffeeY = 250;
    coffee = true;

    if(charX+50 > coffeeX && charX+50 < coffeeX+100 && charY+80 > coffeeY && charY+80 < coffeeY+160)
    {
       coffeeDead = true;
       
    }
    else
    {
      if(coffeeDead == false)
      {
        image(coffeeImg, coffeeX-50, coffeeY-90); 
      }
      
    }
        
  }
  
  void getCoffee()
  {
    if(coffeeDead == true)
    {
      if(coffeeTime > 0)
      {
        fill(0);
        text("Coffee Boost!"+coffeeTime, 450, 50);
        coffeeTime--;
        charSpeed = 20;
      }
      else
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
        
        point = 2;
        
        if(multiTime > 200)
        {
          point = 1;
        }
      }
      
    }
}