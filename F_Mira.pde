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

public void aparecerItem(float x, float y) {

int aparecer = round(random(1, 100));
int tipo = round(random(1, 100));

if (aparecer <= 40) {
//Vida
if (tipo <= 20) {
items.add(new Item(1, x, y));
}
//Balas
else if (tipo <= 50) {
items.add(new Item(2, x, y));
}
//Moedas
else {
items.add(new Item(3, x, y));
}
}
}

public void mira() {
mira1Imagen = loadImage("data/images/jugador/mira1Base.png");
//stroke(255, 255, 255, 40);
//strokeWeight(1);
//line(p1.x+p1.largura/2, p1.y+p1.altura/2, mouseX, mouseY);

//Mira Tiro
image(mira1Imagen, mouseX-8, mouseY-8);

//Mira Construir
if (dist(mouseX, mouseY, jugador1.getPos().x+jugador1.ancho/2, jugador1.getPos().y+jugador1.altura/2) < 128) {
construir = true;
noStroke();
fill(255, 0, 0, 50);
rect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32);
} else {
construir = false;
}
}
/*
void cadaBala() {
for (int i=0; i<balas.size(); i++) {
balas.get(i).atirar();
balas.get(i).checarPosicao();
balas.get(i).desenhar();
if (balas.get(i).enPantalla == false) {
balasPerdidas.append(i);
}
boolean chocarBala = false;
if (balas.get(i).enPantalla == true) {
for (int ii=0; ii<enemigos.size(); ii++) {
chocarBala = chocarRect(balas.get(i), enemigos.get(ii));
if (chocarBala == true) {
  enemigos.get(ii).vida -= balas.get(i).danio;
  enemigos.get(ii).recibeDanio = true;
  if (enemigos.get(ii).vida <= 0) {
    puntos += enemigos.get(ii).puntos;
    enemigosMuertos++;//INCREMETA CADA VEZ Q MATAMOS UN ENEMIGO
    aparecerItem(enemigos.get(ii).getPos().x, enemigos.get(ii).getPos().y);
    enemigos.remove(ii);
    if (enemigosMuertos % proximaFase == 0) {
      fase++;
      tazaEnemigo = round(fase/4)+1;
    }
  }
  break;
}
}
} else {
balas.remove(i);
}

if (chocarBala == true) {
balas.remove(i);
}
}
}
*/


public void cadaBala(ArrayList<Enemigo> enemigos) {
for (int i=0; i<balas.size(); i++) {
balas.get(i).atirar();
balas.get(i).checarPosicao();
balas.get(i).desenhar();
if (balas.get(i).enPantalla == false) {
balasPerdidas.append(i);
}
boolean chocarBala = false;
if (balas.get(i).enPantalla == true) {
for (int ii=0; ii<enemigos.size(); ii++) {
chocarBala = chocarRect(balas.get(i), enemigos.get(ii));
if (chocarBala == true) {
  enemigos.get(ii).vida -= balas.get(i).danio;
  enemigos.get(ii).recibeDanio = true;
  if (enemigos.get(ii).vida <= 0) {
    puntos += enemigos.get(ii).puntos;
    enemigosMuertos++;//INCREMETA CADA VEZ Q MATAMOS UN ENEMIGO
    aparecerItem(enemigos.get(ii).getPos().x, enemigos.get(ii).getPos().y);
    enemigos.remove(ii);
    if (enemigosMuertos % proximaFase == 0) {
      fase++; //PASA DE NIVEL
      tazaEnemigo = round(fase/4)+1;
    }
  }
  break;
}
}
} else {
balas.remove(i);
}

if (chocarBala == true) {
balas.remove(i);
}
}
}
int segundos = 60;



public void frames(ArrayList<Enemigo> enemigos) {
/*
if (enemigosMuertos<8) {
fase = 1;
} else fase=2;*/
//MAS ENEMIGOS
if (fase == 1) {
fill(255);
textSize(50);
text("NIVEL 1", 300, 300);
}
if (fase==2) {
fill(255);
textSize(50);
text("NIVEL 2", 300, 300); 
//enemigos.add(new Enemigo());
}
if (fase==3) {
fill(255);
textSize(50);
text("NIVEL 3", 300, 300); 
//enemigos.add(new Enemigo());
}
//Metralladoras
if (frameCount % 10 == 0 && mousePressed && mouseButton == 37) {
balas.add(new Proyectil(jugador1));
balasRevolver--;
}

//Construir
if (mousePressed && mouseButton == 39) {
mousePressed();
}

////Vida Extra
//if(frameCount % round(30*segundos) == 0){
//  itens.add(new Item(1));
//}
////Balas Extra
//if(frameCount % round(15*segundos) == 0){
//  itens.add(new Item(2));
//}
}
