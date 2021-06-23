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
class VideoPlayer {
private Movie movie;
private PVector sizeMovie;

public VideoPlayer(Movie movie, int w, int h) {    
this.sizeMovie=new PVector(w, h);
this.movie=movie;
this.movie.play();
}

public void moviePlay() {

this.movieEvent(this.movie);
//float r= map (mouseX,0,width,0,4);    
image(this.movie, 0, 0, sizeMovie.x, sizeMovie.y);
}
public void movieEvent(Movie movie) {
if (movie.available()) this.movie.read();
}

public boolean isFinishMovie() {
return this.movie.time() == this.movie.duration();
}

public Movie getMovie() {
return this.movie;
}
}
