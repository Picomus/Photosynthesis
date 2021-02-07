
int BUY_SEED = 0;
int BUY_TREE = 1;
int PLANT_SEED = 2;
int GROW_TREE = 3;

//knows and controls the flow of the game
class gamelogic
{
  
  board board;
  ArrayList<player> players;
  playeractions playeractions;
  
  gamelogic()
  {
    board = new board();
    //hardcode 2 players for now
    
    players = new ArrayList<player>();
    for(int i=0;i<2;i++)
    {
       players.add(new player());
    }
  }
  
  public void update()
  {
          
  }
      
  void updateLightpoints()
  {
    
  }
  
  void updateShadows()
  {
    
  }
  
  
}

/*
1) Knows what actions can be taken
2) Checks whether a requested action is allowed according to the current state of the game
3) Adjusts game state according to action
*/
class playeractions
{
  
  playeractions()
  {
    
  }
  
  //0 - buy seed
  //1 - buy tree
  //2 - plant seed
  //3 - grow tree    
  void act(int action, float var1, board board, player player)
  {
     if(action == BUY_SEED)
     {
     }
     
     else if(action == BUY_TREE)
     {
     }
     
     else if(action == PLANT_SEED)
     {
     }
     
     else if(action == GROW_TREE)
     {
     }
  }
  
  
  
  
}
