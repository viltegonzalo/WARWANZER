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

class BarraEstado {
  //ATRIBUTOS
  private PImage fondoTienda;
  private ArrayList<PImage> botones;
  private ArrayList<PImage> icoItems;
  private PImage revolverImagen, metralladoraImagen, fondoTienda1,tituloTienda;
  private IntList b1;
  private IntList b2;
  private IntList b3;
  private IntList b4;
  private Jugador  jugador1;
  //CONSTRUCTOR
  public BarraEstado() {
   // this.fondoTienda=new ArrayList<PImage>();
    this.jugador1=new Jugador();
    this.botones=new ArrayList<PImage>();
    this.icoItems=new ArrayList<PImage>();
    for(int i=1;i<=3;i++){
      this.botones.add(loadImage(PATH_IMG_TIENDA_BTN+i+".png"));
    }       
    this.fondoTienda=loadImage(PATH_IMG_TIENDA);
    
    
    this.revolverImagen = loadImage(PATH_IMG_ICO_ARMA_1);
    this.metralladoraImagen = loadImage(PATH_IMG_ICO_ARMA_2);
    this.fondoTienda1 = loadImage(PATH_IMG_TIENDA);
    this.tituloTienda = loadImage(PATH_IMG_TIENDA_TITULO);
    
    this.b1 = new IntList(4);
    this.b2 = new IntList(4);
    this.b3 = new IntList(4);
    this.b4 = new IntList(4);
  }
  //METODOS
  public void display() {
    stroke(57, 255, 20);
    strokeWeight(1);
    fill(47, 79, 79);
    //rect(2, alturaJogo, larguraJogo-3, 48, 10);
    rect(0, alturaJuego+1, anchoJuego-1, 48, 5);

    //Moedas
    image(loadImage(PATH_IMG_ITEM_MONEDAS_1), 5, alturaJuego+33);
    fill(57, 255, 2);
    textSize(10);
    text("x" + monedas, 20, alturaJuego+45);

    //Caixas
    //image(caixa1BaseImagem, 65, alturaJuego+5);
    fill(57, 255, 2);
    textSize(10);
    text("x" + objetoLimiteRestantes, 85, alturaJuego+18);

    //Puntos
    fill(57, 255, 2);
    textSize(10);
    text("Puntos: " + puntos, 65, alturaJuego+45);

    //Inventario
    if (inventario == 1) {
      fill(57, 255, 2);
      rect(200, alturaJuego+5, 40, 40);
      fill(120);
      rect(240, alturaJuego+5, 40, 40);
      rect(280, alturaJuego+5, 40, 40);
      rect(320, alturaJuego+5, 40, 40);
    } else if (inventario == 2) {
      fill(120);
      rect(200, alturaJuego+5, 40, 40);
      fill(57, 255, 2);
      rect(240, alturaJuego+5, 40, 40);
      fill(120);
      rect(280, alturaJuego+5, 40, 40);
      rect(320, alturaJuego+5, 40, 40);
    } else if (inventario == 3) {
      fill(120);
      rect(200, alturaJuego+5, 40, 40);
      rect(240, alturaJuego+5, 40, 40);
      fill(57, 255, 2);
      rect(280, alturaJuego+5, 40, 40);
      fill(120);
      rect(320, alturaJuego+5, 40, 40);
    } else if (inventario == 4) {
      fill(120);
      rect(200, alturaJuego+5, 40, 40);
      rect(240, alturaJuego+5, 40, 40);
      rect(280, alturaJuego+5, 40, 40);
      fill(57, 255, 2);
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
  }

  public void barraDeVida(Entidad entidade) {

    int larguraBarra = round(3*entidade.vida);
    int alturaBarra = 3;
    float xBarra = entidade.posicion.x-3;
    float yBarra = entidade.posicion.y-8;
    color corBarra = color(abs(10-entidade.vida)*30, 255-abs(10-entidade.vida)*30, 0);

    noStroke();
    fill(corBarra);
    rect(xBarra, yBarra, larguraBarra, alturaBarra);
  }

  public void tienda() {
    //Configuraciones Iniciales Botones
    fill(57, 255, 2);
    b1.append(width/2);
    b1.append(225);
    b1.append(this.botones.get(0).width);
    b1.append(this.botones.get(0).height);
    b2.append(width/2);
    b2.append(350);
    b2.append(this.botones.get(1).width);
    b2.append(this.botones.get(1).height);
    //btn3Imagem.resize(220, 90);
    b3.append(width/2);
    b3.append(475);
    b3.append(this.botones.get(2).width);
    b3.append(this.botones.get(2).height);

    this.jugador1.izquierda(false);
    this.jugador1.derecha(false);
    this.jugador1.arriba(false);
    this.jugador1.abajo(false);

    fondoTienda1.resize(width, height);
    background(fondoTienda1);

    imageMode(CENTER);
    this.tituloTienda.resize(450,100);
    image(tituloTienda, width/2, 100);

    
    //Comprar Metralhadora    
    botones.get(0).resize(450,100);
    image(botones.get(0), b1.get(0), b1.get(1));
    //Comprar Balas
    botones.get(1).resize(450,100);
    image(botones.get(1), b2.get(0), b2.get(1));
    //Comprar Vidas
    botones.get(2).resize(450,100);
    image(botones.get(2), b3.get(0), b3.get(1));
    //display();//Muestra la Barra de estado del Jugador
  }

  public void gameOver() {
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
  //GETTERS & SETTERS
  public IntList getB1() {
    return this.b1;
  }
  public IntList getB2() {
    return this.b2;
  }
  public IntList getB3() {
    return this.b3;
  }
  public IntList getB4() {
    return this.b4;
  }
  
  public void setJugador(Jugador j){
    this.jugador1=j;
  }

  //void barraDeEstado() {
  //  //F3
  //  if (debug == true) {
  //    //Fase
  //    textSize(14);
  //    fill(0, 255, 0, 125);
  //    text("NIVEL: " + fase, 0, 12);

  //    //ENEMIGOS
  //    text("ENEMIGOS: " + enemigos.size(), 0, 30);

  //    //ENEMIGOS MUERTO
  //    //text("Zobies Mortos: " + zombiesMortos, 0, 52);

  //    //VELOCIDAD DE ENEMIGO
  //    text("VELOCIDAD: " + float(tazaEnemigo)/tiempoAparicionEnemigo + " z/s", 0, 74);
  //  }
  //}
}
