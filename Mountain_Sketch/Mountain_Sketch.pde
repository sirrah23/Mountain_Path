MapData md; 
MapDisplay ms;
Explorer ex;
int rows = 480, cols = 480;
String input_file = "../InputFiles/Colorado_480x480.dat";

void setup(){
  size(480, 480);
  md = new MapData(input_file, rows, cols);
  md.initialize_data();
  md.compute_min_max();
  float[][] gs = md.grayscale();
  ex = new Explorer(md, rows, cols);
  ArrayList<PVector> path = ex.explore();
  ms = new MapDisplay(gs, rows, cols);
  ms.path = path;
  background(255);
}

void draw(){
  ms.show();
}