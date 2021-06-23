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

void cadaItem() {
  boolean chocarJugador = false;
  for (int i=0; i<items.size(); i++) {

    //boolean collideCaixa = false;
    //for(int ii=0; ii<caixas.size(); ii++){
    //  collideCaixa = collideRect(itens.get(i), caixas.get(ii));
    //  if(collideCaixa == true){
    //    itens.get(i).sobrepondo();
    //  }
    //}

    //Contador Tempo de Vida
    if (frameCount % 60 == 0) {
      items.get(i).rodar();
    }

    items.get(i).paraDiseniar();
    items.get(i).animar();

    chocarJugador = chocarRect(items.get(i), jugador1);
    if (chocarJugador == true) {
      items.get(i).coletar();
      items.remove(i);
    } else if (items.get(i).tiempoVida <= 0) {
      items.remove(i);
    }
  }
  noTint();
}
