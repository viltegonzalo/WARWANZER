abstract class Robot {

  public PImage robot;
  public int xDelta=0;
  public int yDelta=0;
  public float x;
  public float y;
  public PImage spriteSheet;  
  public PImage [][]movement;
  public boolean inMotion;
  public int currentDireccion;
  public float currentFrame;
  public PVector posI;
  public final int UP=0;
  public final int LEFT=1;
  public final int DOWN=2;
  public final int RIGHT=3;

  public float vel;
  
  public abstract void setupSprite(); 
  public abstract void move();
  public abstract void drawRobot() ;
  public abstract void updateRobot(int xDelta, int yDelta);
}
