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



class ObjetoLimitante extends Entidad {

//Atributos
private float vidasMax;

/**Construtor por defecto*/
public ObjetoLimitante() {
this.posicion.x =0;
this.posicion.y = 0;
this.ancho = 20;
this.altura = 20;
this.fuerza = 0;
this.vidasMax = 300;
this.vida = this.vidasMax;
}

/**Construtor parametrizado*/
public ObjetoLimitante(int x, int y) {
this.posicion.x = x;
this.posicion.y = y;
this.ancho = 20;
this.altura = 20;
this.fuerza = 0;
this.vidasMax = 300;
this.vida = this.vidasMax;
}

//Construtor2
public ObjetoLimitante(int x, int y, int w,int h) {
this.posicion.x = x;
this.posicion.y = y;
this.ancho = w;
this.altura = h;
this.fuerza = 0;
this.vidasMax = 300;
this.vida = this.vidasMax;
}



 //---------ZONA METODOS------//
public void cadaCaja() {
String lado;
boolean chocarJugador = false, chocarEnemigo = false;
//float distX, distY;

jugador1.chocarIzquierda = false;
jugador1.chocarDerecha = false;
jugador1.chocarAbajo = false;
jugador1.chocarArriba = false;

for (int i=0; i<limites.size(); i++) {

//Colisao Player
if (chocarJugador == false) {
chocarJugador = chocarRect(jugador1, limites.get(i));
}

if (chocarJugador == true && jugador1.chocarIzquierda == false && jugador1.chocarDerecha == false) {
lado = chocarLado(jugador1, limites.get(i));
if (lado == "IZQUIERDA") {
jugador1.chocarIzquierda = true;
} else if (lado == "DERECHA") {
jugador1.chocarDerecha = true;
}
}
if (chocarJugador == true && jugador1.chocarAbajo == false && jugador1.chocarArriba == false) {
lado = chocarLado(jugador1, limites.get(i));
if (lado == "ABAJO") {
jugador1.chocarAbajo = true;
} else if (lado == "ARRIBA") {
jugador1.chocarArriba = true;
}
}
chocarJugador = false;
//CHOCAR ENEMIGO
for (int ii=0; ii<enemigos.size(); ii++) {
chocarEnemigo = chocarRect(limites.get(i), enemigos.get(ii));
if (chocarEnemigo == true) {
enemigos.get(ii).esEmpujado(limites.get(i), enemigos.get(ii).fuerza*2);
limites.get(i).vida--;
limites.get(i).recibeDanio = true;
}
}
limites.get(i).paraDiseniar();
if (limites.get(i).vida <= 0) {
limites.remove(i);
}
}
//println(p1.collideEsquerda + "E - " + p1.collideDireita + "D - " + p1.collideBaixo + "B - " + p1.collideCima + "C");
}

public void grade() {
//  ////Grade
//  stroke(255, 255, 255, 50);
//  strokeWeight(1);
//  for(int i=0; i<20; i++){
//    line(10+(i*32), 0, 10+(i*32), alturaJogo);
//  }
//  for(int i=0; i<20; i++){
//    line(0, 10+(i*32), larguraJogo, 10+(i*32));
//  }
}
}
