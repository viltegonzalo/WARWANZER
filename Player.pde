class Player {
  private float x;
  private float y;
  private PImage spriteSheet;  
  private PImage [][]movement;
  private boolean inMotion;
  private int currentDireccion;
  private float currentFrame;

  final int UP=0;
  final int LEFT=1;
  final int DOWN=2;
  final int RIGHT=3;


  public Player() {
    inMotion=false;
    currentDireccion=1;
    currentFrame=5;
    this.x=300;
    this.y=300;
    setupSprite();
  }
  void setupSprite() {
    movement=new PImage[4][9];
    spriteSheet=loadImage("/sprite/mecha22.png");
    for (int i=0; i<9; i++) {
      movement[0][i]=spriteSheet.get(16+64*i-5, 8, 50, 60);
      movement[1][i]=spriteSheet.get(16+64*i-5, 72, 50, 60);
      movement[2][i]=spriteSheet.get(16+64*i-10, 136, 50, 60);
      movement[3][i]=spriteSheet.get(16+64*i-10, 200, 50, 60);
    }
  }
  void drawPlayer() {
    if (inMotion)
      image(movement[currentDireccion][1+int(currentFrame)], x, y);
    else
      image(movement[currentDireccion][0], x, y);
  }


  void updatePlayer(int xDelta, int yDelta) {
    currentFrame=(currentFrame+0.5)%8;
    inMotion=true;
    if (xDelta==0&&yDelta==0)
      inMotion=false;
    else if (xDelta==-1) currentDireccion=LEFT;
    else if (xDelta==1) currentDireccion=RIGHT;
    else if (yDelta==-1) currentDireccion=UP;
    else if (yDelta==1) currentDireccion=DOWN;

    x=x+xDelta;
    y=y+yDelta;
  }
}
