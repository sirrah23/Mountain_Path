/*
* This class is a data strucutre
* which is basically a two-dimensional
* array containing height data across
* an input map file.
*/
class MapData{
  int rows;
  int cols;
  int min_height = -1;
  int max_height = -1;
  int[][] height_data;
  String filename;
  
  MapData(String filename, int rows, int cols){
        this.filename = filename;
        this.rows = rows;
        this.cols = cols;
  }
  
  int get_height_at_point(int x, int y){
     if(x >= 0 && x < this.rows && y >= 0 && y < this.cols-1){
        return this.height_data[x][y];
     }
     return -1;
  }
  
  /*
  * Find the lowest and highest
  * points on the map. Will be
  * used for scaling later.
  */
  void compute_min_max(){
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    if(this.height_data == null){
      return;
    }
    for(int i = 0; i < this.rows; i++){
      for(int j = 0; j < this.cols; j++){
        if(this.height_data[i][j] < min){
          min = this.height_data[i][j];
        }
        if(this.height_data[i][j] > max){
          max = this.height_data[i][j]; 
        }
      }
    }
    this.min_height = min;
    this.max_height = max;
    return;
  }
  
  /*
  * Read in a map file and populate
  * the 2d integer array with height
  * values. Assumes that the file does
  * not have problems and that the data
  * corresponds to the number of rows and
  * columns used to initialize the class.
  */
  void initialize_data(){
    int[][] data = new int[this.rows][this.cols];
    String[] file_content = loadStrings(this.filename);
    for(int i = 0; i < file_content.length; i++){
       int curr_col = 0;
       String[] line_content = split(file_content[i], ' ');
       for(int j = 0; j < line_content.length; j++){
         if(line_content[j].length() > 0){
           data[i][curr_col] = Integer.parseInt(line_content[j]);
           curr_col++;
         }
       }
    }
    this.height_data = data;
    return;
  }
  
  /*
  * Scales all heights on the map
  * to be between 0 and 255. Useful
  * if you want to display a black-and-
  * white version of the map somewhere.
  */
  float[][] grayscale(){
    float[][] scaled_map = new float[this.rows][this.cols];
    for(int i = 0; i < this.rows; i++){
      for(int j = 0; j < this.cols; j++){
        scaled_map[i][j] = map(float(this.height_data[i][j]), this.min_height, this.max_height, 0, 255);
      }
    }
    return scaled_map;
  }
}