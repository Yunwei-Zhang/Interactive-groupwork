Table air;
Table sun;
int index;

void setup(){
  size(1000,800);
  air = loadTable("air.csv", "csv");
  sun = loadTable("sun.csv", "csv");
}

void draw(){

  float scaledMouseX = map(mouseX, 0, width - 1, 0, 570); 
  index = int(scaledMouseX);
  String date = air.getString(index, 0); 
  int value = air.getInt(index, 1); 
  String sunValue = sun.getString(index,1);
  println("num: " + index  +  ".    date: "  + date  + ".   value: " + value + ".   sun: " + sunValue);

  background(0);
  textSize(20); 
  text("num: " + index  +  ".    date: "  + date  + ".   value: " + value + ".   sun: " + sunValue,20, height/3);

}
