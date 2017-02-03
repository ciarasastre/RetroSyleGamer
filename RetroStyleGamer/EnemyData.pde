class EnemyData
{
  int enX = 300;
  int enY = 620;
  int enSize = 300;
  
  /*EnemyData()
  {
    enX = 300;
    enY = 620;
    enSize = 300;
  }*/
  
  void enDisplay()
  {
    fill(255);
    rect(enX, enY, enSize, enSize/2); 
  }
  
  void enMove()
  {
    enX++;
  }
}