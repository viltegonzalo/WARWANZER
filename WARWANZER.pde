/*
FUNDAMETO DE PROGRAMACION ORIENTADO OBJETOS
 FACULTAD DE INGENIERIA - TECNICATURA EN DISEÑO DE VIDEO JUEGOS
 PROYECTO: JUEGO WAR-WANZER
 
 - CARDOZO, Karen Yanina
 - VILTE, Gonzalo Fabian
 - SARAVIA,Maximiliano Leonel
 - MELO, Joaquin Alejandro
 - RODRIGUEZ, Santiago Agustin
 - MERCADO,Alejandro Samuel
 */
import processing.video.*;
VideoPlayer intro;
MusicPlayer ost1;
MusicPlayer ost2;
MusicPlayer ost3;
MusicPlayer ost4;
MusicPlayer ostGameOver;
MusicPlayer sfxGun;
ArrayList<Item> items= new ArrayList();
//F_Mira
PImage mira1Imagen;
boolean construir = false;

//ITEM
PImage vida1Imagem;
PImage bala1Imagem;
PImage moeda1_1Imagem, moeda1_2Imagem, moeda1_3Imagem;
int anchoJuego;
int alturaJuego;
int balasRevolver ;
int balasMetraladora = 0;
Jugador jugador1;
int monedas = 50;

//JUGADOR
PImage p1_1Imagem, p1_2Imagem;

//ENEMIGO
PImage zombie1_1Imagem, zombie1_2Imagem;
PImage zombie2_1Imagem, zombie2_2Imagem;
PImage zombie3_1Imagem, zombie3_2Imagem;
PImage zombie4_1Imagem, zombie4_2Imagem, zombie4_3Imagem;

ArrayList<Enemigo> enemigos = new ArrayList();

//OBJETO LIMITANTE
ArrayList<ObjetoLimitante> limites = new ArrayList();
PImage caixa1_100Imagem, caixa1_75Imagem, caixa1_50Imagem, caixa1_25Imagem, caixa1_10Imagem;
PImage caixa1BaseImagem;

//F_Miras
ArrayList<Proyectil> balas = new ArrayList();
IntList balasPerdidas = new IntList();
int enemigosMuertos=0;
int puntos;
int fase = 1, proximaFase = 8, tazaEnemigo = round(fase/4)+1, tiempoAparicionEnemigo = 10;


//BARRA DE ESTADO
int objetoLimiteRestantes = 0;
int inventario = 1;
PImage revolverImagen;
PImage metralladoraImagen;
PImage btn1Imagem, btn2Imagem, btn3Imagem, btn4Imagem;
boolean debug = false;
boolean gameOver = false;

//PRINCIPAL
int fps = 60;
int numEnemigos =8;
//PImage nivel1;
//PImage nivel2;
boolean pause = false;
int limiteCajas = 150;
Nivel nivel1;
Nivel nivel2;
Nivel nivel3;
Nivel nivel4;

