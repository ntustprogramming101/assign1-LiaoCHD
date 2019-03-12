PImage bg,soil,life,groundHog,soldier,robot;
float soldierX=0;
float soldierY;
float robotY;
float robotX;
float laserX;
float laserY;
float laserLenthen=0;
float laserMove=0;


void setup() {
	size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundHog = loadImage("img/groundhog.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");
  noStroke();
  
  soldierY = (int)random(2,6); //set soldier's Yposition as 160 or 240 or 320 or 400 
   if (soldierY==6) soldierY = 5; //or it will be out of screen
   
  robotY = (int)random(2,6); //so is the robot 
   if (robotY==6) robotY = 5; //or it will be out of screen
  robotX =  (int)random(2,8);
  if (robotX==8) robotX = 7; //or it will be out of screen
  
  laserX = robotX;
  laserY = robotY;
}

void draw() {
	 background(bg);

   image(life,10, 10); //The first life icon
   image(life,80, 10); //The second one,20 plus the width of the picture = 70
   image(life,150, 10); //third
   
   
   
   
   fill(124,204,25);         //color of grass
   rect(0,145,640,15);       //grass
   
   image(groundHog,280, 80);//put the groundhog in the middle
   
   
   fill(255,255,0);//Here comes the sun
   ellipse(640-50,50,130,130);
   fill(253,184,19);
   ellipse(640-50,50,120,120);
   
   
   image(soil,0, 160);//pit the soil at the bottom 
   
     
   image(soldier,soldierX, soldierY*80); //soldier
   soldierX = soldierX +2; // make him move forward
   if (soldierX>640) soldierX = -80; //once the soldier is out of screen,make him back
   
   
   
   image(robot,robotX*80,robotY*80);//robot
   
   fill(255,0,0);//the color of laser
   ellipse(laserX*80+25+laserMove,laserY*80+37,10,10);//the start point of laser
   rect(laserX*80+25+laserMove,laserY*80+32,laserLenthen,10);//lenthen the laser
   ellipse(laserX*80+25+laserLenthen+laserMove,laserY*80+37,10,10);//the end of the laser
   laserLenthen = laserLenthen -2;
   if (laserLenthen <= -30){
     laserLenthen=-30;//the lenth of laser is 40
     laserMove=laserMove-2;//let the laser start to move
    if(laserMove<=-150){
      laserMove=0;
      laserLenthen=0;
  }
   
   }
   

}
