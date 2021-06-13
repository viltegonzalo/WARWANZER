import processing.video.*;
VideoPlay intro;
Enemy[] enemy;
Player jugador;
boolean[] keys;
PImage fondoNivel1;


void setup() {
  size(1200, 900);
  fondoNivel1=loadImage("/map/fondo3.jpg");
  intro=new VideoPlay(new Movie(this, "/movie/video.mov"), width, height);

  jugador=new Player();
  keys=new boolean[128];



  int separacionXI=250;
  int separacionYI=150;
  enemy=new Enemy[16];
  for (int b=0; b<enemy.length; b++) {
    Enemy A=new Enemy();
    A.setPosI(new PVector(separacionXI, separacionYI));
    enemy[b]=A;  
    separacionYI+=50;
    separacionXI+=150;
  }
}

void draw() {

  if (intro.isFinishMovie()) {
    background(fondoNivel1);
    move();  
    jugador.drawPlayer();


    for (int i=0; i<enemy.length; i++) {
      Enemy generar= enemy[i];
      generar.move();
      generar.drawRobot();
    }
  } else {

    intro.moviePlay();
  }
}
public void movieEvent(Movie movie) {
  movie.read();
}
void move() {
  int xDelta=0;
  int yDelta=0;
  if (keys['w'])yDelta--;
  if (keys['s'])yDelta++;
  if (keys['a'])xDelta--;
  if (keys['d'])xDelta++;

  jugador.updatePlayer(xDelta, yDelta);
}
void keyPressed() {
  if (!(keyCode==UP||keyCode==DOWN||
    keyCode==LEFT||keyCode==RIGHT))
    keys[key]=true;
}
void keyReleased() {
  if (!(keyCode==UP||keyCode==DOWN||
    keyCode==LEFT||keyCode==RIGHT))
    keys[key]=false;
}
