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

class Item extends Entidad{

//Atributos
private int tiempoVida; 
private int frame;

/**Construtor parametrizado*/
public Item(int tipo, float x, float y){
//this.x = random(10, larguraJogo-26);
//this.y = random(10, alturaJogo-26);
this.posicion.x = x;
this.posicion.y = y;
this.tipo = tipo;
//Vida
if(this.tipo == 1){
this.imagen = vida1Imagem;//vg
this.tiempoVida = 10;
}
//Balas
else if(this.tipo == 2){
this.imagen = bala1Imagem;//vg
this.tiempoVida = 10;
}
//Moedas
else if(this.tipo == 3){
this.imagen = moeda1_2Imagem;//vg
this.tiempoVida = 10;
}
this.ancho = this.imagen.width;
this.altura = this.imagen.height;
}


//---------ZONA METODOS------//
public void rodar(){
this.tiempoVida -= 1;
if(this.tiempoVida <= 3){
this.recibeDanio = true;
}
else{
noTint();
}
}

public void sobrepondo(){
this.posicion.x = random(10, anchoJuego-26);
this.posicion.y = random(10, alturaJuego-26);
}

public void coletar(){
if(this.tipo == 1){//Vidas
jugador1.vida = 10;
}else if(this.tipo == 2){//Balas
balasRevolver += 16;
}else if(this.tipo == 3){//Moedas
monedas++;
}
this.tiempoVida = 0;
}

public void animar(){
if(this.tipo == 3){
int cuadroPorSegundo = 5;
if(frameCount % cuadroPorSegundo == 0){
this.frame++;
if(this.frame > 4){
this.frame = 1;
}
}

if(this.frame == 1){
this.imagen = moeda1_1Imagem;
}else if(this.frame == 2){
this.imagen = moeda1_2Imagem;
}else if(this.frame == 3){
this.imagen = moeda1_3Imagem;
}else if(this.frame == 4){
this.imagen = moeda1_2Imagem;
}
}
}

}
