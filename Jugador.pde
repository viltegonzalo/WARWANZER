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



class Jugador extends Entidad {

  /**Atributos*/
  private boolean[] wasd = {false, false, false, false};
  private float velocidadX;
  private float velocidadY;
  private float velocidadMax;
  private float velocidadMin;
  private float aceleracion;
  private float desaceleracion;
  private int frame;

  /**Construtor Por defecto*/
  public Jugador() {
    //this.ancho = 35;
    //this.altura = 40;
    this.imagenes=new ArrayList<PImage>();
    for (int i=1; i<=36; i++) {
      this.imagenes.add(loadImage(PATH_IMG_JUGADOR+i+".png"));
    }
    this.ancho = W_PERSONAJE;
    this.altura = H_PERSONAJE;
    this.aceleracion = 0.4;
    this.desaceleracion = 0.2;
    this.velocidadX = 0;
    this.velocidadY = 0;
    this.velocidadMax = 2;
    this.velocidadMin = 0.2;
    this.fuerza = 10;
    this.imagen = this.imagenes.get(18);
    this.frame = 1;
    this.vida = 15;
  }


  //---------ZONA METODOS------//
  public void paraDiseniar() {
    if (this.imagen != null) {
      //noStroke();
      ////fill(255);
      //rect(this.posicion.x+15, this.posicion.y+15, this.ancho, this.altura);
      if (this.recibeDanio == true) {
        tint(255, 255-this.tiempoDanio*20, 255-this.tiempoDanio*20);
        if (frameCount % 5 == 0) {
          this.tiempoDanio -= 1;
          if (this.tiempoDanio <= 0) {
            this.recibeDanio = false;
            this.tiempoDanio = this.tiempoDanioBase;
          }
        }
      } else {
        noTint();
      }
      image(this.imagen, this.posicion.x+this.ajusteImagenX, this.posicion.y+this.ajusteImagenY);
    } else {
      noStroke();
      fill(this._color);
      rect(this.posicion.x, this.posicion.y, this.ancho, this.altura);
    }
  }

  public void mover() {
    //Comprobar Eje X
    if (this.wasd[1] == true) {
      animarIzquierda();
      this.moverIzquierda();
    } else if (this.wasd[3] == true) {
      animarDerecha();
      this.moverDerecha();
    }
    //Eixo Y Checar
    if (this.wasd[0] == true) {
      animarArriba();
      this.moverArriba();
    } else if (this.wasd[2] == true) {
      animarAbajo();
      this.moverAbajo();
    }

    this.desaceleracionX();
    this.desaceleracionY();
    this.chequearPosicion();
  }

  //Eje X Mover
  public void moverIzquierda() {
    if (this.posicion.x > 0 && chocarIzquierda == false) {
      if (this.velocidadX > -this.velocidadMax) {
        this.velocidadX -= this.aceleracion;
        if (this.velocidadX > 0) {
          this.velocidadX -= this.aceleracion;
        }
      }
      this.posicion.x += this.velocidadX;
    }
  }

  public void moverDerecha() {
    if (this.posicion.x < anchoJuego-this.ancho && chocarDerecha == false) {
      if (this.velocidadX < this.velocidadMax) {
        this.velocidadX += this.aceleracion;
        if (this.velocidadX < 0) {
          this.velocidadX += this.aceleracion;
        }
      }
      this.posicion.x += this.velocidadX;
    }
  }

  //Eixo Y Mover
  public void moverArriba() {
    if (this.posicion.y > 0 && chocarArriba == false) {
      if (this.velocidadY > -this.velocidadMax) {
        this.velocidadY -= this.aceleracion;
        if (this.velocidadY > 0) {
          this.velocidadY -= this.aceleracion;
        }
      }
      this.posicion.y += this.velocidadY;
    }
  }

  public void moverAbajo() {
    if (this.posicion.y < alturaJuego-this.altura && chocarAbajo == false) {
      if (this.velocidadY < this.velocidadMax) {
        this.velocidadY += this.aceleracion;
        if (this.velocidadY < 0) {
          this.velocidadY += this.aceleracion;
        }
      }
      this.posicion.y += this.velocidadY;
    }
  }

  //Desaceleracion EJE X
  public void desaceleracionX() {
    if (this.posicion.x > 0 && this.posicion.x < anchoJuego-this.ancho && chocarIzquierda == false && chocarDerecha == false) {
      if (this.wasd[1] == false && this.wasd[3] == false) {
        if (this.velocidadX < -this.velocidadMin || this.velocidadX > this.velocidadMin) {
          if (this.velocidadX > 0) {
            this.velocidadX -= this.desaceleracion;
          } else if (this.velocidadX < 0) {
            this.velocidadX += this.desaceleracion;
          }
          this.posicion.x += this.velocidadX;
        } else {
          this.velocidadX = 0;
        }
      }
    } else {
      this.velocidadX = 0;
    }
  }

  //Desaceleracion EJE Y
  public void desaceleracionY() {
    if (this.posicion.y > 0 && this.posicion.y < alturaJuego-this.altura && chocarArriba == false && chocarAbajo == false) {
      if (this.wasd[0] == false && this.wasd[2] == false) {
        if (this.velocidadY < -this.velocidadMin || this.velocidadY > this.velocidadMin) {
          if (this.velocidadY > 0) {
            this.velocidadY -= this.desaceleracion;
          } else if (this.velocidadY < 0) {
            this.velocidadY += this.desaceleracion;
          }
          this.posicion.y += this.velocidadY;
        } else {
          this.velocidadY = 0;
        }
      }
    } else {
      this.velocidadY = 0;
    }
  }

