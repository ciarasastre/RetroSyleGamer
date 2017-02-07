class DoorData
{
  int doorSizeW;
  int doorSizeH;
  
  int doorX1A;
  int doorX1B;
  int doorY1;
  
  int doorY2A;
  int doorY2B;
  int doorX2;
  
  DoorData()
  {
    doorSizeW = 50;
    doorSizeH = 160;
    
    doorX1A = 0;
    doorX1B = 850;
    doorY1 = 320;
    
    doorY2A = 0;
    doorY2B = 750;
    doorX2 = 370;
    
  }
  
  void doorPosL()
  {
    fill(0);
    rect(doorX1A, doorY1, doorSizeW, doorSizeH);
    
  }
  
  void doorPosR()
  {
    fill(0);
    rect(doorX1B, doorY1, doorSizeW, doorSizeH); 
  }
  
  void doorPosT()
  {
    fill(0);
    rect(doorX2, doorY2A+80, doorSizeH, doorSizeW);
    
  }
  
  void doorPosB()
  {
    fill(0);
    rect(doorX2, doorY2B, doorSizeH, doorSizeW);
  }
  
  //This section triggers the next map if the character comes into contact
  void doorPosRTrigger()
  {
    if(charX >= 850 && charY >= 200 && charY <= 460) //This gives you lee way for our body to go in
    {
      if(map == 1)
      {
        map = 2;
      }
      else
      {
        map = 3;
      }
      
      //Reposition Character
      charX =100;
    }
  }
  
  void doorPosLTrigger()
  {
    if(charX <= 0 && charY >= 200 && charY <= 460)
    {
      if(map == 3)
      {
        map = 2;
      }
      else
      {
        map = 1;
      }
      
      //Reposition Character
      charX = 700;
    }
  }
  
  void doorPosTTrigger()
  {
    if(charY <= 80 && charX >= 300 && charX <= 540)
    {
      switch(map)
      {
        case(7):
        {
          map = 6;
          break;
        }
        
        case(6):
        {
          map = 1;
          break;
        }
        
        case(5):
        {
          map = 4;
          break;
        }
        
        case(4):
        {
          map = 3;
          break;
        }
        
      }//end switch
      
      //Reposition Character
      charY = 600;
    }
  }
  
  void doorPosBTrigger()
  {
    if(charY >= 800 && charX >= 300 && charX <= 540)
    {
      //Because there are more than 2 options we need a switchstate
      switch(map)
      {
        case(1):
        {
          map = 6;
          break;
        }
        
        case(3):
        {
          map = 4;
          break;
        }
        
        case(4):
        {
          map = 5;
          break;
        }
        
        case(6):
        {
          map = 7;
          break;
        }
      }
      
      
      //Reposition Character
      charY = 100;
    }
  }

}