MapData md; 
MapDisplay ms;
Explorer ex;
int rows = 844, cols = 480;
String input_file = "../InputFiles/Colorado_844x480.dat";

void setup(){
  size(1000, 1000);
  md = new MapData(input_file, rows, cols);
  md.initialize_data();
  md.compute_min_max();
  float[][] gs = md.grayscale();
  ex = new Explorer(md, rows, cols);
  ArrayList<PVector> path = ex.explore();
  ms = new MapDisplay(gs, rows, cols);
  ms.path = path;
  for(PVector p : path){
  }
  background(255);
}

void draw(){
  ms.show();
}