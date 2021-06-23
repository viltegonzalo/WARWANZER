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

void preCarga() {
  revolverImagen = loadImage("imagens/revolver.png");
  metralladoraImagen = loadImage("imagens/metralhadora.png");
  btn1Imagem = loadImage("images/barraEstado/btn1Base.png");
  btn2Imagem = loadImage("images/barraEstado/btn2Base.png");
  btn3Imagem = loadImage("images/barraEstado/btn3Base.png");
  btn4Imagem = loadImage("images/barraEstado/btn4Base.png");
}

void barraDeEstado() {

  stroke(255, 0, 0);
  strokeWeight(1);
  fill(255, 255, 255);
  //rect(2, alturaJogo, larguraJogo-3, 48, 10);
  rect(0, alturaJuego+1, anchoJuego-1, 48, 5);

  //Moedas
  image(moeda1_1Imagem, 5, alturaJuego+33);
  fill(110, 110, 0);
  textSize(16);
  text("x" + monedas, 20, alturaJuego+45);

  //Caixas
  //image(caixa1BaseImagem, 65, alturaJuego+5);
  fill(110, 110, 0);
  textSize(16);
  text("x" + objetoLimiteRestantes, 85, alturaJuego+18);

  //Pontos
  fill(255, 0, 0);
  textSize(14);
  text("Pontos: " + puntos, 65, alturaJuego+45);

  //Inventario
  if (inventario == 1) {
    fill(220, 220, 10);
    rect(200, alturaJuego+5, 40, 40);
    fill(120);
    rect(240, alturaJuego+5, 40, 40);
    rect(280, alturaJuego+5, 40, 40);
    rect(320, alturaJuego+5, 40, 40);
  } else if (inventario == 2) {
    fill(120);
    rect(200, alturaJuego+5, 40, 40);
    fill(220, 220, 10);
    rect(240, alturaJuego+5, 40, 40);
    fill(120);
    rect(280, alturaJuego+5, 40, 40);
    rect(320, alturaJuego+5, 40, 40);
  } else if (inventario == 3) {
    fill(120);
    rect(200, alturaJuego+5, 40, 40);
    rect(240, alturaJuego+5, 40, 40);
    fill(220, 220, 10);
    rect(280, alturaJuego+5, 40, 40);
    fill(120);
    rect(320, alturaJuego+5, 40, 40);
  } else if (inventario == 4) {
    fill(120);
    rect(200, alturaJuego+5, 40, 40);
    rect(240, alturaJuego+5, 40, 40);
    rect(280, alturaJuego+5, 40, 40);
    fill(220, 220, 10);
    rect(320, alturaJuego+5, 40, 40);
  }

  image(revolverImagen, 203, alturaJuego+2);
  image(metralladoraImagen, 245, alturaJuego+2);
  //Balas
  //image(bala1Imagem, 5, alturaJogo+5);
  //fill(110, 110, 0);
  fill(0);
  textSize(12);
  text("x" + balasRevolver, 207, alturaJuego+40);

  //F3
  if (debug == true) {
    //Fase
    textSize(14);
    fill(0, 255, 0, 125);
    text("NIVEL: " + fase, 0, 12);

    //ENEMIGOS
    text("ENEMIGOS: " + enemigos.size(), 0, 30);

    //ENEMIGOS MUERTO
    //text("Zobies Mortos: " + zombiesMortos, 0, 52);

    //VELOCIDAD DE ENEMIGO
    text("VELOCIDAD: " + float(tazaEnemigo)/tiempoAparicionEnemigo + " z/s", 0, 74);
  }
}


void barraDeVida(Entidad entidade) {

  int larguraBarra = round(3*entidade.vida);
  int alturaBarra = 3;
  float xBarra = entidade.posicion.x-3;
  float yBarra = entidade.posicion.y-8;
  color corBarra = color(abs(10-entidade.vida)*30, 255-abs(10-entidade.vida)*30, 0);

  noStroke();
  fill(corBarra);
  rect(xBarra, yBarra, larguraBarra, alturaBarra);
}



IntList b1 = new IntList(4);
IntList b2 = new IntList(4);
IntList b3 = new IntList(4);
IntList b4 = new IntList(4);

void tienda() {
  //Configuracoes Iniciais
  fill(255, 0, 0);
  b1.append(25);
  b1.append(100);
  b1.append(btn1Imagem.width);
  b1.append(btn1Imagem.height);
  b2.append(25);
  b2.append(145);
  b2.append(btn2Imagem.width);
  b2.append(btn2Imagem.height);
  b3.append(25);
  b3.append(190);
  b3.append(btn3Imagem.width);
  b3.append(btn3Imagem.height);
  b4.append(150);
  b4.append(100);
  b4.append(btn4Imagem.width);
  b4.append(btn4Imagem.height);

  jugador1.izquierda(false);
  jugador1.derecha(false);
  jugador1.arriba(false);
  jugador1.abajo(false);

  //Desenhar
  background(80);
  textSize(40);
  //Comprar Vidas
  image(btn3Imagem, b3.get(0), b3.get(1));
  //Comprar Metralhadora
  image(btn4Imagem, b4.get(0), b4.get(1));

  barraDeEstado();
}


void gameOver() {
  fill(255, 0, 0);
  textSize(50);
  text("Game Over", anchoJuego/2-130, alturaJuego/2);
  gameOver = true;
  nivel1.getMusic().stopMusic();
  nivel2.getMusic().stopMusic();
  nivel3.getMusic().stopMusic();
  ostGameOver.playMusic();
  noLoop();
}
