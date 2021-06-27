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
import ddf.minim.*;

class MusicPlayer {
private Minim minim;
private AudioPlayer player;

public MusicPlayer(Minim minim, String path) {
this.minim=minim;
this.player=this.minim.loadFile(path);
}

public void  playMusic() {
if (!player.isPlaying()) {
player.rewind();
this.player.play();
} else {
player.play( );
}
}
public void loopMusic() {
if (!player.isPlaying()) {      
player.rewind();
player.play( );
}
}
public void stopMusic() {
this.player.close();
}
public AudioPlayer getMusic(){
return this.player;
}
}
