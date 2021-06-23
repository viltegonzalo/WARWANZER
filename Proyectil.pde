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
class Proyectil extends Entidad{

//Atributos
float velocidadX, velocidadY, velocidadBase, danio;
boolean enPantalla;

/**Construtor Por defecto*/
public Proyectil(Entidad jugador){
this.ancho = 5;
this.altura = 5;
//this.x = jogador.x + jogador.largura/2 - this.largura/2;
//this.y = jogador.y + jogador.altura/2 - this.altura/2;
this.posicion.x = jugador.posicion.x + jugador.ancho/2;
this.posicion.y = jugador.posicion.y + jugador.altura/2;
this.velocidadBase = 20;
this._color = color(200, 150, 100);
this.enPantalla = true;
float x = jugador.posicion.x + jugador.ancho/2;
float y = jugador.posicion.y + jugador.altura/2;
float hipotenusa = sqrt(sq(mouseX-x) + sq(mouseY-y));
float sen = (mouseX-x) / hipotenusa;
float cos = (mouseY-y) / hipotenusa;
this.velocidadX = this.velocidadBase * sen;
this.velocidadY = this.velocidadBase * cos;
this.danio = 1;    
}

 //---------ZONA METODOS------//
void desenhar(){
noStroke();
fill(this._color);
ellipse(this.posicion.x, this.posicion.y, this.ancho, this.altura);
}

void atirar(){
this.posicion.x += this.velocidadX;
this.posicion.y += this.velocidadY;
}

void checarPosicao(){
if(this.posicion.x < 0 || this.posicion.x > anchoJuego-this.ancho || 
this.posicion.y < 0 || this.posicion.y > alturaJuego-this.altura){
this.enPantalla = false;
}
}

}
