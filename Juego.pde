class Juego{
  private Jugador jugador1;
  private ArrayList<Nivel> niveles;
  private ArrayList<MusicPlayer>playList;
  private ArrayList<Item> items;
  private ArrayList<Enemigo> enemigos;
  private ArrayList<ObjetoLimitante> limites;
  private ArrayList<Proyectil> balas;
  private IntList balasPerdidas;
  //private BarraEstado barraEstado;
  
  private int objetoLimiteRestantes = 0;
  private int inventario;
  private int puntos;
  private int fase;
  private int proximaFase;
  private int tazaEnemigo;
  private int enemigosMuertos;
  private int tiempoAparicionEnemigo;
  private int monedas;
  
  private int anchoJuego;
  private int altoJuego;
  private int fps;
  
  private boolean gameOver; 
  private boolean debug;
  private boolean pause;
  private boolean construir;
  
  



  
  private VideoPlayer intro;
  private MusicPlayer ostGameOver;
  private MusicPlayer sfxGun;
  
  public Juego(){
    noCursor();
    this.niveles = new ArrayList<Nivel>();
    this.playList = new ArrayList<MusicPlayer>();
    this.items = new ArrayList<Item>();
    this.enemigos = new ArrayList<Enemigo>();
    this.limites = new ArrayList<ObjetoLimitante>();
    this.balas = new ArrayList<Proyectil>();
    this.balasPerdidas = new IntList();
    
    this.inventario = 1;    
    this.fase = 1;
    this.debug=false;
    this.pause=false;
    this.construir=false;
    this.proximaFase = 8;
    this.monedas=100;
    this.enemigosMuertos=0;
    this.tazaEnemigo = round(fase/4)+1;
    this.tiempoAparicionEnemigo = 10;
    this.anchoJuego=width;
    this.altoJuego=height-50;
  }
}
