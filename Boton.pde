/*
FUNDAMETO DE PROGRAMACION ORIENTADO OBJETOS
 FACULTAD DE INGENIERIA - TECNICATURA EN DISEÑO DE VIDEO JUEGOS
 PROYECTO: JUEGO WAR-WANZER
 
 - CARDOZO, Karen Yanina
 - VILTE, Gonzalo Fabian
 - SARAVIA, Maximiliano Leonel
 - MELO, Joaquin Alejandro
 - RODRIGUEZ, Santiago Agustin
 - MERCADO,Alejandro Samuel
 */
class Boton {
  private PImage btnDisiable;
  private PImage btnEnable;
  private PVector posicion;
  private PVector tamanio;
  private boolean botonClick;
  private int id;

  public Boton(int id, String pathBtnE, String pathBtnD, int w, int h, int x, int y) {
    this.id=id;
    this.tamanio=new PVector(w, h);
    this.posicion=new PVector(x, y);
    this.btnDisiable=loadImage(pathBtnD);
    this.btnEnable=loadImage(pathBtnE);
    this.btnEnable.resize((int)this.tamanio.x, (int)this.tamanio.y);
    this.btnDisiable.resize((int)this.tamanio.x, (int)this.tamanio.y);

    this.botonClick=false;
  }
  public Boton() {
    posicion = new PVector(0, 0);
    //this.botones=new ArrayList<PImage>();
  }
  /** Dibuja cada botón de acuerdo al estado de la cantidad de botones establecidos*/
  public void display() {
    imageMode(CENTER); 
    textAlign(CENTER, CENTER);
    textSize(18);
    image(this.btnEnable, this.posicion.x, this.posicion.y);
  }
  /** Dibuja la animacion al mover el mouse sobre un boton*/
  public void mousePressed() {
    if (mouseX > (this.posicion.x)&& mouseX < (this.posicion.x+(this.tamanio.x/2)) &&
      mouseY > (this.posicion.y) && mouseY < this.posicion.y+(this.tamanio.y/2) ) {
      image(this.btnDisiable, this.posicion.x, this.posicion.y);
    }
  }

  int  mouseDragged() {    
    if (mouseX > (this.posicion.x-(this.tamanio.x/2))&& mouseX <= (this.posicion.x+(this.tamanio.x/2)) &&
      mouseY > (this.posicion.y-(this.tamanio.y/2)) && mouseY <= this.posicion.y+(this.tamanio.y/2) && mousePressed && mouseButton==LEFT) {
      botonClick=true;
      return this.id;
    } 
    return 0;
  }

  public boolean getClick() {
    return botonClick;
  }
}
