import geomerative.*;
import processing.pdf.*;
int ranY, ranX;
int height=720;
int width=504;
int xStep =35;


float xoff=0.01;


void setup()
{
  size(width, height);
  beginRecord(PDF, "summertime-woo.pdf"); 
  RG.init(this);


  colorMode(HSB, 360, 100, 100);
  background(201, 59, 97);
  noStroke(); 

  pushMatrix();
  translate(-9, 50);

  fill(201, 69, 80);
  RShape pool_b0ttom_1 = new RShape();
  pool_b0ttom_1.addLineTo(500, 0);
  pool_b0ttom_1.addLineTo(500, 120);
  pool_b0ttom_1.addLineTo(50, 120);
  pool_b0ttom_1.addLineTo(50, 0);
  pool_b0ttom_1.draw();

  fill(201, 86, 70);
  RShape pool_b0ttom = new RShape();
  pool_b0ttom.addLineTo(85, 0);
  pool_b0ttom.addLineTo(110, 120);
  pool_b0ttom.addLineTo(60, 595);
  pool_b0ttom.addLineTo(8, 595);


  pool_b0ttom.draw();

  popMatrix();

  smooth();
  noFill();
  strokeWeight(4);

  /* --- 
   Draw Lineballs 
   first create an array that can hold 80 Line objects
   */



  pushMatrix();


  while (ranY<height)
  {
    translate(0, 40);
    beginShape();

    //    for (int i = 0; i <= width; i += xStep)
    //    {
    //      stroke(192, 79, 70+i);
    //      float ranY = random(5);
    //      vertex(i, ranY);
    //    }
    ranY=ranY+10;

    endShape();
  }
  popMatrix();

  /* --------
   pushMatrix();
   
   while (ranX<width) {
   
   translate(35, 0);
   strokeWeight(2);
   stroke(230, 0, (ranX*0.5)+73);
   beginShape();
   for (int i = 0; i < height; i += xStep)
   {
   float ranX = random(6);
   vertex(ranX-0.1*i, i);
   }
   
   ranX=ranX+10; //gradient color 
   endShape();
   }
   popMatrix();
   
   */

  colorMode(RGB, 255, 255, 255);
  noStroke();
  int alpha = 0;
  int alphaDirection = 1;
  float rad = 0;


  for (int x = 0; x < width; x+=random(10,15)) {
    for (int y = 0; y < height; y+=1) {

      if (alpha < 20) alphaDirection = 1;
      if (alpha > 100) alphaDirection = -1;
      alpha = alpha + 1*alphaDirection;

      fill(255, random(alpha-20, alpha));

      float dotSize = random(2, 3);

      ellipse(x+sin(rad)*2.5+(height-y)-80,
              y, 
              dotSize, dotSize);
              

      if (rad > 240) rad = 0;
      else rad += random(0.5);
    }
  }



  /*  tiles ---*/


  for (int x = 0; x < width; x+=random(5,8)) {
    for (int y = 0; y < height; y+=5) {

      fill(255, 255, 255, random(35));

      ellipse(x, y, random(4, 5), random(1, y*0.008));
    }
  }


  colorMode(HSB, 360, 100, 100);  

  /*------------------------------------------------
   
   
   
   Lines = new Line[60];
   
   for (int i = 0; i <60; i++)
   { 
   float z = noise(xoff)*width;
   xoff = xoff+20;
   Lines[i] = new Line(z, random(0, height), 60);
   }
   
   for (int i = 0; i < Lines.length; i++) {
   pushMatrix();
   translate(0, -200);
   Lines[i].display();
   popMatrix();
   }
   
   random water pattern  */

  /*------------------------------------------------
   
   random POOL  */


  pushMatrix();
  //fill(142,70,89);
  fill(111.5, 50, 90);
  RShape fakeBackground = RShape.createRectangle(0, 0, width, height);
  // RShape testSquare = RShape.addLineTo(300, 400);

  RShape water_pool = new RShape();
  water_pool.addLineTo(450, 0);
  water_pool.addLineTo(406, 575);
  water_pool.addLineTo(8, 575);
  water_pool.addLineTo(52, 0);

  water_pool.translate(25, 60);
  RShape pool = fakeBackground.diff(water_pool);

  noStroke();
  //color it
  pool.draw();
  popMatrix();

  /*------------------------------------------------
   
   baord  */

  /*hole and Ball*/
  
  //hole
  fill(217, 63, 27);
  ellipse(168, 217, 80, 30);
  
  //ball
  fill(0, 54, 98);
  ellipse(385, 635, 66, 66);
  
  stroke(0,0,100);
  strokeWeight(5);
  line(150,60,140,225);
  
  int L;
  for (L=80; L<=200; L+=35){
  line(152-0.03*L,L, 204-0.032*L,L);
  }
  
  line(205,60, 195,225);
  endRecord();
}

