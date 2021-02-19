


class gameboard
{
   ArrayList<boardSpace> boardspaces;
   
   gameboard()
   {
     
     boardspaces = new ArrayList<boardSpace>();
     
     //setup spaces on board
     boardspaces.add(new boardSpace(5,0,0,0,2,6));      // 1
     boardspaces.add(new boardSpace(6,1,0,0,3,7));      // 2
     boardspaces.add(new boardSpace(7,2,0,0,4,8));      // 3
     boardspaces.add(new boardSpace(8,3,0,0,0,9));      // 4     
     boardspaces.add(new boardSpace(10,0,0,1,6,11));    // 5
     boardspaces.add(new boardSpace(11,5,1,2,7,12));    // 6
     boardspaces.add(new boardSpace(12,6,2,3,8,13));    // 7
     boardspaces.add(new boardSpace(13,7,3,4,9,14));    // 8
     boardspaces.add(new boardSpace(14,8,4,0,0,15));    // 9
     boardspaces.add(new boardSpace(16,0,0,5,11,17));   //10
     boardspaces.add(new boardSpace(17,10,5,6,12,18));  //11
     boardspaces.add(new boardSpace(18,11,6,7,13,19));  //12
     boardspaces.add(new boardSpace(19,12,7,8,14,20));  //13
     boardspaces.add(new boardSpace(20,13,8,9,15,21));  //14
     boardspaces.add(new boardSpace(21,14,9,0,0,22));   //15
     boardspaces.add(new boardSpace(0,0,0,10,17,23));   //16
     boardspaces.add(new boardSpace(23,16,10,11,18,24));//17
     boardspaces.add(new boardSpace(24,17,11,12,19,25));//18
     boardspaces.add(new boardSpace(25,18,12,13,20,26));//19
     boardspaces.add(new boardSpace(26,19,13,24,21,27));//20
     boardspaces.add(new boardSpace(27,20,14,15,22,28));//21
     boardspaces.add(new boardSpace(23,21,15,0,0,0));   //22
     boardspaces.add(new boardSpace(0,0,16,17,24,29));  //23
     boardspaces.add(new boardSpace(29,23,17,18,25,30));//24
     boardspaces.add(new boardSpace(30,24,18,19,26,31));//25
     boardspaces.add(new boardSpace(31,25,19,20,27,32));//26
     boardspaces.add(new boardSpace(32,26,20,21,28,33));//27
     boardspaces.add(new boardSpace(33,27,21,22,0,0));  //28
     boardspaces.add(new boardSpace(0,0,23,24,30,34));  //29
     boardspaces.add(new boardSpace(34,29,24,25,31,35));//30
     boardspaces.add(new boardSpace(35,30,25,26,32,36));//31
     boardspaces.add(new boardSpace(36,31,26,27,33,37));//32
     boardspaces.add(new boardSpace(37,32,27,28,0,0));  //33
     boardspaces.add(new boardSpace(0,0,29,30,35,0));   //34
     boardspaces.add(new boardSpace(0,34,30,31,36,0));  //35
     boardspaces.add(new boardSpace(0,35,31,32,27,0));  //36
     boardspaces.add(new boardSpace(0,36,32,33,0,0));   //37
   }
}

class boardSpace
{   
  int[] ns = new int[6];
  
  int distance_center;//spaces from center (for easier shadow calc)
  int tree;      //nothing/seed/tree size
  int player_id; //id of the player that placed something in this space
  int in_shadow; //0.0 = tree is not in shadow, 1.0 = tree is in shadow
  
  public boardSpace(int ns30, int ns90,int ns150, int ns210, int ns270, int ns330)
  {    
    ns[0] = ns30;    
    ns[1] = ns90;
    ns[2] = ns150;
    ns[3] = ns210;
    ns[4] = ns270;
    ns[5] = ns330;
  }
}

class tree
{
  int size;
  
  tree(int size)
  {
    this.size = size;          
  }
}
    
