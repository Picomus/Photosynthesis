class player
{  
  int availableSmallTrees;
  int availableMidTrees;
  int availableLargeTrees;
  playerboard playerboard;
  playeractions playeractions;
  
  int state;
  int type; // human = 0, AI = 1;
  
  player(int type)
  {
     availableSmallTrees = 4;
     availableMidTrees = 1;      
     state = PLAYER_DONE;
     this.type = type;
  }   
  
  void update(gameboard gameboard)
  {
    int action = 0;
    float treesize = 0;
    if(type == HUMAN)
    {
      //check for user input
    }
    else
    {
      //let AI make choices     
      if(playeractions.act(action, treesize, gameboard)==0)
      {
         //player done if no action was taken
         state = PLAYER_DONE;
      }
    }
  }
}

class playerboard
{    
 int lightpoints;
 
 int smallTreeCost[] = {3,3,2,2}; 
 int midTreeCost[] = {4,3,3};
 int largeTreeCost[] = {5,4};
 int smallTrees;
 int midTrees;
 int largeTrees;
   
  playerboard()
  {
    
    lightpoints = 0;
    
    smallTrees = 4;
    midTrees = 3;
    largeTrees = 2;    
  }
}
