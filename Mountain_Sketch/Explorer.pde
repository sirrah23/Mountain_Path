/*
* Given an input map the explorer
* will find a path from West to
* East - maintaining that the best
* path it follows 
*/

class Explorer{
  
  MapData md;
  int map_height, map_width;
  PVector pos = null;
  
  Explorer(MapData md, int map_height, int map_width){
    this.md = md;
    this.map_height = map_height;
    this.map_width = map_width;
  }
  
  ArrayList<PVector> explore(){
    ArrayList path = new ArrayList<PVector>();
    if(this.pos == null){
      set_random_start(); 
    }
    PVector next_point;
    while((next_point=move()) != null){
       this.pos = next_point;
       path.add(next_point); 
    }
    return path;
  }
  
  void set_start(int x, int y){
    this.pos =  new PVector(x, y);
  }
  
  private void set_random_start(){
    this.pos = new PVector(0, int(random(this.map_width)));
  }
  
  PVector move(){
    int curr_neighbor_height, diff;
    int[] neighbors = {-1, 0, 1}; // Up + Right, Right, Down + Right
    PVector next_pos = null;
    int curr_height = this.md.get_height_at_point(int(this.pos.x), int(this.pos.y));
    int height_diff = Integer.MAX_VALUE;
    for(int neighbor : neighbors){
      curr_neighbor_height = this.md.get_height_at_point(int(this.pos.x+1), int(this.pos.y + neighbor));
      if(curr_neighbor_height == -1){ continue; }
      diff = int(Math.abs(curr_height - curr_neighbor_height));
      if( diff < height_diff){
        height_diff = diff;
        next_pos = new PVector(int(this.pos.x+1), int(this.pos.y+neighbor));
      }
    }
    return next_pos;
  }
}