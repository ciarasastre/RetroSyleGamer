class BulletData
{
  int bullX;
  int bullY;
  int bullSize;
  
  BulletData()
  {
    bullY = charY;
    bullX  = charX;
    bullSize = 10;
    
    
  }
  
  void pewPew()
  {
    if(key == ' ')
    {
      fill(0,0,255);
      ellipse(bullX, bullY, bullSize, bullSize);
      
      bullX--;
      
      if(bullX == bullX-10)
      {
        bullY = charY;
        bullX  = charX;
    
      }
    }
    
  }
  
  void pewPewLeft()
  {
    //bullX--;
  }
}