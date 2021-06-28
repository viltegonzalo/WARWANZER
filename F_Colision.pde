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


boolean chocarRect(float x1, float y1, float ancho1, float altura1, float x2, float y2, float ancho2, float altura2) {

  boolean colision = false;
  float x1Centro = x1 + ancho1/2;
  float y1Centro = y1 + altura1/2;
  float x2Centro = x2 + ancho2/2;
  float y2Centro = y2 + altura2/2;
  float distX = abs(x1Centro - x2Centro);
  float distY = abs(y1Centro - y2Centro);
  float sumaAncho = (ancho1/2) + (ancho2/2);
  float sumaAlturas = (altura1/2) + (altura2/2);

  if (distX < sumaAncho && distY < sumaAlturas) {
    colision = true;
  } else {
    colision = false;
  }
  return colision;
}


boolean chocarRect(Entidad entidad1, Entidad entidad2) {

  boolean colision = false;
  float x1Center = entidad1.getPos().x + entidad1.getAncho()/2-10;
  float y1Center = entidad1.getPos().y+5+ entidad1.getAltura()/2;
  float x2Center = entidad2.getPos().x -20+ entidad2.getAncho()/2;
  float y2Center = entidad2.getPos().y + entidad2.altura/2;
  float distX = abs(x1Center - x2Center);
  float distY = abs(y1Center - y2Center);
  float sumaLarguras = (entidad1.getAncho()/2) + (entidad2.getAncho()/2);
  float sumaAlturas = (entidad1.getAltura()/2) + (entidad2.getAltura()/2);

  if (distX < sumaLarguras && distY < sumaAlturas) {
    colision = true;
  } else {
    colision = false;
  }

  return colision;
}

//Colision Puntos 1
boolean colisionPunto(float x1, float y1, Entidad entidad) {
  boolean colision = false;
  if (x1 > entidad.getPos().x && x1 < entidad.getPos().x+entidad.getAncho() 
    && y1 > entidad.getPos().y && y1 < entidad.getPos().y+entidad.getAltura()) {
    colision = true;
  }
  return colision;
}

//Colision Puntos 2
boolean colisionPunto(float x1, float y1, float x2, float y2, int ancho, int altura) {
  boolean colision = false;
  if (x1 > x2 && x1 < x2+ancho && y1 > y2 && y1 < y2+altura) {
    colision = true;
  }
  return colision;
}

//Colisao Lado 1
String chocarLado(Entidad entidad, Entidad otro) {

  String lado = "";
  float distX, distY;

  distX = abs((entidad.getPos().x+entidad.ancho/2) - (otro.getPos().x+otro.ancho/2));
  distY = abs((entidad.getPos().y+entidad.altura/2) - (otro.getPos().y+otro.altura/2));
  //Eixo X
  if (distX > distY) {
    if (entidad.getPos().x < otro.getPos().x) {
      lado = "DERECHA";
    } else {
      lado = "IZQUIERDA";
    }
  }

  //Eixo Y
  else {
    if (entidad.getPos().y < otro.getPos().y) {
      lado = "ABAJO";
    } else {
      lado = "ARRIBA";
    }
  }
  return lado;
}
