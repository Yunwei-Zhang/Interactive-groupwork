Table air;
Table sun;
int index;

void setup(){
  size(1000,800);
  air = loadTable("air.csv", "csv");
  sun = loadTable("sun.csv", "csv");
}

void draw(){
  background(255,255,255);
  back();
  fill(0);
  float scaledMouseX = map(mouseX, 0, width - 1, 0, 570); 
  index = int(scaledMouseX);
  String date = air.getString(index, 0); 
  int value = air.getInt(index, 1); 
  String sunValue = sun.getString(index,1);
  println("num: " + index  +  ".    date: "  + date  + ".   value: " + value + ".   sun: " + sunValue);

  textSize(20); 
  text("num: " + index  +  ".    date: "  + date  + ".   value: " + value + ".   sun: " + sunValue,20, height/3);
  
  int wen;
  wen = int(value);
  
  if(wen >26 ){
  dog("n");
  }else{
  dog("h");
  }

}

void back()//BEI JING
{ 
  pushMatrix();
  fill(#50FF5D);
  noStroke();
  rect(0,height/2+100,width,height);
  popMatrix();
}

PImage img;
void dog(String s)
{
  if (s=="n" || s=="N")
  {
  pushMatrix();
  stroke(#2E4DE3);
  strokeWeight(3);
  line(125,height/2+150,117,height/2+145);
  line(117,height/2+145,125,height/2+140);
  line(125,height/2+140,120,height/2+135);
  line(120,height/2+135,124,height/2+130);
  line(124,height/2+130,118,height/2+127);
  line(118,height/2+127,126,height/2+123);
  
  line(104,height/2+44,96,height/2+47);
  line(96,height/2+47,103,height/2+50);
  line(103,height/2+50,98,height/2+55);
  line(98,height/2+55,103,height/2+60);
  
  line(163,height/2+46,165,height/2+40);
  line(165,height/2+40,168,height/2+48);
  line(168,height/2+48,172,height/2+38);
  line(172,height/2+38,175,height/2+48);
  line(175,height/2+48,178,height/2+42);
  line(178,height/2+42,183,height/2+47);
  
  line(231,height/2+42,238,height/2+46);
  line(238,height/2+46,232,height/2+50);
  line(232,height/2+50,235,height/2+54);
  line(235,height/2+54,232,height/2+57);
  
  line(240,height/2+100,246,height/2+103);
  line(246,height/2+103,240,height/2+106);
  line(240,height/2+106,243,height/2+113);
  line(243,height/2+113,238,height/2+118);
  line(238,height/2+118,244,height/2+123);
  line(244,height/2+123,238,height/2+125);
  fill(#F0CD88);
  img=loadImage("dog normal.png");
  image(img, 100, height/2,150,200);
  
  stroke(0);
  strokeWeight(2);
  fill(255,255,255);
  ellipse(230,height/2-22,150,60);
  ellipse(180,height/2+20,30,14);
  popMatrix();
  
  fill(#1F30DE);
  textSize(20);
  text("It's Too Cold!",170,height/2-15);
  }
  
  if (s=="h" || s=="H")
  {
  pushMatrix();
  fill(#30FAF5);
  strokeWeight(1);
  stroke(#02DBD6);
  ellipse(132,height/2+135,50,16);
  img=loadImage("dog hot.png");
  image(img, 100, height/2,150,200);
  stroke(#FA5B5B);
  strokeWeight(4);
  line(140, height/2+119,140, height/2+125);
  
  noStroke();
  triangle(175, height/2+70,172,height/2+83,178,height/2+83);
  circle(175,height/2+85,8);
  triangle(195, height/2+60,192,height/2+73,198,height/2+73);
  circle(195,height/2+75,8);
  
  stroke(0);
  strokeWeight(2);
  fill(255,255,255);
  ellipse(230,height/2-22,150,60);
  ellipse(180,height/2+20,30,14);
  popMatrix();
  
  fill(#FA5B5B);
  textSize(20);
  text("It's Too Hot!",170,height/2-15);
  }
}
