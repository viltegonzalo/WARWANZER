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

  //Atributos
  private boolean[] wasd = {false, false, false, false};
  private float velocidadX;
  private float velocidadY;
  private float velocidadMax;
  private float velocidadMin;
  private float aceleracion;
  private float desaceleracion;
  private int frame;

  //Construtor
  public Jugador() {
    this.ancho = 35;
    this.altura = 40;
    this.aceleracion = 0.4;
    this.desaceleracion = 0.2;
    this.velocidadX = 0;
    this.velocidadY = 0;
    this.velocidadMax = 2;
    this.velocidadMin = 0.2;
    this.fuerza = 10;
    this.imagen = p1_1Imagem;
    this.frame = 1;
    this.vida = 15;
  }

  //Metodos
   void paraDiseniar() {
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
  void moverIzquierda() {
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

  void moverDerecha() {
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
  void moverArriba() {
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
  void desaceleracionY() {
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

  //ACTIVADORES DE DIRECCION
  //EJE X ACTIVADOR
  void izquierda(boolean pressionando) {
    this.wasd[1] = pressionando;
  }

  void derecha(boolean pressionando) {
    this.wasd[3] = pressionando;
  }

  //Eixo Y Ativador
  void arriba(boolean pressionando) {
    this.wasd[0] = pressionando;
  }

  void abajo(boolean pressionando) {
    this.wasd[2] = pressionando;
  }

  void chequearPosicion() {
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

  void animar() {
    int taxaFrames = 9;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 2) {
        this.frame = 1;
      }
    }



    if (this.frame == 1) {
      this.imagen = p1_1Imagem;
    }
    //else{
    //  this.imagem = p1_2Imagem;
    //}
  }


  //NUEVO DE LOS CHICOS
  void animarArriba() {
    int taxaFrames =4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }
      if (frame== 1) {
        this.imagen = p1_1Imagem;
      } 
      if (frame==2) { 
        this.imagen = p1_2Imagem;
      }
      if (frame==3) { 
        this.imagen = p1_3Imagem;
      }
      if (frame==4) { 
        this.imagen = p1_4Imagem;
      }
      if (frame==5) { 
        this.imagen = p1_5Imagem;
      }
      if (frame==6) { 
        this.imagen = p1_6Imagem;
      }
      if (frame==7) { 
        this.imagen = p1_7Imagem;
      }
      if (frame==8) { 
        this.imagen = p1_8Imagem;
      }
      if (frame==9) { 
        this.imagen = p1_9Imagem;
      }
    }
  }
  void animarIzquierda() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }
      if (frame== 1) {
        this.imagen = p1_10Imagem;
      } 
      if (frame==2) { 
        this.imagen = p1_11Imagem;
      }
      if (frame==3) { 
        this.imagen = p1_12Imagem;
      }
      if (frame==4) { 
        this.imagen = p1_13Imagem;
      }
      if (frame==5) { 
        this.imagen = p1_14Imagem;
      }
      if (frame==6) { 
        this.imagen = p1_15Imagem;
      }
      if (frame==7) { 
        this.imagen = p1_16Imagem;
      }
      if (frame==8) { 
        this.imagen = p1_17Imagem;
      }
      if (frame==9) { 
        this.imagen = p1_18Imagem;
      }
    }
  }


  void animarAbajo() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }
      if (frame== 1) {
        this.imagen = p1_19Imagem;
      } 
      if (frame==2) { 
        this.imagen = p1_20Imagem;
      }
      if (frame==3) { 
        this.imagen = p1_21Imagem;
      }
      if (frame==4) { 
        this.imagen = p1_22Imagem;
      }
      if (frame==5) { 
        this.imagen = p1_23Imagem;
      }
      if (frame==6) { 
        this.imagen = p1_24Imagem;
      }
      if (frame==7) { 
        this.imagen = p1_25Imagem;
      }
      if (frame==8) { 
        this.imagen = p1_26Imagem;
      }
      if (frame==9) { 
        this.imagen = p1_27Imagem;
      }
    }
  }


  void animarDerecha() {
    int taxaFrames = 4;
    if (frameCount % taxaFrames == 0) {
      this.frame++;
      if (this.frame > 10) {
        this.frame = 1;
      }
      if (frame== 1) {
        this.imagen = p1_28Imagem;
      } 
      if (frame==2) { 
        this.imagen = p1_29Imagem;
      }
      if (frame==3) { 
        this.imagen = p1_30Imagem;
      }
      if (frame==4) { 
        this.imagen = p1_31Imagem;
      }
      if (frame==5) { 
        this.imagen = p1_32Imagem;
      }
      if (frame==6) { 
        this.imagen = p1_33Imagem;
      }
      if (frame==7) { 
        this.imagen = p1_34Imagem;
      }
      if (frame==8) { 
        this.imagen = p1_35Imagem;
      }
      if (frame==9) { 
        this.imagen = p1_36Imagem;
      }
    }
  }

  //NUEVO DE LOS CHICOS










  void girar() {
    this.mover();
    this.paraDiseniar();
  }

  void serEmpurrado(Entidad otro, float fuerza) {
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
}
