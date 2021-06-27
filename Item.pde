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

class Item extends Entidad {

  //Atributos
  private int tiempoVida; 
  private int frame;

  /**Construtor parametrizado*/
  public Item(int tipo, float x, float y) {
    //this.x = random(10, larguraJogo-26);
    //this.y = random(10, alturaJogo-26);
    this.posicion.x = x;
    this.posicion.y = y;
    this.tipo = tipo;  
    this.tiempoVida=TIEMPO_VIDA_ITEM;
    switch(tipo) {
    case 1: //Vida
      this.imagen = loadImage(PATH_IMG_ITEM_VIDA);//vg
      this.imagen.resize(35, 35);
      
      break;
    case 2: //Balas
      this.imagen = loadImage(PATH_IMG_ITEM_BALA);
      this.imagen.resize(35, 35);
      
      break;
    case 3: //Moedas
      this.imagen = loadImage(PATH_IMG_ITEM_MONEDAS_1);      
      break;
    }

    this.ancho = this.imagen.width;
    this.altura = this.imagen.height;
  }


  //---------ZONA METODOS------//
  public void rodar() {
    this.tiempoVida -= 1;
    if (this.tiempoVida <= 3) {
      this.recibeDanio = true;
    } else {
      noTint();
    }
  }

  public void sobrepondo() {
    this.posicion.x = random(10, anchoJuego-26);
    this.posicion.y = random(10, alturaJuego-26);
  }

  public void coletar() {
    if (this.tipo == 1) {//Vidas
      jugador1.vida = 10;
    } else if (this.tipo == 2) {//Balas
      balasRevolver += 16;
    } else if (this.tipo == 3) {//Moedas
      monedas++;
    }
    this.tiempoVida = 0;
  }

  public void animar() {
    if (this.tipo == 3) {
      int cuadroPorSegundo = 5;
      if (frameCount % cuadroPorSegundo == 0) {
        this.frame++;
        if (this.frame > 4) {
          this.frame = 1;
        }
      }

      if (this.frame == 1) {
        this.imagen = loadImage(PATH_IMG_ITEM_MONEDAS_1);
      } else if (this.frame == 2) {
        this.imagen = loadImage(PATH_IMG_ITEM_MONEDAS_2);
      } else if (this.frame == 3) {
        this.imagen = loadImage(PATH_IMG_ITEM_MONEDAS_3);
      } else if (this.frame == 4) {
        this.imagen = loadImage(PATH_IMG_ITEM_MONEDAS_1);
      }
    }
  }
}
