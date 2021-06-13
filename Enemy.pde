class Enemy {


  final int nspX=4;
  final int nspY=4;
  final int totalS=nspX*nspY;
  int current_sprite=0;
  int speedX=3;
  int speedY;
  int posX=0;
  int posY=200;
  PImage [] my_s;
  protected boolean incioPartida=true; 

  PVector posI;

  public Enemy() {
    my_s=new PImage[totalS];
    PImage my_s_s=loadImage("/sprite/enemigo30.png");
    int my_s_w=my_s_s.width/ nspX;
    int my_s_h=my_s_s.height/ nspY;
    int index=0;
    for (int y=0; y< nspY; y++) {
      for (int x=0; x< nspX; x++) {
        my_s[index]=my_s_s.get(x*my_s_w, y*my_s_h, my_s_w, my_s_h);
        index++;
        posI= new PVector(random(0, width), random(0, height));
      }
    }
  }

  public void  setupSprite() {

    frameRate(2);
  }




  void move() {
    current_sprite++;
    current_sprite %=totalS;
    posX=(posX<width) ? posX+=speedX:0;
    //posY=(posY<height) ? posY+=speedY:0;
  }


  void drawRobot() {

    pushMatrix();
    translate(posX, posY, 100);
    my_s[current_sprite].resize(50, 50);
    image(my_s[current_sprite], posI.x, posI.y);
    popMatrix();

    //posX++;
  }



  void   updateRobot(int Delta, int Deltayd) {
  }

  public void setPos(int posX, int posY) {
    this.posX=posX;
    this.posY=posY;
  }

  public void setPosI(PVector posI) {
    this.posI=posI;
  }

  public PVector getPosI() {
    return this.posI;
  }
}
