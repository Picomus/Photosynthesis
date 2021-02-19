
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
  playeractions playeractions;
  
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
    
       //activate current player
       players.get(current_player).update(gameboard);
    
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
  int act(int action, float var1, gameboard gameboard)
  {
     int action_taken = 0;
     if(action == BUY_SEED)
     {
       action_taken = 1;
     }     
     else if(action == BUY_TREE)
     {
       action_taken = 1;
     }     
     else if(action == PLANT_SEED)
     {
       action_taken = 1;
     }     
     else if(action == GROW_TREE)
     {
       action_taken = 1;
     }     
     return action_taken;
  }
  
  
  
  
}
