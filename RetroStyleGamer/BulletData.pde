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
  
  void display()
  {
      fill(0,0,255);
      ellipse(bullX, bullY, bullSize, bullSize);
  }
    
  
  void shootLeft()
  {
    if(key == 'a')
    {
      bullX--;
    }
  }
  
}