void setup() {
frameRate(fps);
size(1000, 700);
anchoJuego = width;
alturaJuego = height - 50;
preCarga();//F_barraEstado

////VIDEO INTRO
//intro=new VideoPlayer(new Movie(this, "/video/video.mov"), width, height);  
///////
ost1=new MusicPlayer(new Minim(this), "/data/music/nivel"+(int)random(0, 12)+".mp3");
ost2=new MusicPlayer(new Minim(this), "/data/music/nivel"+(int)random(0, 12)+".mp3");
ost3=new MusicPlayer(new Minim(this), "/data/music/nivel"+(int)random(0, 12)+".mp3");
ost4=new MusicPlayer(new Minim(this), "/data/music/nivel"+(int)random(0, 12)+".mp3");
ost1.getMusic().setVolume(0.5);
ost2.getMusic().setVolume(0.5);
ost3.getMusic().setVolume(0.5);
ost4.getMusic().setVolume(0.5);
ostGameOver=new MusicPlayer(new Minim(this), "/data/music/gameover.mp3");
sfxGun=new MusicPlayer(new Minim(this), "/data/music/gun1.mp3");
nivel1=new Nivel(1, "images/niveles/fondo1.jpg", 8, ost1);
nivel2=new Nivel(2, "images/niveles/fondo2.jpg", 8, ost2);
nivel3=new Nivel(3, "images/niveles/fondo3.jpg", 8, ost3);
nivel4=new Nivel(3, "images/niveles/fondo3.jpg", 8, ost4);
//nivel1= loadImage("images/niveles/fondo2.jpg");
//nivel2=loadImage("images/niveles/fondo3.jpg");

/*JUGADOR*/
jugador1 = new Jugador();

/*ENEMIGOS*/
//*Genera enemigos y lo guarda en el ArrayList de Enemigos*/
/*
for (int i=0; i<numEnemigos; i++) {
 enemigos.add(new Enemigo());
 }
 */
/*ECENARIO INICIAL*/
int numCajas = 1;
boolean chocarJugador = false, chocarCaja = false; //*

/*Agregar una caja a la ArrayList*/
limites.add(new ObjetoLimitante(360, 300));

chocarJugador = chocarRect(jugador1, limites.get(0));
}

void draw() {
//if (intro.isFinishMovie()) {
if (true) {
if (pause == false) {
switch(fase) {
case 1: 
nivel1.displayNivel();        
for (int i=0; i<nivel1.getListEne().size(); i++) {
Enemigo generar=  nivel1.getListEne().get(i);
generar.cadaEnemigo(nivel1.getListEne());
}

frames(nivel1.getListEne());
cadaBala(nivel1.getListEne());
break;
case 2:
nivel1.getMusic().stopMusic();
nivel2.displayNivel();
for (int i=0; i<nivel2.getListEne().size(); i++) {     
Enemigo generar=  nivel2.getListEne().get(i);
generar.cadaEnemigo(nivel2.getListEne());
}

frames(nivel2.getListEne());
cadaBala(nivel2.getListEne());
break;
case 3:
nivel2.getMusic().stopMusic();        
nivel3.displayNivel();      
for (int i=0; i<nivel3.getListEne().size(); i++) {
Enemigo generar=  nivel3.getListEne().get(i);
generar.cadaEnemigo(nivel3.getListEne());
}

frames(nivel3.getListEne());
cadaBala(nivel3.getListEne());//F_Mira
break;
case 4:
nivel3.getMusic().stopMusic();        
nivel4.displayNivel();      
for (int i=0; i<nivel4.getListEne().size(); i++) {
Enemigo generar=  nivel4.getListEne().get(i);
generar.cadaEnemigo(nivel4.getListEne());
}

frames(nivel4.getListEne());
cadaBala(nivel4.getListEne());//F_Mira
break;
default: 
fase=1;
break;
}
jugador1.girar();
cadaItem();
//MIRA
mira();
//Barra de Vida del Jugador
barraDeVida(jugador1);
//Barra de Estado
barraDeEstado();

//GAMER OVER
if (jugador1.vida<=0) {
gameOver();
}
} else {
tienda();
}

for (int i=0; i<limites.size(); i++) {
ObjetoLimitante generar= limites .get(i);
generar.cadaCaja();
generar.grade();
}
} //else intro.moviePlay(); ///Reproduce el video INTRO
}

