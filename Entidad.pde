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
//private float x, y, forcaEmpurrao, vidas;
protected PVector posicion;
protected float fuerza;
protected float vida;

//private int largura, altura, tipo, ajusteImagemX, ajusteImagemY, totalFrames, tempoDanoBase, tempoDano;
protected int ancho;
protected int altura;
protected int tipo;
protected int ajusteImagenX;
protected int ajusteImagenY;
protected int totalFrames;
 protected  int tiempoDanioBase;
 protected  int tiempoDanio;

protected color _color;
protected PImage imagen;
//IMAGEN JUGADOR
protected PImage p1_1Imagem, p1_2Imagem,p1_3Imagem,p1_4Imagem,p1_5Imagem,p1_6Imagem,p1_7Imagem,p1_8Imagem,p1_9Imagem;
protected PImage p1_10Imagem,p1_11Imagem, p1_12Imagem,p1_13Imagem,p1_14Imagem,p1_15Imagem,p1_16Imagem,p1_17Imagem,p1_18Imagem;
protected PImage p1_19Imagem, p1_20Imagem,p1_21Imagem,p1_22Imagem,p1_23Imagem,p1_24Imagem,p1_25Imagem,p1_26Imagem, p1_27Imagem;
protected PImage p1_28Imagem, p1_29Imagem,p1_30Imagem,p1_31Imagem,p1_32Imagem,p1_33Imagem,p1_34Imagem,p1_35Imagem, p1_36Imagem;
//ENEMIGO
protected PImage enemigo1_1Imagem, enemigo1_2Imagem;
protected PImage enemigo2_1Imagem, enemigo2_2Imagem;
protected PImage enemigo3_1Imagem, enemigo3_2Imagem;
protected PImage enemigo4_1Imagem, enemigo4_2Imagem, enemigo4_3Imagem;
//CODIGO DE ALEX Y SANTI



//private boolean collideEsquerda, collideDireita, collideCima, collideBaixo, levandoDano;
protected boolean chocarIzquierda;
protected boolean chocarDerecha;
protected boolean chocarArriba;
protected boolean chocarAbajo;
protected boolean recibeDanio;


/**Construtor por defecto*/
public Entidad() {
this.ancho=20;
this.altura=20;
this.posicion=new PVector((int)250-this.ancho/2,(int)250-this.altura/2);
this._color=color(250,0,0);
this.fuerza=5;
this.tipo=1;
this.totalFrames=0;
this.tiempoDanioBase=10;
this.tiempoDanio=this.tiempoDanioBase;
this.recibeDanio=false;


p1_1Imagem = loadImage("images/jugador/1.png");
p1_2Imagem = loadImage("images/jugador/2.png");
p1_3Imagem = loadImage("images/jugador/3.png");
p1_4Imagem = loadImage("images/jugador/4.png");
p1_5Imagem = loadImage("images/jugador/5.png");
p1_6Imagem = loadImage("images/jugador/6.png");
p1_7Imagem = loadImage("images/jugador/7.png");
p1_8Imagem = loadImage("images/jugador/8.png");
p1_9Imagem = loadImage("images/jugador/9.png");
 
p1_10Imagem = loadImage("images/jugador/10.png");
p1_11Imagem = loadImage("images/jugador/11.png");
p1_12Imagem = loadImage("images/jugador/12.png");
p1_13Imagem = loadImage("images/jugador/13.png");
p1_14Imagem = loadImage("images/jugador/14.png");
p1_15Imagem = loadImage("images/jugador/15.png");
p1_16Imagem = loadImage("images/jugador/16.png");
p1_17Imagem = loadImage("images/jugador/17.png");
p1_18Imagem = loadImage("images/jugador/18.png");

p1_19Imagem = loadImage("images/jugador/19.png");
p1_20Imagem = loadImage("images/jugador/20.png");
p1_21Imagem = loadImage("images/jugador/21.png");
p1_22Imagem = loadImage("images/jugador/22.png");
p1_23Imagem = loadImage("images/jugador/23.png");
p1_24Imagem = loadImage("images/jugador/24.png");
p1_25Imagem = loadImage("images/jugador/25.png");
p1_26Imagem = loadImage("images/jugador/26.png");
p1_27Imagem = loadImage("images/jugador/27.png");
 
p1_28Imagem = loadImage("images/jugador/28.png");
p1_29Imagem = loadImage("images/jugador/29.png");
p1_30Imagem = loadImage("images/jugador/30.png");
p1_31Imagem = loadImage("images/jugador/31.png");
p1_32Imagem = loadImage("images/jugador/32.png");
p1_33Imagem = loadImage("images/jugador/33.png");
p1_34Imagem = loadImage("images/jugador/34.png");
p1_35Imagem = loadImage("images/jugador/35.png");
p1_36Imagem = loadImage("images/jugador/36.png");

enemigo1_1Imagem = loadImage("images/enemigo/robotEne1_1.png");
enemigo1_2Imagem = loadImage("images/enemigo/robotEne1_2.png");
enemigo2_1Imagem = loadImage("images/enemigo/robotEne1_1.png");
enemigo2_2Imagem = loadImage("images/enemigo/robotEne1_2.png");
enemigo3_1Imagem = loadImage("images/enemigo/robotEne1_1.png");
enemigo3_2Imagem = loadImage("images/enemigo/robotEne1_2.png");
enemigo4_1Imagem = loadImage("images/enemigo/robotEne1_1.png");
enemigo4_2Imagem = loadImage("images/enemigo/robotEne1_2.png");
enemigo4_3Imagem = loadImage("images/enemigo/robotEne1_2.png");

bala1Imagem = loadImage("images/item/bala1Base.png");
//caixa1BaseImagem = loadImage("images/item/caixa1Base_100.png");

moeda1_1Imagem = loadImage("images/item/moeda1_1Base.png");
moeda1_2Imagem = loadImage("images/item/moeda1_2Base.png");
moeda1_3Imagem = loadImage("images/item/moeda1_3Base.png");
vida1Imagem = loadImage("images/item/vida1Base.png");
//BORRAR
}

/**Construtor parametrizado*/
public Entidad(PImage imagen) {
this.ancho = 20;
this.altura = 20;    
this.posicion=new PVector((int)250-this.ancho/2,(int)250-this.altura/2);
this._color=color(250,0,0);
this.imagen=imagen;
this.fuerza=5;
this.tipo=1;
this.totalFrames=0;
this.tiempoDanioBase=10;
this.tiempoDanio=this.tiempoDanioBase;
this.recibeDanio=false;
}

 //---------ZONA METODOS------//
 public void paraDiseniar() {
if (this.imagen != null) {
noStroke();
fill(255,255,255,0);
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
public PVector getPos(){
return this.posicion;
}
public int getAncho(){
return this.ancho;
}
public int getAltura(){
return this.altura;
}
public float getFuerza(){
return this.fuerza;
}
}
