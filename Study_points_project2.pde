float posX = 100; // x location of square
float posY = height/2;   // y location of square
float jump = -5; //ball jumping
float Xspeed = 0; // speed of square x axis
float ySpeed = 0; // speed of square over y axis
float gravity = 0.3;  //new variable for gravity
float velocity = 0;
PImage img;
PImage armImgBot;
PImage armImgTop;
PImage backImage;
int[] enemiesX = new int[2];
int[] enemiesY = new int[2];
int x = -200, y;
int score = 0;
int highScore =0;
//Enemy[] enemies = new Enemy[100];
//Obs obsEnemy;

void setup () {
  size(1500, 700);
  //Obstacle = new Obs();
  /* for (int i = 0; i < enemies.length; i++) {
   enemies[i] = new Enemy(color(i*2), 0, i*2, i/20.0);
   } */
}
void draw () {


  startGame();
  player();
  playerJump();
  walls();
  gameOver();
  //add soeed to location, add gravity to speed
  // x = x + x;
  //posX = posX + Xspeed;
  //posY = posY + ySpeed;
  //ySpeed = ySpeed + gravity;
  //Xspeed = Xspeed + gravity;
  //Xspeed = Xspeed + jump;




  //game over //bottom screen

  //walls

  /*  obs[i].displayObs();
   obs[i].updateObs();
   } */
  //enemies/obstacles
  /*for (int i = 0; i < enemies.length; i++) {
   enemies[i].moveEnemy();
   enemies[i].display(); */
}



void player () {
  //draw the ball
  fill(255, 200, 10);
  strokeWeight(2);
  /*ellipse(posX, posY, 60, 60);
   fill(255);
   ellipse(posX-7.5, posY-2, 10, 10);
   ellipse(posX+7.5, posY-2, 10, 10);
   line(posX-5, posY+6, posX+5, posY+6); */

  velocity += gravity;
  velocity += 0.5;
  posY += velocity;

  img = loadImage("me2.png");
  image(img, posX, posY, 100, 100);
}


void playerJump() {
  if (keyPressed) {
    if (key == 32) {
      velocity += jump;

      if (posY < 0) { //top screen
        posY = 0;
        velocity = 0;
      }
    }
  }
}
void startGame() {
  //background(100, 200, 255);
  imageMode(CORNER);
  backImage = loadImage("sky.jpg");
  image(backImage, x, 0);
  image(backImage, x+backImage.width, 0);
  x -= 6;
}
void gameOver () {
  //background(0);
  if (posY > height) {
    posY = height;
    velocity = 2;

    fill(0);
    rect(width/2, height/2, width, 200);
    rectMode(CENTER);
    fill(255, 0, 0);

    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(128);
    text("YOU DIED", width/2, height/2);
    textSize(50);
    text("Your parents must be proud.", width/2, height/2+75);
  }
}
void walls () {
  imageMode(CENTER);
  armImgBot = loadImage("wall.png");
  armImgTop = loadImage("topWall.png");
  for (int i = 0; i < 2; i++) {
    image(armImgTop, enemiesX[i], enemiesY[i] - (armImgTop.height/2+150));
    image(armImgBot, enemiesX[i], enemiesY[i] + (armImgBot.height/2+150));
    if (enemiesX[i] < 0 ) {
      enemiesY[i] = (int)random(200, height-200);
      enemiesX[i] = width;
    }
  /*  if(posX == width/2) {
      score++;
      highScore = max(score, highScore);
    } */
    enemiesX[i] -= 20;
  }
  text(""+score, width/2-15, 700);
}
