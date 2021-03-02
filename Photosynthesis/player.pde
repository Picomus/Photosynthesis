class player
{  
  int availableSmallTrees;
  int availableMidTrees;
  int availableLargeTrees;
  int availableSeeds;
  
  playerboard playerboard = new playerboard();
  //playeractions playeractions = new playeractions();
  
  int state;
  int type; // human = 0, AI = 1;
  
  int action_index = -1; 
  int action_space = -1;
  int action_treesize = -1;
  
  photoSynthesisAI AI;   
  
  player(int type)
  {         
     availableSmallTrees = 4;
     availableMidTrees = 1; 
     availableLargeTrees = 0;
     availableSeeds = 2;
     
     state = PLAYER_DONE;
     this.type = type;
     
     //action that player wants to do
     action_index = -1; 
     action_space = -1;
     action_treesize = -1;
     
     if(type == 1)
     {
        AI = new photoSynthesisAI();       
     }
     
  }   
  
  int update(gameboard gameboard, UI UI)
  {
    int action;
    float treesize = 0;
    int space = 1; //dummy for now
    
    if(type == HUMAN)
    {
      //check for user input
      action = UI.control.getAction();      
    }
    else
    {           
      //get action from AI           
      {         
         AI.update(gamelogic);
         action = AI.getAction();
      }
    }
    return 0;
  }
     
  int availableTrees(int treesize)
  {
     if(treesize == 2)
     {
       return availableSmallTrees;
     }
     else if(treesize == 3)
     {
        return availableMidTrees;
     }
     else if(treesize == 4)
     {
        return availableLargeTrees;
     }
     else
     {
       return -1;
     }
  }
  
  
  void inventoryUpdate()
  {
    
  }
  
  
 
  
}

class playerboard
{    
 int lightpoints;
 
 int smallTreeCost[] = {3,3,2,2}; 
 int midTreeCost[]   = {4,3,3};
 int largeTreeCost[] = {5,4};
 int seedCost[]      = {2,2,1,1};
 
 int smallTrees;
 int midTrees;
 int largeTrees;
 int seeds;
   
 playerboard()
 {    
    lightpoints = 0;
    
    smallTrees = 4;
    midTrees = 3;
    largeTrees = 2;
    
    seeds = 4;
  }
  
  int getTreeCost(int treesize)
  {     
     if(treesize == 2) //small tree
     {
       if(smallTrees > 0)
       {
          return smallTreeCost[smallTrees-1];
       }
       else
       {
         return -1;
       }
     }
     else if(treesize == 3) //small tree
     {
       if(midTrees > 0)
       {
          return midTreeCost[midTrees-1];
       }
       else
       {
          return -1;
       }
     }
     else if(treesize == 4) //small tree
     {
        if(largeTrees > 0)
       {
          return largeTreeCost[largeTrees-1];
       }
       else
       {
          return -1;
       }
     }
     else
     {
       return -2; //treesize doesn't exist
     }
  }
  
  int getSeedCost()
  {     
     if(seeds > 0)
     {
        return seedCost[seeds-1];
     }
     else
     {
        return -1;
     }
  }
  
  int getSeedGrowthCost()
  {
    return 1;
  }
  
  int getTreeGrowthCost(int treesize)
  {     
     return treesize-1;
  }
}
