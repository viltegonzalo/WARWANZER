/*
FUNDAMETO DE PROGRAMACION ORIENTADO OBJETOS
 FACULTAD DE INGENIERIA - TECNICATURA EN DISEÑO DE VIDEO JUEGOS
 PROYECTO: JUEGO WAR-WANZER
 
 - CARDOZO, Karen Yanina
 - VILTE, Gonzalo Fabian
 - SARAVIA,Maximiliano Leonel
 - MELO, Joaquin Alejandro
 - RODRIGUEZ, Santiago Agustin
 - MERCADO,Alejandro Samuel
 */
import processing.video.*;
Pantalla pantallaPrincipal;
VideoPlayer intro;
VideoPlayer creditos;

boolean estadoPantalla=true;
///////////VARIABLES DEL JUEGO////////////////
MusicPlayer ost1;
MusicPlayer ost2;
MusicPlayer ost3;
MusicPlayer ost4;
MusicPlayer ostGameOver;
MusicPlayer sfxGun;
ArrayList<Item> items= new ArrayList();
ArrayList<Enemigo> enemigos = new ArrayList<Enemigo>();
ArrayList<Proyectil> balas = new ArrayList();
ArrayList<ObjetoLimitante> limites = new ArrayList();

Jugador jugador1;
BarraEstado barra;
Nivel nivel1;
Nivel nivel2;
Nivel nivel3;
Nivel nivel4;
//F_Mira

//ITEM
int anchoJuego;
int alturaJuego;
int balasRevolver ;
int monedas = 50;
//int balasMetraladora = 0;
IntList balasPerdidas = new IntList();//F_Miras
int enemigosMuertos=0;//F_Miras
int puntos;//F_Miras
int fase = 1, proximaFase = 8, tazaEnemigo = round(fase/4)+1, tiempoAparicionEnemigo = 10;//F_Miras
int objetoLimiteRestantes = 0;//BARRA DE ESTADO
int inventario = 1;//BARRA DE ESTADO
int fps = 60;//PRINCIPAL
int numEnemigos =8;//PRINCIPAL
int limiteCajas = 150;//PRINCIPAL
boolean pause = false;
boolean debug = false;//BARRA DE ESTADO
boolean gameOver = false;//BARRA DE ESTADO
boolean construir = false;
//////////////////////////////////////////////


void setup() {
  frameRate(fps);
  size(1000, 700);

  anchoJuego = width;
  alturaJuego = height - 50;    
  intro=new VideoPlayer(new Movie(this, PATH_VIDEO_INTRO), width, height);  
  //creditos=new VideoPlayer(new Movie(this, PATH_VIDEO_CREDITOS), width, height);

  //video_intro=new Movie (this, PATH_VIDEO_INTRO);
  //video_credito=new Movie (this, PATH_VIDEO_CREDITOS);
  //video_intro.play();
  //video_credito.play();


  pantallaPrincipal= new Pantalla(3);
  ////////SETUP DEL JUEGO//////////////////
  barra = new BarraEstado();
  ost1=new MusicPlayer(new Minim(this), PATH_MUSICA_FONDO+(int)random(0, 12)+".mp3");
  ost2=new MusicPlayer(new Minim(this), PATH_MUSICA_FONDO+(int)random(0, 12)+".mp3");
  ost3=new MusicPlayer(new Minim(this), PATH_MUSICA_FONDO+(int)random(0, 12)+".mp3");
  ost4=new MusicPlayer(new Minim(this), PATH_MUSICA_FONDO+(int)random(0, 12)+".mp3");
  ost1.getMusic().setVolume(0.5);
  ost2.getMusic().setVolume(0.5);
  ost3.getMusic().setVolume(0.5);
  ost4.getMusic().setVolume(0.5);
  ostGameOver=new MusicPlayer(new Minim(this), PATH_MUSICA_GAMEROVER);
  sfxGun=new MusicPlayer(new Minim(this), PATH_SFX_GUN);
  nivel1=new Nivel(1, 8, ost1);
  nivel2=new Nivel(2, 8, ost2);
  nivel3=new Nivel(3, 8, ost3);
  nivel4=new Nivel(3, 8, ost4);
  /*JUGADOR*/
  jugador1 = new Jugador();
  barra.setJugador(jugador1);
  /////////////////////////////////////////////////
}

