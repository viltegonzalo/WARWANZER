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
import ddf.minim.*;


class Nivel {

private PImage fondo;
private ArrayList<Enemigo> enemigos;
private MusicPlayer music;
private int cantEnemigo;
private int id;

//public Nivel(int nivel, String path, int cantEne,String musicPath) {
/**Construtor parametrizado*/
public Nivel(int nivel, String path, int cantEne) {
this.enemigos=new ArrayList<Enemigo>();
this.cantEnemigo=cantEne;
this.id=nivel;
this.fondo=loadImage(path);
this.fondo.resize(width, height);

for (int i=0; i<cantEne; i++) {
this.enemigos.add(new Enemigo());
}
}
public Nivel(int nivel, String path, int cantEne,MusicPlayer music) {  
this.enemigos=new ArrayList<Enemigo>();
this.cantEnemigo=cantEne;
this.id=nivel;
this.fondo=loadImage(path);
this.fondo.resize(width, height);

this.music=music;

for (int i=0; i<cantEne; i++) {
this.enemigos.add(new Enemigo());
}
}



 //---------ZONA METODOS------//
public void displayNivel() {
this.music.playMusic();
background(this.fondo);
}

//----------- METODOS ACCESORES------//
public ArrayList<Enemigo> getListEne() {
return this.enemigos;
}
public PImage getFondo() {
return this.fondo;
}
public int getCantEnemigo() {
return this.cantEnemigo;
}
public int getId() {
return this.id;
}
public MusicPlayer getMusic() {
return this.music;
}
}
