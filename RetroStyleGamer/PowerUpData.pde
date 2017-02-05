class PowerUpData
{
  int pX;
  int pY;
  int pSize = 20;
  
  void coffeeDisplay()
  {
    pX = 450;
    pY = 560;
    
    fill(0);
    ellipse(pX,pY,pSize,pSize);
  }
}