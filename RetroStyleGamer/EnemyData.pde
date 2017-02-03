class EnemyData
{
  int enX;
  int enY;
  int enSize;
  
  EnemyData()
  {
    enX = 300;
    enY = 620;
    enSize = 300;
  }
  
  void enDisplay()
  {
    fill(255);
    rect(enX, enY, enSize, enSize/2); 
  }
  
  void enMove()
  {
    if(enX == 300)
    {
      enX++;
    }
    

    
  }
}