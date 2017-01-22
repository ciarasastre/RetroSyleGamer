class DoorData
{
  int doorSizeW1;
  int doorSizeH1;
  int doorX1;
  int doorY1;
  
  DoorData()
  {
    doorSizeW1 = 50;
    doorSizeH1 = 160;
    doorX1 = 0;
    doorY1 = 320;
  }
  
  void doorPosL()
  {
    fill(0);
    rect(doorX1, doorY1, doorSizeW1, doorSizeH1);
    
  }
  
  void doorPosR()
  {
    
  }
  

}