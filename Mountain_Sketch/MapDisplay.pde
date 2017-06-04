/*
* A class which should be used to 
* display a map based on a 2d array
* containing colors. The map is assumed
* to be black and white. 
*/
class MapDisplay{
  
  float[][] color_grid;
  int rows, cols;
  ArrayList<Point> path = null;
 
  MapDisplay(float[][] color_grid, int rows, int cols){
    this.rows = rows;
    this.cols = cols;
    this.color_grid = color_grid;
    return;
  }
  
  MapDisplay(int rows, int cols){
    this.rows = rows;
    this.cols = cols;
    this.color_grid = new float[rows][cols];
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < cols; j++){
        color_grid[i][j] = 0.0;  
      }
    }
    return;
  }
  
  void draw_map(){
    pushMatrix();
    int rect_width = width / this.cols;
    int rect_height = height / this.rows;
    for(int i = 0; i < this.rows; i++){
      for(int j = 0; j < this.cols; j++){
        noStroke();
        fill(this.color_grid[i][j]);
        rect(i*rect_height, j*rect_width, rect_height, rect_width);  
      }
    }
    popMatrix();
  }
  
  void draw_path(){
   if(this.path == null){return;}
   pushMatrix();
   int rect_width = width / this.cols;
   int rect_height = height / this.rows;
   for(Point pt : this.path){
      fill(0, 255, 0); //green
      rect(pt.x*rect_height, pt.y*rect_width, rect_height, rect_width);
   }
   popMatrix();
  }
  
  void show(){
    this.draw_map();
    this.draw_path();
  }
}