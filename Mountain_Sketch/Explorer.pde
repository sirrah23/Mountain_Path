/*
* Given an input map the explorer
* will find a path from West to
* East - maintaining that the best
* path it follows 
*/

class Explorer{
  
  MapData md;
  int map_height, map_width;
  Point pos = null;
  
  Explorer(MapData md, int map_height, int map_width){
    this.md = md;
    this.map_height = map_height;
    this.map_width = map_width;
  }
  
  ArrayList<Point> explore(){
    ArrayList path = new ArrayList<Point>();
    if(this.pos == null){
      set_random_start(); 
    }
    Point next_point;
    while((next_point=move()) != null){
       this.pos = next_point;
       path.add(next_point); 
    }
    return path;
  }
  
  private void set_random_start(){
    this.pos = new Point(0, int(random(this.map_height)));
  }
  
  Point move(){
     int curr_height = this.md.get_height_at_point(this.pos.x, this.pos.y);
     int height_up = this.md.get_height_at_point(this.pos.x+1, this.pos.y-1);
     int height_forward = this.md.get_height_at_point(this.pos.x+1, this.pos.y); 
     int height_down = this.md.get_height_at_point(this.pos.x+1, this.pos.y+1);
     int curr_height_diff = Integer.MAX_VALUE;
     Direction curr_dir = null;  
     Direction[] directions = {Direction.UP, Direction.FORWARD, Direction.DOWN};
     int diff;
     for(Direction d : directions){
       switch(d){
         case UP:
           if (height_up == -1){break;}
           diff = Math.abs(curr_height - height_up);
           if(diff < curr_height_diff){
             curr_height_diff = diff; 
             curr_dir = d;
           }
           break;
         case FORWARD:
           if (height_forward == -1){break;}
            diff = Math.abs(curr_height - height_forward);
            if(diff < curr_height_diff){
              curr_height_diff = diff; 
              curr_dir = d;
            }
            break;
         case DOWN:
            if (height_down == -1){break;}
            diff = Math.abs(curr_height - height_down);
            if(diff < curr_height_diff){
              curr_height_diff = diff; 
              curr_dir = d;
            }
            break;
       }
     }
    if(curr_dir == null){return null;}
    switch(curr_dir){
      case UP:
        return new Point(this.pos.x+1, this.pos.y-1);
      case FORWARD:
        return new Point(this.pos.x+1, this.pos.y);
      case DOWN:
        return new Point(this.pos.x+1, this.pos.y+1);
      default:
        return null;
    }
  }
}