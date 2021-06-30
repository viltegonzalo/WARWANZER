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
 
 class Pantalla { 
  private PImage imagen;
  private PImage marco;
  private PVector posicion;  
  private int scene=0;
  private int cantBotones;
  private ArrayList<Boton> botones;

  public Pantalla(int cantBtn) {
    this.cantBotones=cantBtn;
    this.botones=new ArrayList<Boton>();
    
    this.botones.add(new Boton(1, PATH_BTN_PLAY_MAIN, PATH_BTN_PLAY_MAIN_D, 200, 60, width/2, height/2-50));
    this.botones.add(new Boton(2, PATH_BTN_INTRO_MAIN, PATH_BTN_INTRO_MAIN_D, 200, 60, width/2, height/2+20));
    this.botones.add(new Boton(3, PATH_BTN_EXIT_MAIN, PATH_BTN_EXIT_MAIN_D, 200, 60, width/2, height/2+90));

    this.imagen = loadImage(PATH_IMG_PANTALLA_MAIN);
    imagen.resize(width, height);
    this.posicion = new PVector(400, 250);
    //valores Privados
    marco = loadImage(PATH_IMG_PANTALLA_CUADRO); 
    marco.resize(800, 550);
    //botones seleccionados
  }
  //--------------------MÉTODOS----------------------
  public void  display() {
    background(imagen);
    image(marco, this.posicion.x+100, this.posicion.y+100);
    for (int i=0; i<cantBotones; i++) {
      this.botones.get(i).display();
      this.botones.get(i).mousePressed();
      this.scene=this.botones.get(i).mouseDragged();
    }
  }
  public int getScene() {
    return this.scene;
  }
  public ArrayList<Boton> getBtns(){
    return this.botones;
  }
}
