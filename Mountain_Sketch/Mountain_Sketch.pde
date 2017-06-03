MapData md; 
MapDisplay ms;
Explorer ex;
int rows = 480, cols = 480;
String input_file = "../InputFiles/Colorado_480x480.dat";

void setup(){
  md = new MapData(input_file, rows, cols);
  md.initialize_data();
  md.compute_min_max();
  float[][] gs = md.grayscale();
  ex = new Explorer(md, rows, cols);
  ArrayList<Point> path = ex.explore();
  ms = new MapDisplay(gs, rows, cols, 960, 960);
  ms.path = path;
  size(960, 960);
  background(255);
}

void draw(){
  ms.show();
}