void draw() {
  /////////////////////INICIO DEL JUEGO/////////////////////
  if (intro.isFinishMovie()) {
    if (estadoPantalla) pantallaPrincipal. display();


    if (pantallaPrincipal.getBtns().get(0).getClick()) {
      estadoPantalla=false;


      if (pause == false) {
        switch(fase) {
        case 1: 
          nivel1.displayNivel();
          limites=new ArrayList<ObjetoLimitante>();
          limites=nivel1.getLimites();
          for (int i=0; i<nivel1.getListEne().size(); i++) {
            Enemigo generar=  nivel1.getListEne().get(i);
            generar.cadaEnemigo(nivel1.getListEne());
          }

          frames(nivel1.getListEne());
          cadaBala(nivel1.getListEne());

          break;
        case 2:
          nivel1.getMusic().stopMusic();
          nivel2.displayNivel();
          limites=new ArrayList<ObjetoLimitante>();
          limites=nivel2.getLimites();
          for (int i=0; i<nivel2.getListEne().size(); i++) {     
            Enemigo generar=  nivel2.getListEne().get(i);
            generar.cadaEnemigo(nivel2.getListEne());
          }

          frames(nivel2.getListEne());
          cadaBala(nivel2.getListEne());
          break;
        case 3:
          nivel2.getMusic().stopMusic();        
          nivel3.displayNivel();
          limites=new ArrayList<ObjetoLimitante>();
          limites=nivel3.getLimites();
          for (int i=0; i<nivel3.getListEne().size(); i++) {
            Enemigo generar=  nivel3.getListEne().get(i);
            generar.cadaEnemigo(nivel3.getListEne());
          }

          frames(nivel3.getListEne());
          cadaBala(nivel3.getListEne());//F_Mira
          break;
        case 4:
          nivel3.getMusic().stopMusic();        
          nivel4.displayNivel();
          limites=new ArrayList<ObjetoLimitante>();
          limites=nivel4.getLimites();
          for (int i=0; i<nivel4.getListEne().size(); i++) {
            Enemigo generar=  nivel4.getListEne().get(i);
            generar.cadaEnemigo(nivel4.getListEne());
          }

          frames(nivel4.getListEne());
          cadaBala(nivel4.getListEne());//F_Mira
          break;
        default: 
          fase=1;
          break;
        }
        jugador1.girar();
        cadaItem();
        //MIRA
        mira();
        //Barra de Vida del Jugador
        barra.barraDeVida(jugador1);
        //Barra de Estado
        //barraDeEstado();
        barra.display();

        //GAMER OVER
        if (jugador1.vida<=0) {
          barra.gameOver();
        }
      } else {
        barra.tienda();
      }
    }
  } else if (VIDEO_INTRO) intro.moviePlay(); ///Reproduce el video INTRO

  ///////////////////////////////////////////////////////////////////////








  //if (estadoPantalla) {
  //  pantallaPrincipal. display();
  //  if (pantallaPrincipal.getBtns().get(0).getClick()) {
  //    estadoPantalla=false;
  //    println("ENTRO AL JUEGO");
  //  }
  //  //if (pantallaPrincipal.getBtns().get(1).mouseDragged()==2) {
  //  //  creditos.moviePlay();
  //  //  noLoop();
  //  //}

  //  //    if (pantallaPrincipal.getBtns().get(2).mouseDragged()==3) {
  //  //      noLoop();
  //  //    }
  //}







  /////////////////////INICIO DEL JUEGO/////////////////////
  //if (intro.isFinishMovie()) {
  //  if (pause == false) {
  //    switch(fase) {
  //    case 1: 
  //      nivel1.displayNivel();
  //      limites=new ArrayList<ObjetoLimitante>();
  //      limites=nivel1.getLimites();
  //      for (int i=0; i<nivel1.getListEne().size(); i++) {
  //        Enemigo generar=  nivel1.getListEne().get(i);
  //        generar.cadaEnemigo(nivel1.getListEne());
  //      }

  //      frames(nivel1.getListEne());
  //      cadaBala(nivel1.getListEne());

  //      break;
  //    case 2:
  //      nivel1.getMusic().stopMusic();
  //      nivel2.displayNivel();
  //      limites=new ArrayList<ObjetoLimitante>();
  //      limites=nivel2.getLimites();
  //      for (int i=0; i<nivel2.getListEne().size(); i++) {     
  //        Enemigo generar=  nivel2.getListEne().get(i);
  //        generar.cadaEnemigo(nivel2.getListEne());
  //      }

  //      frames(nivel2.getListEne());
  //      cadaBala(nivel2.getListEne());
  //      break;
  //    case 3:
  //      nivel2.getMusic().stopMusic();        
  //      nivel3.displayNivel();
  //      limites=new ArrayList<ObjetoLimitante>();
  //      limites=nivel3.getLimites();
  //      for (int i=0; i<nivel3.getListEne().size(); i++) {
  //        Enemigo generar=  nivel3.getListEne().get(i);
  //        generar.cadaEnemigo(nivel3.getListEne());
  //      }

  //      frames(nivel3.getListEne());
  //      cadaBala(nivel3.getListEne());//F_Mira
  //      break;
  //    case 4:
  //      nivel3.getMusic().stopMusic();        
  //      nivel4.displayNivel();
  //      limites=new ArrayList<ObjetoLimitante>();
  //      limites=nivel4.getLimites();
  //      for (int i=0; i<nivel4.getListEne().size(); i++) {
  //        Enemigo generar=  nivel4.getListEne().get(i);
  //        generar.cadaEnemigo(nivel4.getListEne());
  //      }

  //      frames(nivel4.getListEne());
  //      cadaBala(nivel4.getListEne());//F_Mira
  //      break;
  //    default: 
  //      fase=1;
  //      break;
  //    }
  //    jugador1.girar();
  //    cadaItem();
  //    //MIRA
  //    mira();
  //    //Barra de Vida del Jugador
  //    barra.barraDeVida(jugador1);
  //    //Barra de Estado
  //    //barraDeEstado();
  //    barra.display();

  //    //GAMER OVER
  //    if (jugador1.vida<=0) {
  //      barra.gameOver();
  //    }
  //  } else {
  //    barra.tienda();
  //  }

  //} else if (VIDEO_INTRO) intro.moviePlay(); ///Reproduce el video INTRO

  ///////////////////////////////////////////////////////////////////////
}

