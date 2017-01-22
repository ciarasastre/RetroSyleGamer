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
    rect(doorX2, doorY2A, doorSizeH, doorSizeW);
    
  }
  
  void doorPosB()
  {
    fill(0);
    rect(doorX2, doorY2B, doorSizeH, doorSizeW);
  }
  
  //This section triggers the next map if the character comes into contact
  
  void doorPosRTrigger()
  {
    if(charX <= doorX1B+50 && charX >= doorX1B-50 && charY <= doorY1+80 && charY >= doorY1-80)
    {
      map = 2;
      charX =450;
      charY = 400;
    }
  }
  
  void doorPosLTrigger()
  {
    if(charX <= doorX1A+50 && charX >= doorX1A-50 && charY <= doorY1+80 && charY >= doorY1-80)
    {
      map = 2;
      charX = 450;
      charY = 400;
    }
  }
  
  void doorPosTTrigger()
  {
    //doorX2 = 370, doorY2A = 0,
    if(charX <= doorX2+130 && charX >= doorX2+30 && charY <= doorY2A+80 && charY >= doorY2A)
    {
      map = 2;
      charX = 450;
      charY = 400;
    }
  }
  
  void doorPosBTrigger()
  {
    //doorX2, doorY2B
    if(charX <= doorX2+130 && charX >= doorX2+30 && charY <= doorY2B+80 && charY >= doorY2B)
    {
      map = 2;
      charX =450;
      charY = 400;
    }
  }

}