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
public class Entidad {
  //Atributos  
  protected PVector posicion;
  protected float fuerza;
  protected float vida;  
  protected int ancho;
  protected int altura;
  protected int tipo;
  protected int ajusteImagenX;
  protected int ajusteImagenY;
  protected int totalFrames;
  protected int tiempoDanioBase;
  protected int tiempoDanio;

  protected color _color;
  protected PImage imagen;
  protected ArrayList<PImage> imagenes;
  
  protected boolean chocarIzquierda;
  protected boolean chocarDerecha;
  protected boolean chocarArriba;
  protected boolean chocarAbajo;
  protected boolean recibeDanio;


  /**Construtor por defecto*/
  public Entidad() {
    this.ancho=20;
    this.altura=20;
    this.posicion=new PVector((int)250-this.ancho/2, (int)250-this.altura/2);
    this._color=color(250, 0, 0);
    this.fuerza=5;
    this.tipo=1;
    this.totalFrames=0;
    this.tiempoDanioBase=10;
    this.tiempoDanio=this.tiempoDanioBase;
    this.recibeDanio=false;
  }

  /**Construtor parametrizado*/
  public Entidad(PImage imagen) {
    this.ancho = 20;
    this.altura = 20;    
    this.posicion=new PVector((int)250-this.ancho/2, (int)250-this.altura/2);
    this._color=color(250, 0, 0);
    this.imagen=imagen;
    this.fuerza=5;
    this.tipo=1;
    this.totalFrames=0;
    this.tiempoDanioBase=10;
    this.tiempoDanio=this.tiempoDanioBase;
    this.recibeDanio=false;
  }

  //---------ZONA METODOS------//
  public void display(){
      if (this.imagen != null) {
      noStroke();
      fill(255, 255, 255, 0);
      rect(this.posicion.x, this.posicion.y, this.ancho, this.altura);
      if (this.recibeDanio == true) {
        tint(255, 255-this.tiempoDanio*20, 255-this.tiempoDanio*20);
        if (frameCount % 5 == 0) {
          this.tiempoDanio -= 1;
          if (this.tiempoDanio <= 0) {
            this.recibeDanio = false;
            this.tiempoDanio = this.tiempoDanioBase;
          }
        }
      } else {
        noTint();
      }
      image(this.imagen, this.posicion.x+this.ajusteImagenX, this.posicion.y+this.ajusteImagenY);
    } else {
      noStroke();
      fill(this._color);
      rect(this.posicion.x, this.posicion.y, this.ancho, this.altura);
    }
  }
  public void paraDiseniar() {
    if (this.imagen != null) {
      noStroke();
      fill(255, 255, 255, 0);
      rect(this.posicion.x, this.posicion.y, this.ancho, this.altura);
      if (this.recibeDanio == true) {
        tint(255, 255-this.tiempoDanio*20, 255-this.tiempoDanio*20);
        if (frameCount % 5 == 0) {
          this.tiempoDanio -= 1;
          if (this.tiempoDanio <= 0) {
            this.recibeDanio = false;
            this.tiempoDanio = this.tiempoDanioBase;
          }
        }
      } else {
        noTint();
      }
      image(this.imagen, this.posicion.x+this.ajusteImagenX, this.posicion.y+this.ajusteImagenY);
    } else {
      noStroke();
      fill(this._color);
      rect(this.posicion.x, this.posicion.y, this.ancho, this.altura);
    }
  }

  public void esEmpujado(Entidad otro, float fuerza) {
    String lado;
    lado = chocarLado(this, otro);
    if (lado == "DERECHA") {
      this.posicion.x -= fuerza;
    } else if (lado == "IZQUIERDA") {
      this.posicion.x += fuerza;
    } else if (lado == "ABAJO") {
      this.posicion.y -= fuerza;
    } else if (lado == "ARRIBA") {
      this.posicion.y += fuerza;
    }
  }

  //----------- METODOS ACCESORES------//
  public PVector getPos() {
    return this.posicion;
  }
  public int getAncho() {
    return this.ancho;
  }
  public int getAltura() {
    return this.altura;
  }
  public float getFuerza() {
    return this.fuerza;
  }
}
