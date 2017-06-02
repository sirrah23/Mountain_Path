/*
* A class which should be used to 
* display a map based on a 2d array
* containing colors. The map is assumed
* to be black and white. 
*/

class MapDisplay{
  
  float[][] color_grid;
  int rows, cols, canvas_width, canvas_height;
 
  MapDisplay(float[][] color_grid, int rows, int cols, int canvas_width, int canvas_height){
    this.rows = rows;
    this.cols = cols;
    this.canvas_width = canvas_width;
    this.canvas_height = canvas_height;
    this.color_grid = color_grid;
    return;
  }
  
  MapDisplay(int rows, int cols, int canvas_width, int canvas_height){
    this.rows = rows;
    this.cols = cols;
    this.canvas_width = canvas_width;
    this.canvas_height = canvas_height;
    this.color_grid = new float[rows][cols];
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < cols; j++){
        color_grid[i][j] = 0.0;  
      }
    }
    return;
  }
  
  void show(){
    int rect_width = this.canvas_width / this.cols;
    int rect_height = this.canvas_height / this.rows;
    for(int i = 0; i < this.rows; i++){
      for(int j = 0; j < this.cols; j++){
        noStroke();
        fill(this.color_grid[i][j]);
        rect(i*rect_height, j*rect_width, rect_height, rect_width);  
      }
    }
  }
}