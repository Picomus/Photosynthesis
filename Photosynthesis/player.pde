class player
{  
  int availableSmallTrees;
  int availableMidTrees;
  int availableLargeTrees;
  playerboard playerboard;
  
  player()
  {
     availableSmallTrees = 4;
     availableMidTrees = 1;            
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