void keyPressed() {
  println(keyCode);
  if (pause == false) {
    boolean presionado = true;
    //Eixo X
    if (keyCode == 65 || keyCode == 37) {
      jugador1.izquierda(presionado);
    } else if (keyCode == 68 || keyCode == 39) {
      jugador1.derecha(presionado);
    }
    //Eixo Y
    if (keyCode == 87 || keyCode == 38) {
      jugador1.arriba(presionado);
    } else if (keyCode == 83 || keyCode == 40) {
      jugador1.abajo(presionado);
    }   
    //Debug
    if (keyCode == 114) {
      if (debug == true) {
        debug = false;
      } else {
        debug = true;
      }
    }
  }
  //Atajos
  if (keyCode == 32) {//TECLA BARRA ESPACIADORA
    if (pause == true) {
      pause = false;
    } else {
      pause = true;
    }
  }
}
void keyReleased() {
  if (pause == false) {
    boolean presionado = false;
    //EJES X
    if (keyCode == 65 || keyCode == 37) {
      jugador1.izquierda(presionado);
    } else if (keyCode == 68 || keyCode == 39) {
      jugador1.derecha(presionado);
    }
    //EJE Y
    if (keyCode == 87 || keyCode == 38) {
      jugador1.arriba(presionado);
    } else if (keyCode == 83 || keyCode == 40) {
      jugador1.abajo(presionado);
    }
  }
}

