class EnemyData
{
  PImage[] bossLeft = new PImage[3];
  
  int enX = -300;
  int enY = 620;
  int enSize = 300;
  int enSpeed = 4;
  
  int bossTime = 0;
  int bossIndex = 0;

  /*EnemyData()
  {
    enX = 300;
    enY = 620;
    enSize = 300;
  }*/
  
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
    
    
    //fill(255);
    //rect(enX, enY, enSize, enSize/2); 
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