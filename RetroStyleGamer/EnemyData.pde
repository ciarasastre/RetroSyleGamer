class EnemyData
{
  PImage[] bossLeft = new PImage[3];
  
  int enX;
  int enY;
  int enSize;
  int enSpeed;
  
  int bossTime;
  int bossIndex;

  EnemyData()
  {
    enX = -300;
    enY = 620;
    enSize = 300;
    enSpeed = 4;
    
    bossTime = 0;
    bossIndex = 0;
  }
  
  void enDisplay()
  {
    
    for(int i = 0; i<bossLeft.length; i++)
    {
      bossLeft[i] = loadImage("boss"+i+".png");
    }
    
    if(bossIndex == bossLeft.length-1)
      {
        bossTime+=1;
        
        if(bossTime == 10)
        {
          bossIndex = 0;
          bossTime = 0;
        }
      }
      else
      {
        bossTime+=1;
        
        if(bossTime == 10)
        {
          bossIndex++;
          bossTime = 0;
        }
      }
      image(bossLeft[bossIndex],enX,enY);
  }
  
  void enMove()
  {
    
    enX+= enSpeed;
    
    if(enX >= 900)
    {
      enX = -300;
    }
  }
}