void mousePressed() {
  if (pause == false) {
    sfxGun.playMusic();
    if (mouseButton == 37 && balasRevolver > 0 && inventario == 1) {
      balas.add(new Proyectil(jugador1));
      balasRevolver--;
    }
    if (mouseButton == 39 && construir == true && objetoLimiteRestantes> 0) {
      boolean chocarCaja = false, chocarJugador = false, chocarEnemigo = false;
      //Chocar Jugador
      chocarJugador = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, jugador1.posicion.x, jugador1.posicion.y, jugador1.ancho, jugador1.altura);

      //Chocar Caja
      if (chocarJugador == false) {
        for (int i=0; i<limites.size(); i++) {
          chocarCaja = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, limites.get(i).posicion.x, limites.get(i).posicion.y, limites.get(i).ancho, limites.get(i).altura);
          if (chocarCaja == true || chocarJugador == true) {
            break;
          }
        }
      }
      //Chocar Enemigo
      /*
if(chocarJugador == false && chocarCaja == false){
       for(int i=0; i<enemigos.size(); i++){
       chocarEnemigo = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, enemigos.get(i).posicion.x, enemigos.get(i).posicion.y, enemigos.get(i).ancho, enemigos.get(i).altura);
       if(chocarEnemigo == true || chocarJugador == true){
       break;
       }
       }
       }*/
      if (chocarJugador == false && chocarCaja == false) {
        for (int i=0; i<nivel1.getListEne().size(); i++) {
          chocarEnemigo = chocarRect(mouseX-((mouseX-16)%32)-6, mouseY-((mouseY-16)%32)-6, 32, 32, nivel1.getListEne().get(i).posicion.x, nivel1.getListEne().get(i).posicion.y, nivel1.getListEne().get(i).ancho, nivel1.getListEne().get(i).altura);
          if (chocarEnemigo == true || chocarJugador == true) {
            break;
          }
        }
      }
      //Crear Caja VER AQUI
      if (chocarCaja == false && chocarJugador == false && chocarEnemigo == false && mouseX < anchoJuego-10 && mouseY < alturaJuego-10 && limites.size() < limiteCajas) {
        limites.add(new ObjetoLimitante());
        objetoLimiteRestantes-= 1;
      }
    }
  } else {
    if (mouseButton == 37) {
      boolean chocarBtn1 = colisionPunto(mouseX, mouseY, barra.getB1().get(0), barra.getB1().get(1), barra.getB1().get(2), barra.getB1().get(3));
      boolean chocarBtn2 = colisionPunto(mouseX, mouseY, barra.getB2().get(0), barra.getB2().get(1), barra.getB2().get(2), barra.getB2().get(3));
      boolean chocarBtn3 = colisionPunto(mouseX, mouseY, barra.getB3().get(0), barra.getB3().get(1), barra.getB3().get(2), barra.getB3().get(3));
      //boolean chocarBtn4 = colisionPunto(mouseX, mouseY, barra.getB4().get(0), barra.getB4().get(1), barra.getB4().get(2), barra.getB4().get(3));
      if (chocarBtn1 && monedas >= 10) {
        //objetoLimiteRestantes += 5;
        //monedas -= 10;
      } else if (chocarBtn2 && monedas >= 10) {
        balasRevolver += 16;
        monedas -= 10;
      } else if (chocarBtn3 && monedas >= 25 && jugador1.vida < 10) {
        jugador1.vida = 10;
        monedas -= 25;
      }
      // else if (chocarBtn4 && monedas >= 100) {
      //  jugador1.vida = 10;
      //  monedas -= 25;
      //}
    }
  }
}
public void cadaItem() {
  boolean chocarJugador = false;
  for (int i=0; i<items.size(); i++) {

    //boolean collideCaixa = false;
    //for(int ii=0; ii<caixas.size(); ii++){
    //  collideCaixa = collideRect(itens.get(i), caixas.get(ii));
    //  if(collideCaixa == true){
    //    itens.get(i).sobrepondo();
    //  }
    //}

    //Contador Tiempo de Vida
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
