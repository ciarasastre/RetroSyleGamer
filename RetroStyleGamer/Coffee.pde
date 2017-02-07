class Coffee 
{
  PImage coffeeImg;
  int coffeeX;
  int coffeeY;
  int coffeeSize = 20;

  int coffeeTime = 200;
  boolean coffeeDead = false;
  
  void coffeeDisplay()
  {
    coffeeImg = loadImage("coffee0.png");
    coffeeX = 350;
    coffeeY = 250;
    
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
        fill(255);
        textFont(scoreF);
        text("Speed Boost :  "+coffeeTime, 300, 50);
        coffeeTime--;
        charSpeed = 20;
      }
      else
      {
          charSpeed = 5;

      }
      
    }
    
  }
  
  
      
}