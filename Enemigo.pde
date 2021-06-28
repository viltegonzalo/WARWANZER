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
class Enemigo extends Entidad {

  //Atributos
  private float velocidadX;
  private float velocidadY;
  private float velocidadBase;
  private float aceleracion;
  private int frame;
  private int puntos;


  /**Construtor por defecto*/
  public Enemigo() { 
    this.imagenes=new ArrayList<PImage>();
    for (int i=1; i<=16; i++) {
      this.imagenes.add(loadImage(PATH_IMG_ENEMIGO+i+".png"));
    }
    this._color = color(0, 255, 0);
    this.velocidadBase = random(0.1, 0.2);
    this.velocidadX = 0;
    this.velocidadY = 0;
    this.aceleracion = 0.1;//<<<<VELOCIDAD DEL ENEMIGO
    this.fuerza = 1;    
    this.tipo = 4;    
    this.vida = round(random(1, 2));
    this.frame = 4;

    switch(this.tipo) {
    case 1: 
      this.ancho = 34;
      this.altura = 40;
      this.ajusteImagenX = -2;
      this.ajusteImagenY = 0;
      this.totalFrames = 16;
      break;
    case 2: 
      this.ancho = 34;
      this.altura = 40;
      this.ajusteImagenX = 0;
      this.ajusteImagenY = 0;
      this.totalFrames = 16;
      break;
    case 3: 
      this.ancho = 34;
      this.altura = 40;
      this.ajusteImagenX = -4;
      this.ajusteImagenY = 0;
      this.totalFrames = 16;
      break;
    case 4: 
      this.ancho = 34;
      this.altura = 40;
      this.ajusteImagenX = 0;
      this.ajusteImagenY = 0;
      this.totalFrames = 16;
      break;
    }


    float nacerX = random(1);
    float nacerY = random(1);
    float distanciaOrigen = 200;
    //X
    if (nacerX <= 0.5) {
      this.posicion.x = random(-distanciaOrigen, -this.ancho);
    } else {
      this.posicion.x = random(anchoJuego, anchoJuego+distanciaOrigen);
    }
    //Y
    if (nacerY <= 0.5) {
      this.posicion.y = random(-distanciaOrigen, -this.altura);
    } else {
      this.posicion.y = random(alturaJuego, anchoJuego+distanciaOrigen);
    }
    this.puntos = round(this.vida*10)+round(this.velocidadBase*10);
  }


  //---------ZONA METODOS------//
  public void seguirJugador(Jugador j) {
    float xObjetivo = j.getPos().x;
    float yObjetivo = j.getPos().y;
    //Eje X
    if (this.posicion.x < xObjetivo) {
      if (this.velocidadX < this.velocidadBase) {
        this.velocidadX += this.aceleracion;
        //this.derecha=true;
      }
      animarDerecha();
      this.posicion.x += this.velocidadX;
    } else if (this.posicion.x > xObjetivo) {
      if (this.velocidadX > -this.velocidadBase) {
        this.velocidadX -= this.aceleracion;
        //this.izquierda=true;
      }
      this.animarIzquierda();
      this.posicion.x += this.velocidadX;
    }
    //EJE Y
    if (this.posicion.y < yObjetivo) {
      if (this.velocidadY < this.velocidadBase) {
        this.velocidadY += this.aceleracion;
        //this.abajo=true;
      }
      animarAbajo();
      this.posicion.y += this.velocidadY;
    } else if (this.posicion.y > yObjetivo) {
      if (this.velocidadY > -this.velocidadBase) {
        this.velocidadY -= this.aceleracion;
      }
      animarArriba();
      this.posicion.y += this.velocidadY;
    }
  }

  public  void animarArriba() {
    int taxaFrames =4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      switch(this.frame) {
        case 1: this.imagen = this.imagenes.get(0); break;
        case 2: this.imagen = this.imagenes.get(1); break;
        case 3: this.imagen = this.imagenes.get(2); break;
        case 4: this.imagen = this.imagenes.get(3); break;
        default: this.frame = 1; break;
      }
    }
  }


  public void animarIzquierda() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      switch(this.frame) {
        case 1: this.imagen = this.imagenes.get(4); break;
        case 2: this.imagen = this.imagenes.get(5); break;
        case 3: this.imagen = this.imagenes.get(6); break;
        case 4: this.imagen = this.imagenes.get(7); break;
        default: this.frame = 1; break;
      }
    }
  }



  public  void animarAbajo() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      switch(this.frame) {
        case 1: this.imagen = this.imagenes.get(8); break;
        case 2: this.imagen = this.imagenes.get(9); break;
        case 3: this.imagen = this.imagenes.get(10); break;
        case 4: this.imagen = this.imagenes.get(11); break;
        default: this.frame = 1; break;
      }
    }
  }


  public  void animarDerecha() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      switch(this.frame) {
        case 1: this.imagen = this.imagenes.get(12); break;
        case 2: this.imagen = this.imagenes.get(13); break;
        case 3: this.imagen = this.imagenes.get(14); break;
        case 4: this.imagen = this.imagenes.get(15); break;
        default: this.frame = 1; break;
      }
    }
  }



  /*
void cadaEnemigo() {
   for (int i=0; i<enemigos.size(); i++) {
   enemigos.get(i).seguirJugador(jugador1);
   boolean collidePlayer = chocarRect(jugador1, enemigos.get(i));
   if (i < enemigos.size()) {
   for (int ii=i+1; ii<enemigos.size(); ii++) {
   boolean collideZumbie = chocarRect(enemigos.get(i), enemigos.get(ii));
   if (collideZumbie == true) {
   enemigos.get(i).esEmpujado(enemigos.get(ii), enemigos.get(i).getFuerza());
   enemigos.get(ii).esEmpujado(enemigos.get(i), enemigos.get(ii).getFuerza());
   }
   }
   }
   if (collidePlayer == true) {
   jugador1.esEmpujado(enemigos.get(i), jugador1.getFuerza());
   enemigos.get(i).esEmpujado(jugador1, jugador1.getFuerza());
   jugador1.vida--;
   }
   enemigos.get(i).paraDiseniar();
   enemigos.get(i).animar();
   //Barra de Vida
   barraDeVida(enemigos.get(i));
   }
   }
   */

  public void cadaEnemigo(ArrayList<Enemigo> enemigos) {
    for (int i=0; i<enemigos.size(); i++) {
      enemigos.get(i).seguirJugador(jugador1);
      boolean collidePlayer = chocarRect(jugador1, enemigos.get(i));
      if (i < enemigos.size()) {
        for (int ii=i+1; ii<enemigos.size(); ii++) {
          boolean collideZumbie = chocarRect(enemigos.get(i), enemigos.get(ii));
          if (collideZumbie == true) {
            enemigos.get(i).esEmpujado(enemigos.get(ii), enemigos.get(i).getFuerza());
            enemigos.get(ii).esEmpujado(enemigos.get(i), enemigos.get(ii).getFuerza());
          }
        }
      }
      if (collidePlayer == true) {
        jugador1.esEmpujado(enemigos.get(i), jugador1.getFuerza());
        enemigos.get(i).esEmpujado(jugador1, jugador1.getFuerza());
        jugador1.vida--;
      }
      enemigos.get(i).display();
      //enemigos.get(i).animar();
      //Barra de Vida
      //barraDeVida(enemigos.get(i));
    }
  }


  public void setAceleracion() {
    this.aceleracion=2;
  }
}