  public void chequearPosicion() {
    //Eixo X
    if (this.posicion.x < 0 || this.chocarIzquierda == true) {
      this.posicion.x += 1;
    } else if (this.posicion.x > anchoJuego-this.ancho || this.chocarDerecha == true) {
      this.posicion.x -= 1;
    }
    //Eixo Y
    if (this.posicion.y < 0 || this.chocarArriba == true) {
      this.posicion.y += 1;
    } else if (this.posicion.y > alturaJuego-this.altura || this.chocarAbajo == true) {
      this.posicion.y -= 1;
    }
  }


  public void animar() {
    int taxaFrames = 9;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 2) {
        this.frame = 1;
      }
    }
    if (this.frame == 1) {
      this.imagen = this.imagenes.get(19);
    }
    //else{
    //  this.imagem = p1_2Imagem;
    //}
  }


  public  void animarArriba() {
    int taxaFrames =4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }

      switch(frame) {
      case 1: 
        this.imagen=this.imagenes.get(0);
        break;
      case 2: 
        this.imagen=this.imagenes.get(1);
        break;
      case 3: 
        this.imagen=this.imagenes.get(2);
        break;
      case 4: 
        this.imagen=this.imagenes.get(3);
        break;
      case 5: 
        this.imagen=this.imagenes.get(4);
        break;
      case 6: 
        this.imagen=this.imagenes.get(5);
        break;
      case 7: 
        this.imagen=this.imagenes.get(6);
        break;
      case 8: 
        this.imagen=this.imagenes.get(7);
        break;
      case 9: 
        this.imagen=this.imagenes.get(8);
        break;
      }
    }
  }

  public void animarIzquierda() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }

      switch(frame) {
      case 1: 
        this.imagen=this.imagenes.get(9);
        break;
      case 2: 
        this.imagen=this.imagenes.get(10);
        break;
      case 3: 
        this.imagen=this.imagenes.get(11);
        break;
      case 4: 
        this.imagen=this.imagenes.get(12);
        break;
      case 5: 
        this.imagen=this.imagenes.get(13);
        break;
      case 6: 
        this.imagen=this.imagenes.get(14);
        break;
      case 7: 
        this.imagen=this.imagenes.get(15);
        break;
      case 8: 
        this.imagen=this.imagenes.get(16);
        break;
      case 9: 
        this.imagen=this.imagenes.get(17);
        break;
      }
    }
  }


  public  void animarAbajo() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }

      switch(frame) {
      case 1: 
        this.imagen=this.imagenes.get(18);
        break;
      case 2: 
        this.imagen=this.imagenes.get(19);
        break;
      case 3: 
        this.imagen=this.imagenes.get(20);
        break;
      case 4: 
        this.imagen=this.imagenes.get(21);
        break;
      case 5: 
        this.imagen=this.imagenes.get(22);
        break;
      case 6: 
        this.imagen=this.imagenes.get(23);
        break;
      case 7: 
        this.imagen=this.imagenes.get(24);
        break;
      case 8: 
        this.imagen=this.imagenes.get(25);
        break;
      case 9: 
        this.imagen=this.imagenes.get(26);
        break;
      }
    }
  }


  public  void animarDerecha() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }
      switch(frame) {
      case 1: 
        this.imagen=this.imagenes.get(27);
        break;
      case 2: 
        this.imagen=this.imagenes.get(28);
        break;
      case 3: 
        this.imagen=this.imagenes.get(29);
        break;
      case 4: 
        this.imagen=this.imagenes.get(30);
        break;
      case 5: 
        this.imagen=this.imagenes.get(31);
        break;
      case 6: 
        this.imagen=this.imagenes.get(32);
        break;
      case 7: 
        this.imagen=this.imagenes.get(33);
        break;
      case 8: 
        this.imagen=this.imagenes.get(34);
        break;
      case 9: 
        this.imagen=this.imagenes.get(35);
        break;
      }
    }
  }


  public void girar() {
    this.mover();
    this.paraDiseniar();
  }

  public void serEmpurrado(Entidad otro, float fuerza) {
    this.recibeDanio = true;
    String side;
    if (this.posicion.x > 0 && this.posicion.x < anchoJuego && this.posicion.y > 0 && this.posicion.y < alturaJuego) {

      side = chocarLado(this, otro);
      if (side == "DERECHA") {
        this.posicion.x -= fuerza;
      } else if (side == "IZQUIERDA") {
        this.posicion.x += fuerza;
      } else if (side == "ABAJO") {
        this.posicion.y -= fuerza;
      } else if (side == "ARRIBA") {
        this.posicion.y += fuerza;
      }
    }
  }


  //----------- METODOS ACCESORES------//

  public  void izquierda(boolean pressionando) {
    this.wasd[1] = pressionando;
  }

  public void derecha(boolean pressionando) {
    this.wasd[3] = pressionando;
  }

  //Eixo Y Ativador
  public void arriba(boolean pressionando) {
    this.wasd[0] = pressionando;
  }

  public void abajo(boolean pressionando) {
    this.wasd[2] = pressionando;
  }
}
