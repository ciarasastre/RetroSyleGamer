class EnemyData 
{
  PImage[] bossLeft = new PImage[3];
  
  int enX = -300;
  int enY = 620;
  int enSize = 300;
  int enSpeed = 4;
  
  int bossTime = 0;
  int bossIndex = 0;
  
  //Health Variables
  int maxHealth = 100;
  float health = 100;
  float healthDecrease = .8;
  int healthBarWidth = 200;

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
  
  void drawHealth()
  {
    noStroke();
  fill(236, 240, 241);
  rectMode(CORNER);
  rect(enX+20, enY - 30, healthBarWidth, 15); //enX - (healthBarWidth/2)
  
  if(health > 60)
  {
    fill(46, 204, 113);
  }
  else if(health > 30)
  {
    fill(230, 126, 34);
  }
  else
  {
    fill(231, 76, 60);
  }
  rectMode(CORNER);
  rect(enX+20, enY - 30, healthBarWidth*(health/maxHealth), 15); //enX - (healthBarWidth/2)
  
  }
  void hit()
  {
    if(key == ' ' && charX > enX && charX < enX+300)
    {
      text("HIT", height/2, width/2);
      
      health -= healthDecrease;
      if(health <= 0 )
      {
        gameScreen = 2;
      }
    }
  }
  
}