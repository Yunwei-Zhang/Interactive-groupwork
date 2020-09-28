Table air;
Table sun;
Table windGust;
int index;
int d = 30;
int radius = 5;
int mr = 60;
int l = 20;
float grassTall = 1;
ArrayList<grass> grassList = new ArrayList<grass>();
int dia=0;
int backcolour;
float degree=0;
float place=-100,place2=-100,place3=-100;
int speed=0;

void setup() {
  size(1000, 800);
  //reading the file
  air = loadTable("air.csv", "csv");
  sun = loadTable("sun.csv", "csv");
  windGust = loadTable("windGust.csv","csv");
  smooth();

  int grassCount = 30;
  for (int i=0; i<grassCount; i++) {
    grassList.add( new grass(random(width), float(height), int(random(3, 10)), 1.0) );
  }
}


void draw() {

  background(#23A2F5);

  //reading the temp and the sunRadiation   value is temp,   sunValue is sun radiation.
  float scaledMouseX = map(mouseX, 0, width - 1, 0, 2012);
  index = int(scaledMouseX);// index this the row of the file
  String date = air.getString(index, 0); 
  int value = air.getInt(index, 1); 
  String sunValue = sun.getString(index, 1);
  int windG = windGust.getInt(index,1);

//setting sky color
 skyColor(sunValue);

  //for user to read 
 guide(date, value, sunValue,windG);

  //setting the sun width
  float scaledMouseX2 =  map(int(sunValue), 0, width - 1, 30, 300); 
  int sunWidth;
  sunWidth = int(scaledMouseX2);
  d= sunWidth;

  //setting the dog status 
  int wen;
  wen = int(value);
  if (wen >26 )
  {
    noStroke();
    fill(#30FAF5);
    ellipse(132, height/2+135, 50, dia);
    if (dia<17)
    {
      dia++;
    }
    dog("h");
  } else
  {
    dog("n");
    dia=0;
  }

  //setting the thermometer 
  int the1 = int(map(value, 23.6, 32, 540, 340));
  if (int(sunValue)>0)
  {
    pushMatrix();
    translate(450, 150);
    rotate(radians(degree));
    sun();
    degree++;
    popMatrix();
  }

  //setting the star at night
  if (int(sunValue)<=0)
  {
    noStroke();
    fill(#F2FC63);
    circle(800, 120, 200);
    fill(35, 50, 245);
    circle(750, 110, 150);
    fill(234, 250, random(20, 180));
    star(400, 200, 7, 15, 5);
    star(500, 240, 4, 8, 5);
    star(500, 100, 3, 7, 5);
    star(240, 100, 7, 15, 5);
    star(580, 50, 9, 20, 5);
  }
  fill(255);
  thermometer(the1);
  
  // wind speed
  speed=windG+3;
  movingCloud(windG);

  for (grass b : grassList) {
    // update each grass from a stable wind
    b.update(-50, height/4, 1.5, 1.5);
    b.draw();
  }

  //for test
  println("num: " + index  +  ".    date: "  + date  + ".   value: " + value + ".   sun: " + sunValue  +  "   X + y " +  mouseX + " " + mouseY);
}

void skyColor(String sunValue){
 if (int(sunValue)>0)
    fill(35, 162, 245);
  else 
  fill(35, 50, 245);
  rect(0, 0, width, height/2+135);
  back();
  fill(0);
}

void guide(String date,int value,String sunValue,int windG){
  textSize(20); 
  text("date: "  + date  + ".   Temp: " + value + ".   sun radiation: " + sunValue  + ".   Peak wind Gust: " + windG    , 20, height*5/6);
  text("Move your mouse from left to right to show the data of different date", 20, height*5.3/6);
}

void back()//BEI JING
{ 
  pushMatrix();
  fill(#50FF5D);
  noStroke();
  rect(0, height/2+100, width, height);
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
    line(125, height/2+150, 117, height/2+145);
    line(117, height/2+145, 125, height/2+140);
    line(125, height/2+140, 120, height/2+135);
    line(120, height/2+135, 124, height/2+130);
    line(124, height/2+130, 118, height/2+127);
    line(118, height/2+127, 126, height/2+123);

    line(104, height/2+44, 96, height/2+47);
    line(96, height/2+47, 103, height/2+50);
    line(103, height/2+50, 98, height/2+55);
    line(98, height/2+55, 103, height/2+60);

    line(163, height/2+46, 165, height/2+40);
    line(165, height/2+40, 168, height/2+48);
    line(168, height/2+48, 172, height/2+38);
    line(172, height/2+38, 175, height/2+48);
    line(175, height/2+48, 178, height/2+42);
    line(178, height/2+42, 183, height/2+47);

    line(231, height/2+42, 238, height/2+46);
    line(238, height/2+46, 232, height/2+50);
    line(232, height/2+50, 235, height/2+54);
    line(235, height/2+54, 232, height/2+57);

    line(240, height/2+100, 246, height/2+103);
    line(246, height/2+103, 240, height/2+106);
    line(240, height/2+106, 243, height/2+113);
    line(243, height/2+113, 238, height/2+118);
    line(238, height/2+118, 244, height/2+123);
    line(244, height/2+123, 238, height/2+125);
    fill(#F0CD88);
    img=loadImage("dog normal.png");
    //reference: https://pngtree.com/free-png
    image(img, 100, height/2, 150, 200);

    stroke(0);
    strokeWeight(2);
    fill(255, 255, 255);
    ellipse(230, height/2-22, 150, 60);
    ellipse(180, height/2+20, 30, 14);
    popMatrix();

    fill(#1F30DE);
    textSize(20);
    text("It's Too Cold!", 170, height/2-15);
  }

  if (s=="h" || s=="H")
  {
    pushMatrix();
    fill(#30FAF5);
    strokeWeight(1);
    stroke(#02DBD6);
    img=loadImage("dog hot.png");
    //reference: https://pngtree.com/free-png
    image(img, 100, height/2, 150, 200);
    stroke(#FA5B5B);
    strokeWeight(4);
    line(140, height/2+119, 140, height/2+125);

    noStroke();
    triangle(175, height/2+70, 172, height/2+83, 178, height/2+83);
    circle(175, height/2+85, 8);
    triangle(195, height/2+60, 192, height/2+73, 198, height/2+73);
    circle(195, height/2+75, 8);

    stroke(0);
    strokeWeight(2);
    fill(255, 255, 255);
    ellipse(230, height/2-22, 150, 60);
    ellipse(180, height/2+20, 30, 14);
    popMatrix();

    fill(#FA5B5B);
    textSize(20);
    text("It's Too Hot!", 170, height/2-15);
  }
}



void sun() {

  // sun
  //fill(210,193,105);
  //ellipse(400,150,100,100);
  noFill();
  strokeWeight(2);
  for (int i =0; i<100; i++)
  {
    stroke(222, 228 - (228-186)/100.0 * i, 178 - (178-80) / 100.0 *i);
    ellipse(0, 0, i, i);
  }
  fill(0);
  ellipse(-15, -10, 10, 10);
  ellipse(15, -10, 10, 10);
  noFill();
  beginShape();
  vertex(-15, 10);
  bezierVertex(-15, 10, 0, 40, 15, 10);
  endShape();
  fill(215, 113, 38);
  for (int i = 0; i<8; i++) {
    int r = mr + d;
    float x = sin(360.0 /8 * i * 3.14 / 180) * r;
    float y = cos(360.0 /8 * i * 3.14 / 180) * r;
    float x1 = sqrt(mr * mr + l * l /4) * sin(360.0 /8 * i * 3.14 / 180 - atan(l * 1.0 /2 /mr));
    float y1 = sqrt(mr * mr + l * l /4) * cos(360.0 /8 * i * 3.14 / 180 - atan(l * 1.0/2 /mr));
    float x2 = sqrt(mr * mr + l * l /4) * sin(360.0 /8 * i * 3.14 / 180 + atan(l * 1.0/2 /mr));
    float y2 = sqrt(mr * mr + l * l /4) * cos(360.0 /8 * i * 3.14 / 180 + atan(l * 1.0/2 /mr));
    //ellipse(x,y,radius,radius);
    triangle(x, y, x1, y1, x2, y2);
  }
}
void cloud()
{
  fill(255);
  beginShape();
  vertex(50, 180);
  bezierVertex(50, 150, 80, 120, 132, 150);
  bezierVertex(150, 115, 210, 135, 200, 160);
  bezierVertex(270, 175, 230, 235, 170, 220);
  bezierVertex(170, 250, 80, 255, 70, 220);
  bezierVertex(20, 240, 25, 170, 50, 180);
  endShape();
}

void movingCloud(int wind){

  pushMatrix();
  strokeWeight(2);
  translate(place-200,-30);
  place=place+speed;
  if(place>=1200)
  {
  place=0;
  }
  cloud();
  popMatrix();
  
  pushMatrix();
  strokeWeight(2);
  translate(place2-400,-100);
  place2=place2+speed+1;
  if(place2>=1400)
  place2=0;
  cloud();
  popMatrix();
  
  pushMatrix();
  strokeWeight(2);
  translate(place3-700,30);
  place3=place3+speed-1;
  if(place3>=1700)
  place3=0;
  cloud();
  popMatrix();

}

//reference from https://processing.org/examples/star.html, modify by our needed
void star(float q, float w, float r1, float r2, int nposition)
{
  float possition = PI*2 / nposition;
  float half = possition/2.0;

  beginShape();
  for (float a = 0; a < TWO_PI; a += possition) {
    float sq = q + cos(a) * r2;
    float sw = w + sin(a) * r2;
    vertex(sq, sw);
    sq = q + cos(a+half) * r1;
    sw = w + sin(a+half) * r1;
    vertex(sq, sw);
  }
  endShape(CLOSE);
}

void thermometer(int the1)
{
  stroke(3, 0, 0);
  beginShape();
  vertex(785, 600);
  vertex(785, 250);
  vertex(815, 250);
  vertex(815, 600);
  endShape();
  fill(255, 0, 0);
  ellipse(800, 600, 50, 50);

  beginShape();
  fill(255, 0, 0);
  stroke(255, 0, 0);
  vertex(787, the1);
  vertex(814, the1);
  vertex(814, 587);
  vertex(787, 587);
  endShape();

  fill(0);
  textSize(15);
  stroke(0);
  strokeWeight(3);
  int hei=565;
  line(825, 543, 825, 345);
  for (int n=23; n<=32; n++)
  {
    hei=hei-200/9;
    line(825, hei, 835, hei);
    text(n, 845, hei+5);
  }
}



/** grass class code reference pastebin.com/7YVSNczK modify base on our needed */

class grass {// make a Class of grass so that it is much more easyier to modify each instances grass
  float piontx;
  float pointy;
  float buchang;
  color green;
  float curved;
  ArrayList<PVector> slides;

  grass(float setpiontx, float setpointy, int setslides, float prebuchang) {// a construsctor of grass, setting attribute for each grass while it is creating.
    piontx = setpiontx;
    pointy = setpointy;
    slides = new ArrayList<PVector>();

    //build each grass
    for (int x = 0; x < setslides; x++) {
      slides.add(new PVector(piontx, pointy+10*x));
    }
    buchang = random(100)/100 + prebuchang; // make every grass is different
    green = color((int)random(0, 50), (int)random(100, 255), (int)random(0, 100));//make color of every grass is different
    curved = random(1, 2); //make grass has different curved rate.

    //setting the grass posisition
    slides.get(0).x = piontx;
    slides.get(0).y = pointy;
  }

  void update(float windDx, float windDy, float forcex, float forcey) { //make grass look like blow by wind
    //making every grass different
    float wind = (noise(frameCount/99.5+buchang)-0.45);

    //put setting to every grass
    for (int x = 1; x < slides.size (); x++) {
      PVector slide = slides.get(x);
      slide.y -= (((slides.size ()-x)*1)/grassTall)*curved;
      slide.x += x*wind*(4/grassTall);

      //put setting to every grass
      float wind2 = dist(windDx, windDy, slide.x, slide.y);
      if (wind2 < 100) {
        slide.x += forcex*(20/wind2*(4/grassTall));
        slide.y += forcey*(20/wind2*(4/grassTall));
      }
    }

    //setting every grass curved
    for (int x = 0; x < slides.size ()-1; x++) {
      float connectionx = slides.get(x).x - slides.get(x+1).x;
      float connectiony = slides.get(x).y - slides.get(x+1).y;
      float connectionlength = sqrt(connectionx*connectionx + connectiony*connectiony);
      if (connectionlength > 5*(4/grassTall)) {
        float cache = 1.0/connectionlength;
        connectionx *= cache;
        connectiony *= cache;
        connectionx *= -5*(4/grassTall);
        connectiony *= -5*(4/grassTall);
        slides.get(x+1).x = slides.get(x).x + connectionx;
        slides.get(x+1).y = slides.get(x).y + connectiony;
      }
    }
  }

  void draw() {//drawing the static grass 
    fill(green);
    stroke(green);
    int h = slides.size()-2;
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < slides.size ()-1; x++) {
      float slidesx = slides.get(x).x;
      float slidesy = slides.get(x).y;
      vertex(slidesx+1*(h-x), slidesy);
      vertex(slidesx-1*(h-x), slidesy);
    }
    endShape();
  }
}
