
gamelogic gamelogic;
int test_done = 0;

void setup()
{
  gamelogic = new gamelogic();
}

void draw()
{
  //gamelogic.update();  
  testShadows();   
}



void testShadows()
{  
  
  if(test_done == 0)
  {
     gamelogic.sun_pos = 2;
    
     gamelogic.gameboard.boardspaces.get(19-1).tree = 4;
     gamelogic.gameboard.boardspaces.get(19-1).player_id = 0;
     gamelogic.gameboard.boardspaces.get(26-1).tree = 3;
     gamelogic.gameboard.boardspaces.get(26-1).player_id = 1;
     gamelogic.gameboard.boardspaces.get(1-1).tree = 2;
     gamelogic.gameboard.boardspaces.get(1-1).player_id = 0;
  
     //update shadows  
     gamelogic.updateShadows();
     
     gamelogic.updateLightpoints();
  
     gamelogic.printSpacesWithShadow();
  
     gamelogic.printLightPoints();
     
     test_done = 1;
  }
}

  