void keyPressed() {
println(keyCode);
if (pause == false) {
boolean presionado = true;
//Eixo X
if (keyCode == 65 || keyCode == 37) {
jugador1.izquierda(presionado);
} else if (keyCode == 68 || keyCode == 39) {
jugador1.derecha(presionado);
}
//Eixo Y
if (keyCode == 87 || keyCode == 38) {
jugador1.arriba(presionado);
} else if (keyCode == 83 || keyCode == 40) {
jugador1.abajo(presionado);
}   
//Debug
if (keyCode == 114) {
if (debug == true) {
debug = false;
} else {
debug = true;
}
}
}
//Atajos
if (keyCode == 32) {//TECLA BARRA ESPACIADORA
if (pause == true) {
pause = false;
} else {
pause = true;
}
}
}
void keyReleased() {
if (pause == false) {
boolean presionado = false;
//EJES X
if (keyCode == 65 || keyCode == 37) {
jugador1.izquierda(presionado);
} else if (keyCode == 68 || keyCode == 39) {
jugador1.derecha(presionado);
}
//EJE Y
if (keyCode == 87 || keyCode == 38) {
jugador1.arriba(presionado);
} else if (keyCode == 83 || keyCode == 40) {
jugador1.abajo(presionado);
}
}
}

void mousePressed() {
if (pause == false) {
sfxGun.playMusic();
if (mouseButton == 37 && balasRevolver > 0 && inventario == 1) {
balas.add(new Proyectil(jugador1));
balasRevolver--;
}
if (mouseButton == 39 && construir == true && objetoLimiteRestantes> 0) {
boolean chocarCaja = false, chocarJugador = false, chocarEnemigo = false;
//Chocar Jugador
chocarJugador = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, jugador1.posicion.x, jugador1.posicion.y, jugador1.ancho, jugador1.altura);

//Chocar Caja
if (chocarJugador == false) {
for (int i=0; i<limites.size(); i++) {
chocarCaja = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, limites.get(i).posicion.x, limites.get(i).posicion.y, limites.get(i).ancho, limites.get(i).altura);
if (chocarCaja == true || chocarJugador == true) {
break;
}
}
}
//Chocar Enemigo
/*
if(chocarJugador == false && chocarCaja == false){
 for(int i=0; i<enemigos.size(); i++){
 chocarEnemigo = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, enemigos.get(i).posicion.x, enemigos.get(i).posicion.y, enemigos.get(i).ancho, enemigos.get(i).altura);
 if(chocarEnemigo == true || chocarJugador == true){
 break;
 }
 }
 }*/
if (chocarJugador == false && chocarCaja == false) {
for (int i=0; i<nivel1.getListEne().size(); i++) {
chocarEnemigo = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, nivel1.getListEne().get(i).posicion.x, nivel1.getListEne().get(i).posicion.y, nivel1.getListEne().get(i).ancho, nivel1.getListEne().get(i).altura);
if (chocarEnemigo == true || chocarJugador == true) {
break;
}
}
}
//Crear Caja VER AQUI
if (chocarCaja == false && chocarJugador == false && chocarEnemigo == false && mouseX < anchoJuego-10 && mouseY < alturaJuego-10 && limites.size() < limiteCajas) {
limites.add(new ObjetoLimitante());
objetoLimiteRestantes-= 1;
}
}
} else {
if (mouseButton == 37) {
boolean chocarBtn1 = colisionPunto(mouseX, mouseY, b1.get(0), b1.get(1), b1.get(2), b1.get(3));
boolean chocarBtn2 = colisionPunto(mouseX, mouseY, b2.get(0), b2.get(1), b2.get(2), b2.get(3));
boolean chocarBtn3 = colisionPunto(mouseX, mouseY, b3.get(0), b3.get(1), b3.get(2), b3.get(3));
boolean chocarBtn4 = colisionPunto(mouseX, mouseY, b4.get(0), b4.get(1), b4.get(2), b4.get(3));
if (chocarBtn1 && monedas >= 10) {
balasRevolver += 16;
monedas -= 10;
} else if (chocarBtn2 && monedas >= 10) {
objetoLimiteRestantes += 5;
monedas -= 10;
} else if (chocarBtn3 && monedas >= 25 && jugador1.vida < 10) {
jugador1.vida = 10;
monedas -= 25;
} else if (chocarBtn4 && monedas >= 100) {
jugador1.vida = 10;
monedas -= 25;
}
}
}
}
