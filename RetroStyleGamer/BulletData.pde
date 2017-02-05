class BulletData
{
  float bullX;
  float bullY;
  int bullSize;
  
  BulletData(float giveX, float giveY)
  {
    bullY = giveY;
    bullX  = giveX;
    bullSize = 10;
  }
  
  void display()
  {
      fill(0,0,255);
      ellipse(bullX+50, bullY+50, bullSize, bullSize);
  }
    
  
  void shootLeft()
  {

      bullY+=15;
  }

  
}