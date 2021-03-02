
//actions
int BUY_SEED = 0;
int BUY_TREE = 1;
int PLANT_SEED = 2;
int GROW_TREE = 3;

//player type
int HUMAN = 0;
int AI = 1;

//player state
int PLAYER_DONE = 0;
int PLAYER_PHOTOSYNTHESIS = 1;
int PLAYER_ACTION = 2;

//knows and controls the flow of the game
class gamelogic
{
  
  gameboard gameboard;
  ArrayList<player> players;
  
  int sun_pos;
  int first_player;
  int current_player;
  int game_round;
  int no_of_players;
  
  gamelogic()
  {
    gameboard = new gameboard();
     
    no_of_players = 2;    //hardcode 2 players for now
    
    players = new ArrayList<player>();
    for(int i=0;i<no_of_players;i++)
    {
       players.add(new player(AI));
    }
    
    sun_pos = 2; // 150 degrees
    first_player = 0;
    current_player = 0;
    players.get(current_player).state = PLAYER_PHOTOSYNTHESIS;
    game_round = 0; //round 0 is the initial tree placement round
    
  }
  
  public void update()
  {
    
    if(game_round == 0)
    {
       //handle initial tree placement round here
    }
       
    if(game_round > 0)
    {
       if(players.get(current_player).state == PLAYER_PHOTOSYNTHESIS)
       {      
          updateLightpoints();
          players.get(current_player).state = PLAYER_ACTION;
       }
    
       //check if player has chosen a valid action
       if(players.get(current_player).update(gameboard, UI) == 0)
       {
         //resolve action
         if(players.get(current_player).action_index == GROW_TREE)
         {
            grow_tree(players.get(current_player).action_space, players.get(current_player));
         }
       }
       
       
    
       if(players.get(current_player).state == PLAYER_DONE)
       {
          //move sun
          sun_pos -= 1; //clockwise
          if (sun_pos < 0)
          {
             sun_pos += 6;
          }    
       
          //update shadows
          updateShadows();
       
          //next player
          current_player++;
          if(current_player >= no_of_players)
          {
             current_player = 0;
             if(first_player == current_player)
             {
                first_player++;
                if(first_player >= no_of_players)
                {
                   first_player = 0;
                }
             }
          }
          players.get(current_player).state = PLAYER_PHOTOSYNTHESIS;
       
          game_round++;
          if(game_round == 19)
          {
             //set game to finished state
          }
       }
    }
  }
      
  void updateLightpoints()
  {
     for(int i = 0;i<gameboard.boardspaces.size();i++)
     {
        if(gameboard.boardspaces.get(i).tree > 1)
        {
          //println("tree of size " + gameboard.boardspaces.get(i).tree + " at " + (i+1));
          if(gameboard.boardspaces.get(i).in_shadow == 0)
          {
             int player_id = gameboard.boardspaces.get(i).player_id;
             players.get(player_id).playerboard.lightpoints += (gameboard.boardspaces.get(i).tree-1);              
          }
        }
     }               
  }
  
  void updateShadows()
  {
    
     //reset all shadows
     for(int i = 0;i<gameboard.boardspaces.size();i++)
     {
       gameboard.boardspaces.get(i).in_shadow = 0;
     }
    
     //for each board space
     //   if tree on space
     //      trace a path from the tree in opposite direction of the sun
     //         for each space in the path, mark it as being in shadow unless it contains a larger tree than the tree casting the shadow
     //
     //a shadow paths length is determined by the size of the tree casting the shadow, but can't extend further than the edges of the board
     //small tree = 1, medium = 2, large = 3
     
     //determine shadow direction
     int shadow_direction = sun_pos+3;
     if(shadow_direction > 5)
     {
       shadow_direction -= 6;
     }
         
     //loop through each space
     for(int i = 0;i<gameboard.boardspaces.size();i++)
     {
        //does this space contain a tree?
        if(gameboard.boardspaces.get(i).tree > 1 )
        {    
           //println("Tree at space " + (i+1) + " casts shadows on these spaces:");
           int ns_id = gameboard.boardspaces.get(i).ns[shadow_direction]-1;  //get id of first neighbour space in shadow direction
           for(int i_path = 0;i_path<(gameboard.boardspaces.get(i).tree-1);i_path++)
           {            
             if(ns_id >= 0)
             {
                int ns_treesize = gameboard.boardspaces.get(ns_id).tree;                                              
                if(ns_treesize <= gameboard.boardspaces.get(i).tree)
                {
                   //this space is in shadow
                   gameboard.boardspaces.get(ns_id).in_shadow = 1;
                   //println(ns_id+1);
                }                
                ns_id = gameboard.boardspaces.get(ns_id).ns[shadow_direction]-1;  //get id of next neighbour space in shadow direction
                
             }
             else
             {
               break; //at edge of board
             }
           }
        }
     }
     
  }
  
  //function that determines which spaces can be seeded in
  void availableSeedSpaces()
  {
    
  }
  
 
  
  void buy_seed(player player)
  {
     
  }
  
  void buy_tree(float treesize, player player)
  {
    
  }
  
  void plant_seed(int space, player player)
  {
   
  }
  
  int grow_tree(int space, player player)
  {
    
     int return_value = -1;
               
     //check if there's a seed or a tree to grow
     int treesize = gameboard.boardspaces.get(space).tree; 
     if(treesize > 0)
     {
        //check if that tree belongs to the player making this action
        if(gameboard.boardspaces.get(space).player_id == current_player)
        {
         
           //does player have a tree avaiable of the requested size?
           if(player.availableTrees(treesize) > 0)
           {                  
              int cost = player.playerboard.getTreeGrowthCost(treesize);
          
              //does player have enough light points?
              if(player.playerboard.lightpoints >= cost)
              {
                 //this action is possible, now update game accordingly
                 if(treesize < 4)
                 {
                    return_value = 0;            
                 }
                 else
                 {
                    return_value = 0;               
                 }
              }
           }
        }
     }           
     return return_value;
  }
  
   void printLightPoints()
  {
     for(int p = 0;p<players.size();p++)
     {      
        println("Player " + (p+1) + " has " + players.get(p).playerboard.lightpoints);
     }
  }
  
  void printSpacesWithShadow()
  {
    for(int i = 0;i<gameboard.boardspaces.size();i++)
     {
       if(gameboard.boardspaces.get(i).in_shadow == 1)
       {
         println("Space " + (i+1) + " has shadow");
       }
     }
  }
  
  
  
}
