
gamelogic gamelogic;
UI UI;
int test_done = 0;

void setup()
{
  gamelogic = new gamelogic();
  UI = new UI();
}

void draw()
{
  //gamelogic.update();  
  testGame();   
}



void testGame()
{  
  
  if(test_done == 0)
  {
     //set sun position
     gamelogic.sun_pos = 2;
    
     //place some trees
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

  
