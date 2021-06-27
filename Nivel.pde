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
import ddf.minim.*;


class Nivel {

  private PImage fondo;
  private ArrayList<Enemigo> enemigos;
  private ArrayList<ObjetoLimitante> limites;
  private MusicPlayer music;
  private int cantEnemigo;
  private int id;

  /**Construtor parametrizado*/
  public Nivel(int nivel, String path, int cantEne) {
    this.enemigos=new ArrayList<Enemigo>();
    this.limites=new ArrayList<ObjetoLimitante>();
    
    this.generarLimites(nivel);
    this.cantEnemigo=cantEne;
    this.id=nivel;
    this.fondo=loadImage(path);
    this.fondo.resize(width, height);

    for (int i=0; i<cantEne; i++) {
      this.enemigos.add(new Enemigo());
    }
  }
  public Nivel(int nivel, String path, int cantEne, MusicPlayer music) {  
    this.enemigos=new ArrayList<Enemigo>();
    this.limites=new ArrayList<ObjetoLimitante>();
    
    this.generarLimites(nivel);
    this.cantEnemigo=cantEne;
    this.id=nivel;
    this.fondo=loadImage(path);
    this.fondo.resize(width, height);

    this.music=music;

    for (int i=0; i<cantEne; i++) {
      this.enemigos.add(new Enemigo());
    }
  }

  //----------- METODOS ACCESORES------//
  public ArrayList<ObjetoLimitante> getLimites() {
    return this.limites;
  }
  public ArrayList<Enemigo> getListEne() {
    return this.enemigos;
  }
  public PImage getFondo() {
    return this.fondo;
  }
  public int getCantEnemigo() {
    return this.cantEnemigo;
  }
  public int getId() {
    return this.id;
  }
  public MusicPlayer getMusic() {
    return this.music;
  }

  //---------ZONA METODOS------//
  public void displayNivel() {
    if (MUSICA_FONDO)
      this.music.playMusic();
    background(this.fondo);
    comprobarLimites();
  }

  public void comprobarLimites(){
    for (int i=0; i<this.limites.size(); i++) {
      ObjetoLimitante generar= this.limites .get(i);
      generar.cadaCaja();
      generar.grade();
    }
  }

  public void generarLimites(int nivel) {
    switch(nivel) {
    case 1: 
      this.limites.add(new ObjetoLimitante(295,160));this.limites.add(new ObjetoLimitante(458,58));this.limites.add(new ObjetoLimitante(373,608));
      this.limites.add(new ObjetoLimitante(434,67));this.limites.add(new ObjetoLimitante(490,38));this.limites.add(new ObjetoLimitante(515,23));
      this.limites.add(new ObjetoLimitante(543,5));this.limites.add(new ObjetoLimitante(574,-7));this.limites.add(new ObjetoLimitante(605,-11));
      this.limites.add(new ObjetoLimitante(403,79));this.limites.add(new ObjetoLimitante(379,91));this.limites.add(new ObjetoLimitante(352,107));
      this.limites.add(new ObjetoLimitante(310,135));this.limites.add(new ObjetoLimitante(321,191));this.limites.add(new ObjetoLimitante(328,216));
      this.limites.add(new ObjetoLimitante(327,241));this.limites.add(new ObjetoLimitante(324,271));this.limites.add(new ObjetoLimitante(321,316));
      this.limites.add(new ObjetoLimitante(304,256));this.limites.add(new ObjetoLimitante(289,245));this.limites.add(new ObjetoLimitante(274,238));
      this.limites.add(new ObjetoLimitante(258,228));this.limites.add(new ObjetoLimitante(235,222));this.limites.add(new ObjetoLimitante(203,212));
      this.limites.add(new ObjetoLimitante(181,213));this.limites.add(new ObjetoLimitante(158,224));this.limites.add(new ObjetoLimitante(142,231));
      this.limites.add(new ObjetoLimitante(125,240));this.limites.add(new ObjetoLimitante(109,249));this.limites.add(new ObjetoLimitante(89,265));
      this.limites.add(new ObjetoLimitante(88,293));this.limites.add(new ObjetoLimitante(60,305));this.limites.add(new ObjetoLimitante(39,317));
      this.limites.add(new ObjetoLimitante(17,329));this.limites.add(new ObjetoLimitante(0,341));this.limites.add(new ObjetoLimitante(251,639));
      this.limites.add(new ObjetoLimitante(275,637));this.limites.add(new ObjetoLimitante(569,639));this.limites.add(new ObjetoLimitante(334,617));
      this.limites.add(new ObjetoLimitante(291,616));this.limites.add(new ObjetoLimitante(399,596));this.limites.add(new ObjetoLimitante(414,585));
      this.limites.add(new ObjetoLimitante(439,583));this.limites.add(new ObjetoLimitante(468,579));this.limites.add(new ObjetoLimitante(483,588));
      this.limites.add(new ObjetoLimitante(493,599));this.limites.add(new ObjetoLimitante(504,612));this.limites.add(new ObjetoLimitante(534,638));
      this.limites.add(new ObjetoLimitante(556,642));this.limites.add(new ObjetoLimitante(581,640));this.limites.add(new ObjetoLimitante(608,637));
      this.limites.add(new ObjetoLimitante(628,628));this.limites.add(new ObjetoLimitante(640,610));this.limites.add(new ObjetoLimitante(649,589));
      this.limites.add(new ObjetoLimitante(653,570));this.limites.add(new ObjetoLimitante(682,567));this.limites.add(new ObjetoLimitante(711,564));
      this.limites.add(new ObjetoLimitante(741,561));this.limites.add(new ObjetoLimitante(770,560));this.limites.add(new ObjetoLimitante(797,551));
      this.limites.add(new ObjetoLimitante(821,539));this.limites.add(new ObjetoLimitante(843,545));this.limites.add(new ObjetoLimitante(866,554));
      this.limites.add(new ObjetoLimitante(894,553));this.limites.add(new ObjetoLimitante(917,562));this.limites.add(new ObjetoLimitante(944,562));
      this.limites.add(new ObjetoLimitante(963,556));this.limites.add(new ObjetoLimitante(973,543));this.limites.add(new ObjetoLimitante(984,528));
      this.limites.add(new ObjetoLimitante(993,503));this.limites.add(new ObjetoLimitante(978,454));this.limites.add(new ObjetoLimitante(971,431));
      this.limites.add(new ObjetoLimitante(986,476));this.limites.add(new ObjetoLimitante(990,420));this.limites.add(new ObjetoLimitante(977,53));
      this.limites.add(new ObjetoLimitante(964,58));this.limites.add(new ObjetoLimitante(950,69));this.limites.add(new ObjetoLimitante(955,82));
      this.limites.add(new ObjetoLimitante(967,91));this.limites.add(new ObjetoLimitante(978,104));this.limites.add(new ObjetoLimitante(82,466));
      this.limites.add(new ObjetoLimitante(72,478));this.limites.add(new ObjetoLimitante(99,475));this.limites.add(new ObjetoLimitante(227,387));
      this.limites.add(new ObjetoLimitante(218,397));this.limites.add(new ObjetoLimitante(227,412));this.limites.add(new ObjetoLimitante(240,395));
      this.limites.add(new ObjetoLimitante(244,415));this.limites.add(new ObjetoLimitante(325,507));this.limites.add(new ObjetoLimitante(317,518));
      this.limites.add(new ObjetoLimitante(327,526));this.limites.add(new ObjetoLimitante(332,515));this.limites.add(new ObjetoLimitante(339,524));
      this.limites.add(new ObjetoLimitante(574,543));this.limites.add(new ObjetoLimitante(582,549));this.limites.add(new ObjetoLimitante(564,549));
      this.limites.add(new ObjetoLimitante(564,562));this.limites.add(new ObjetoLimitante(578,568));this.limites.add(new ObjetoLimitante(591,560));
      this.limites.add(new ObjetoLimitante(550,411));this.limites.add(new ObjetoLimitante(542,419));this.limites.add(new ObjetoLimitante(561,421));
      this.limites.add(new ObjetoLimitante(542,428));this.limites.add(new ObjetoLimitante(562,430));this.limites.add(new ObjetoLimitante(479,216));
      this.limites.add(new ObjetoLimitante(491,227));this.limites.add(new ObjetoLimitante(468,225));this.limites.add(new ObjetoLimitante(462,316));
      this.limites.add(new ObjetoLimitante(454,326));this.limites.add(new ObjetoLimitante(472,327));this.limites.add(new ObjetoLimitante(466,341));
      this.limites.add(new ObjetoLimitante(704,393));this.limites.add(new ObjetoLimitante(696,402));this.limites.add(new ObjetoLimitante(717,402));
      this.limites.add(new ObjetoLimitante(709,415));this.limites.add(new ObjetoLimitante(807,333));this.limites.add(new ObjetoLimitante(819,346));
      this.limites.add(new ObjetoLimitante(801,341));this.limites.add(new ObjetoLimitante(827,242));this.limites.add(new ObjetoLimitante(838,250));
      this.limites.add(new ObjetoLimitante(818,253));this.limites.add(new ObjetoLimitante(831,264));this.limites.add(new ObjetoLimitante(723,187));
      this.limites.add(new ObjetoLimitante(714,199));this.limites.add(new ObjetoLimitante(739,202));this.limites.add(new ObjetoLimitante(569,126));
      this.limites.add(new ObjetoLimitante(562,135));this.limites.add(new ObjetoLimitante(579,136));this.limites.add(new ObjetoLimitante(574,146));
      this.limites.add(new ObjetoLimitante(676,28));this.limites.add(new ObjetoLimitante(667,39));this.limites.add(new ObjetoLimitante(689,38));
      this.limites.add(new ObjetoLimitante(682,50));this.limites.add(new ObjetoLimitante(911,456));this.limites.add(new ObjetoLimitante(918,462));
      this.limites.add(new ObjetoLimitante(902,463));this.limites.add(new ObjetoLimitante(911,480));this.limites.add(new ObjetoLimitante(896,97));
      this.limites.add(new ObjetoLimitante(890,109));this.limites.add(new ObjetoLimitante(909,109));this.limites.add(new ObjetoLimitante(709,415));
      this.limites.add(new ObjetoLimitante(807,333));this.limites.add(new ObjetoLimitante(819,346));this.limites.add(new ObjetoLimitante(801,341));
      this.limites.add(new ObjetoLimitante(827,242));this.limites.add(new ObjetoLimitante(838,250));this.limites.add(new ObjetoLimitante(818,253));
      this.limites.add(new ObjetoLimitante(831,264));this.limites.add(new ObjetoLimitante(723,187));this.limites.add(new ObjetoLimitante(714,199));
      this.limites.add(new ObjetoLimitante(739,202));this.limites.add(new ObjetoLimitante(569,126));this.limites.add(new ObjetoLimitante(562,135));
      this.limites.add(new ObjetoLimitante(579,136));this.limites.add(new ObjetoLimitante(574,146));this.limites.add(new ObjetoLimitante(676,28));
      this.limites.add(new ObjetoLimitante(667,39));this.limites.add(new ObjetoLimitante(689,38));this.limites.add(new ObjetoLimitante(682,50));  
      break;
    case 2: 
      this.limites.add(new ObjetoLimitante(962,114));this.limites.add(new ObjetoLimitante(935,125));this.limites.add(new ObjetoLimitante(908,139));
      this.limites.add(new ObjetoLimitante(519,651));this.limites.add(new ObjetoLimitante(553,632));this.limites.add(new ObjetoLimitante(794,152));
      this.limites.add(new ObjetoLimitante(794,181));this.limites.add(new ObjetoLimitante(771,193));this.limites.add(new ObjetoLimitante(750,205));
      this.limites.add(new ObjetoLimitante(729,218));this.limites.add(new ObjetoLimitante(709,232));this.limites.add(new ObjetoLimitante(687,241));
      this.limites.add(new ObjetoLimitante(665,235));this.limites.add(new ObjetoLimitante(642,223));this.limites.add(new ObjetoLimitante(619,211));
      this.limites.add(new ObjetoLimitante(596,200));this.limites.add(new ObjetoLimitante(574,190));this.limites.add(new ObjetoLimitante(553,180));
      /////////////////
      this.limites.add(new ObjetoLimitante(531,169));this.limites.add(new ObjetoLimitante(508,201));this.limites.add(new ObjetoLimitante(508,229));
      this.limites.add(new ObjetoLimitante(12,169));this.limites.add(new ObjetoLimitante(37,181));this.limites.add(new ObjetoLimitante(59,195));
      this.limites.add(new ObjetoLimitante(81,204));this.limites.add(new ObjetoLimitante(102,216));this.limites.add(new ObjetoLimitante(121,230));
      this.limites.add(new ObjetoLimitante(143,237));this.limites.add(new ObjetoLimitante(164,251));this.limites.add(new ObjetoLimitante(186,259));
      this.limites.add(new ObjetoLimitante(207,266));this.limites.add(new ObjetoLimitante(230,275));this.limites.add(new ObjetoLimitante(252,286));
      this.limites.add(new ObjetoLimitante(274,295));this.limites.add(new ObjetoLimitante(297,306));this.limites.add(new ObjetoLimitante(320,315));
      this.limites.add(new ObjetoLimitante(343,327));this.limites.add(new ObjetoLimitante(366,337));this.limites.add(new ObjetoLimitante(389,351));
      ///////////////
      this.limites.add(new ObjetoLimitante(926,440));this.limites.add(new ObjetoLimitante(905,449));this.limites.add(new ObjetoLimitante(883,460));
      this.limites.add(new ObjetoLimitante(861,470));this.limites.add(new ObjetoLimitante(839,480));this.limites.add(new ObjetoLimitante(817,490));
      this.limites.add(new ObjetoLimitante(797,500));this.limites.add(new ObjetoLimitante(776,514));this.limites.add(new ObjetoLimitante(754,522));
      this.limites.add(new ObjetoLimitante(732,510));this.limites.add(new ObjetoLimitante(711,499));this.limites.add(new ObjetoLimitante(690,490));
      this.limites.add(new ObjetoLimitante(668,480));this.limites.add(new ObjetoLimitante(646,471));this.limites.add(new ObjetoLimitante(624,465));
      /////////////////
      this.limites.add(new ObjetoLimitante(602,457));this.limites.add(new ObjetoLimitante(958,268));this.limites.add(new ObjetoLimitante(937,276));
      this.limites.add(new ObjetoLimitante(916,285));this.limites.add(new ObjetoLimitante(896,296));this.limites.add(new ObjetoLimitante(875,305));
      this.limites.add(new ObjetoLimitante(853,314));this.limites.add(new ObjetoLimitante(831,325));this.limites.add(new ObjetoLimitante(812,335));
      this.limites.add(new ObjetoLimitante(791,347));this.limites.add(new ObjetoLimitante(770,354));this.limites.add(new ObjetoLimitante(750,364));
      this.limites.add(new ObjetoLimitante(728,372));this.limites.add(new ObjetoLimitante(707,380));this.limites.add(new ObjetoLimitante(687,390));
      this.limites.add(new ObjetoLimitante(666,399));this.limites.add(new ObjetoLimitante(646,411));this.limites.add(new ObjetoLimitante(624,420));
      this.limites.add(new ObjetoLimitante(602,430));this.limites.add(new ObjetoLimitante(582,442));this.limites.add(new ObjetoLimitante(510,260));
      this.limites.add(new ObjetoLimitante(509,293));this.limites.add(new ObjetoLimitante(494,314));this.limites.add(new ObjetoLimitante(473,323));
      this.limites.add(new ObjetoLimitante(452,336));this.limites.add(new ObjetoLimitante(431,347));this.limites.add(new ObjetoLimitante(411,360));
      this.limites.add(new ObjetoLimitante(13,306));this.limites.add(new ObjetoLimitante(37,320));this.limites.add(new ObjetoLimitante(60,327));
      this.limites.add(new ObjetoLimitante(83,336));this.limites.add(new ObjetoLimitante(102,349));this.limites.add(new ObjetoLimitante(124,360));
      this.limites.add(new ObjetoLimitante(145,369));this.limites.add(new ObjetoLimitante(167,377));this.limites.add(new ObjetoLimitante(188,387));
      this.limites.add(new ObjetoLimitante(211,392));this.limites.add(new ObjetoLimitante(233,405));this.limites.add(new ObjetoLimitante(232,438));
      this.limites.add(new ObjetoLimitante(211,447));this.limites.add(new ObjetoLimitante(190,453));this.limites.add(new ObjetoLimitante(170,463));
      this.limites.add(new ObjetoLimitante(151,472));this.limites.add(new ObjetoLimitante(131,483));this.limites.add(new ObjetoLimitante(111,490));
      this.limites.add(new ObjetoLimitante(90,500));this.limites.add(new ObjetoLimitante(70,509));this.limites.add(new ObjetoLimitante(50,521));
      this.limites.add(new ObjetoLimitante(29,533));this.limites.add(new ObjetoLimitante(8,542));this.limites.add(new ObjetoLimitante(582,611));
      this.limites.add(new ObjetoLimitante(563,595));this.limites.add(new ObjetoLimitante(540,580));this.limites.add(new ObjetoLimitante(519,570));
      this.limites.add(new ObjetoLimitante(497,560));this.limites.add(new ObjetoLimitante(476,551));this.limites.add(new ObjetoLimitante(73,670));
      this.limites.add(new ObjetoLimitante(96,660));this.limites.add(new ObjetoLimitante(119,648));this.limites.add(new ObjetoLimitante(141,635));
      this.limites.add(new ObjetoLimitante(162,624));this.limites.add(new ObjetoLimitante(185,615));this.limites.add(new ObjetoLimitante(207,605));
      this.limites.add(new ObjetoLimitante(456,539));this.limites.add(new ObjetoLimitante(229,593));this.limites.add(new ObjetoLimitante(251,582));
      this.limites.add(new ObjetoLimitante(273,570));this.limites.add(new ObjetoLimitante(435,527));this.limites.add(new ObjetoLimitante(415,514));
      this.limites.add(new ObjetoLimitante(398,518));this.limites.add(new ObjetoLimitante(378,524));this.limites.add(new ObjetoLimitante(337,544));
      this.limites.add(new ObjetoLimitante(316,551));this.limites.add(new ObjetoLimitante(358,536));this.limites.add(new ObjetoLimitante(295,559)); 
      break;
    case 3: 
      this.limites.add(new ObjetoLimitante(529,84));
      this.limites.add(new ObjetoLimitante(562,85));this.limites.add(new ObjetoLimitante(530,43));this.limites.add(new ObjetoLimitante(564,42));
      this.limites.add(new ObjetoLimitante(264,234));this.limites.add(new ObjetoLimitante(331,232));this.limites.add(new ObjetoLimitante(264,222));
      this.limites.add(new ObjetoLimitante(298,252));this.limites.add(new ObjetoLimitante(274,215));this.limites.add(new ObjetoLimitante(287,209));
      this.limites.add(new ObjetoLimitante(297,201));this.limites.add(new ObjetoLimitante(303,208));this.limites.add(new ObjetoLimitante(279,240));
      this.limites.add(new ObjetoLimitante(289,246));this.limites.add(new ObjetoLimitante(305,239));this.limites.add(new ObjetoLimitante(310,246));
      this.limites.add(new ObjetoLimitante(358,389));this.limites.add(new ObjetoLimitante(343,400));this.limites.add(new ObjetoLimitante(330,409));
      this.limites.add(new ObjetoLimitante(274,215));this.limites.add(new ObjetoLimitante(292,427));this.limites.add(new ObjetoLimitante(279,437));
      this.limites.add(new ObjetoLimitante(264,446));this.limites.add(new ObjetoLimitante(248,452));this.limites.add(new ObjetoLimitante(232,465));
      this.limites.add(new ObjetoLimitante(279,240));this.limites.add(new ObjetoLimitante(289,246));this.limites.add(new ObjetoLimitante(220,470));
      this.limites.add(new ObjetoLimitante(203,477));this.limites.add(new ObjetoLimitante(191,486));this.limites.add(new ObjetoLimitante(178,490));
      this.limites.add(new ObjetoLimitante(402,395));this.limites.add(new ObjetoLimitante(415,402));this.limites.add(new ObjetoLimitante(174,276));
      this.limites.add(new ObjetoLimitante(188,286));this.limites.add(new ObjetoLimitante(201,295));this.limites.add(new ObjetoLimitante(225,309));
      this.limites.add(new ObjetoLimitante(264,315));this.limites.add(new ObjetoLimitante(212,329));this.limites.add(new ObjetoLimitante(196,337));
      this.limites.add(new ObjetoLimitante(169,354));this.limites.add(new ObjetoLimitante(153,364));this.limites.add(new ObjetoLimitante(136,372));
      this.limites.add(new ObjetoLimitante(120,382));this.limites.add(new ObjetoLimitante(89,397));this.limites.add(new ObjetoLimitante(77,406));
      this.limites.add(new ObjetoLimitante(65,413));this.limites.add(new ObjetoLimitante(40,424));this.limites.add(new ObjetoLimitante(147,213));
      this.limites.add(new ObjetoLimitante(156,167));this.limites.add(new ObjetoLimitante(165,154));this.limites.add(new ObjetoLimitante(177,143));
      this.limites.add(new ObjetoLimitante(187,135));this.limites.add(new ObjetoLimitante(233,104));this.limites.add(new ObjetoLimitante(262,87));
      this.limites.add(new ObjetoLimitante(275,80));this.limites.add(new ObjetoLimitante(287,74));this.limites.add(new ObjetoLimitante(302,70));
      this.limites.add(new ObjetoLimitante(332,57));this.limites.add(new ObjetoLimitante(163,225));this.limites.add(new ObjetoLimitante(154,206));
      this.limites.add(new ObjetoLimitante(347,49));this.limites.add(new ObjetoLimitante(365,39));this.limites.add(new ObjetoLimitante(378,34));
      this.limites.add(new ObjetoLimitante(387,22));this.limites.add(new ObjetoLimitante(437,-11));this.limites.add(new ObjetoLimitante(318,139));
      this.limites.add(new ObjetoLimitante(353,145));this.limites.add(new ObjetoLimitante(367,155));this.limites.add(new ObjetoLimitante(380,160));
      this.limites.add(new ObjetoLimitante(384,165));this.limites.add(new ObjetoLimitante(400,165));this.limites.add(new ObjetoLimitante(428,150));
      this.limites.add(new ObjetoLimitante(441,143));this.limites.add(new ObjetoLimitante(455,138));this.limites.add(new ObjetoLimitante(434,129));
      this.limites.add(new ObjetoLimitante(388,150));this.limites.add(new ObjetoLimitante(336,135));this.limites.add(new ObjetoLimitante(451,405));
      this.limites.add(new ObjetoLimitante(472,396));this.limites.add(new ObjetoLimitante(490,387));this.limites.add(new ObjetoLimitante(524,367));
      this.limites.add(new ObjetoLimitante(530,335));this.limites.add(new ObjetoLimitante(564,316));this.limites.add(new ObjetoLimitante(633,331));
      this.limites.add(new ObjetoLimitante(649,320));this.limites.add(new ObjetoLimitante(658,316));this.limites.add(new ObjetoLimitante(676,328));
      this.limites.add(new ObjetoLimitante(689,342));this.limites.add(new ObjetoLimitante(716,381));this.limites.add(new ObjetoLimitante(733,391));
      this.limites.add(new ObjetoLimitante(768,408));this.limites.add(new ObjetoLimitante(780,418));this.limites.add(new ObjetoLimitante(809,433));
      this.limites.add(new ObjetoLimitante(820,447));this.limites.add(new ObjetoLimitante(786,468));this.limites.add(new ObjetoLimitante(776,582));
      this.limites.add(new ObjetoLimitante(760,589));this.limites.add(new ObjetoLimitante(746,599));this.limites.add(new ObjetoLimitante(732,609));
      this.limites.add(new ObjetoLimitante(701,628));this.limites.add(new ObjetoLimitante(371,592));this.limites.add(new ObjetoLimitante(356,583));
      this.limites.add(new ObjetoLimitante(322,565));this.limites.add(new ObjetoLimitante(310,557));this.limites.add(new ObjetoLimitante(294,551));
      this.limites.add(new ObjetoLimitante(280,542));this.limites.add(new ObjetoLimitante(246,523));this.limites.add(new ObjetoLimitante(196,494));
      this.limites.add(new ObjetoLimitante(390,602));this.limites.add(new ObjetoLimitante(406,612));this.limites.add(new ObjetoLimitante(444,632));
      this.limites.add(new ObjetoLimitante(310,510));this.limites.add(new ObjetoLimitante(304,494));this.limites.add(new ObjetoLimitante(531,230));
      this.limites.add(new ObjetoLimitante(537,216));this.limites.add(new ObjetoLimitante(557,206));this.limites.add(new ObjetoLimitante(532,183));
      this.limites.add(new ObjetoLimitante(536,169));this.limites.add(new ObjetoLimitante(592,155));this.limites.add(new ObjetoLimitante(626,156));
      this.limites.add(new ObjetoLimitante(655,153));this.limites.add(new ObjetoLimitante(688,172));this.limites.add(new ObjetoLimitante(688,185));
      this.limites.add(new ObjetoLimitante(682,219));this.limites.add(new ObjetoLimitante(703,228));this.limites.add(new ObjetoLimitante(731,251));
      this.limites.add(new ObjetoLimitante(731,279));this.limites.add(new ObjetoLimitante(591,217));this.limites.add(new ObjetoLimitante(624,212));
      this.limites.add(new ObjetoLimitante(689,254));this.limites.add(new ObjetoLimitante(887,246));;this.limites.add(new ObjetoLimitante(901,312));
      this.limites.add(new ObjetoLimitante(888,326));this.limites.add(new ObjetoLimitante(897,339));this.limites.add(new ObjetoLimitante(919,351));
      this.limites.add(new ObjetoLimitante(940,342));this.limites.add(new ObjetoLimitante(954,334));this.limites.add(new ObjetoLimitante(898,235));
      this.limites.add(new ObjetoLimitante(916,227));this.limites.add(new ObjetoLimitante(922,221));this.limites.add(new ObjetoLimitante(934,229));
      this.limites.add(new ObjetoLimitante(949,238));this.limites.add(new ObjetoLimitante(976,275));this.limites.add(new ObjetoLimitante(708,73));
      this.limites.add(new ObjetoLimitante(742,95));this.limites.add(new ObjetoLimitante(721,56));this.limites.add(new ObjetoLimitante(774,46));
      this.limites.add(new ObjetoLimitante(810,107));this.limites.add(new ObjetoLimitante(827,98));this.limites.add(new ObjetoLimitante(815,133));
      this.limites.add(new ObjetoLimitante(834,146));this.limites.add(new ObjetoLimitante(866,162));this.limites.add(new ObjetoLimitante(878,166));
      this.limites.add(new ObjetoLimitante(911,148));this.limites.add(new ObjetoLimitante(984,417));this.limites.add(new ObjetoLimitante(845,554));
      this.limites.add(new ObjetoLimitante(851,539));this.limites.add(new ObjetoLimitante(868,528));this.limites.add(new ObjetoLimitante(877,525));
      this.limites.add(new ObjetoLimitante(891,533));this.limites.add(new ObjetoLimitante(905,540));this.limites.add(new ObjetoLimitante(907,557));
      this.limites.add(new ObjetoLimitante(880,546));this.limites.add(new ObjetoLimitante(962,177));this.limites.add(new ObjetoLimitante(802,92));
      this.limites.add(new ObjetoLimitante(13,40));this.limites.add(new ObjetoLimitante(703,0));this.limites.add(new ObjetoLimitante(667,-12));
      break;
    case 4: 
      this.limites.add(new ObjetoLimitante(643,72));this.limites.add(new ObjetoLimitante(622,58));
      this.limites.add(new ObjetoLimitante(601,45));this.limites.add(new ObjetoLimitante(581,31));this.limites.add(new ObjetoLimitante(558,19));
      this.limites.add(new ObjetoLimitante(536,6));this.limites.add(new ObjetoLimitante(359,152));this.limites.add(new ObjetoLimitante(374,133));
      this.limites.add(new ObjetoLimitante(390,112));this.limites.add(new ObjetoLimitante(408,90));this.limites.add(new ObjetoLimitante(425,68));
      this.limites.add(new ObjetoLimitante(442,44));this.limites.add(new ObjetoLimitante(463,30));this.limites.add(new ObjetoLimitante(484,14));
      this.limites.add(new ObjetoLimitante(737,311));this.limites.add(new ObjetoLimitante(757,297));this.limites.add(new ObjetoLimitante(777,290));
      this.limites.add(new ObjetoLimitante(711,114));this.limites.add(new ObjetoLimitante(688,101));this.limites.add(new ObjetoLimitante(666,84));
      this.limites.add(new ObjetoLimitante(783,152));this.limites.add(new ObjetoLimitante(760,140));this.limites.add(new ObjetoLimitante(734,124));
      this.limites.add(new ObjetoLimitante(799,173));this.limites.add(new ObjetoLimitante(795,277));this.limites.add(new ObjetoLimitante(797,251));
      this.limites.add(new ObjetoLimitante(798,225));this.limites.add(new ObjetoLimitante(799,199));this.limites.add(new ObjetoLimitante(717,324));
      this.limites.add(new ObjetoLimitante(696,336));this.limites.add(new ObjetoLimitante(674,353));this.limites.add(new ObjetoLimitante(653,366));
      this.limites.add(new ObjetoLimitante(634,376));this.limites.add(new ObjetoLimitante(617,396));this.limites.add(new ObjetoLimitante(596,393));
      this.limites.add(new ObjetoLimitante(573,373));this.limites.add(new ObjetoLimitante(553,350));this.limites.add(new ObjetoLimitante(534,328));
      this.limites.add(new ObjetoLimitante(518,305));this.limites.add(new ObjetoLimitante(500,284));this.limites.add(new ObjetoLimitante(483,265));
      this.limites.add(new ObjetoLimitante(462,248));this.limites.add(new ObjetoLimitante(442,227));this.limites.add(new ObjetoLimitante(422,213));
      this.limites.add(new ObjetoLimitante(401,198));this.limites.add(new ObjetoLimitante(380,186));this.limites.add(new ObjetoLimitante(360,176));
      this.limites.add(new ObjetoLimitante(341,166));this.limites.add(new ObjetoLimitante(296,319));this.limites.add(new ObjetoLimitante(274,334));
      this.limites.add(new ObjetoLimitante(255,344));this.limites.add(new ObjetoLimitante(235,359));this.limites.add(new ObjetoLimitante(216,370));
      this.limites.add(new ObjetoLimitante(196,381));this.limites.add(new ObjetoLimitante(175,392));this.limites.add(new ObjetoLimitante(157,408));
      this.limites.add(new ObjetoLimitante(138,422));this.limites.add(new ObjetoLimitante(117,434));this.limites.add(new ObjetoLimitante(97,447));
      this.limites.add(new ObjetoLimitante(79,458));this.limites.add(new ObjetoLimitante(61,469));this.limites.add(new ObjetoLimitante(41,479));
      this.limites.add(new ObjetoLimitante(22,490));this.limites.add(new ObjetoLimitante(1,501));this.limites.add(new ObjetoLimitante(1,543));
      this.limites.add(new ObjetoLimitante(21,530));this.limites.add(new ObjetoLimitante(42,516));this.limites.add(new ObjetoLimitante(64,503));
      this.limites.add(new ObjetoLimitante(84,491));this.limites.add(new ObjetoLimitante(105,477));this.limites.add(new ObjetoLimitante(127,467));
      this.limites.add(new ObjetoLimitante(148,453));this.limites.add(new ObjetoLimitante(169,439));this.limites.add(new ObjetoLimitante(190,426));
      this.limites.add(new ObjetoLimitante(212,413));this.limites.add(new ObjetoLimitante(233,398));this.limites.add(new ObjetoLimitante(254,384));
      this.limites.add(new ObjetoLimitante(276,370));this.limites.add(new ObjetoLimitante(297,356));this.limites.add(new ObjetoLimitante(316,346));
      this.limites.add(new ObjetoLimitante(339,345));this.limites.add(new ObjetoLimitante(361,358));this.limites.add(new ObjetoLimitante(380,370));
      this.limites.add(new ObjetoLimitante(402,386));this.limites.add(new ObjetoLimitante(385,352));this.limites.add(new ObjetoLimitante(337,295));
      this.limites.add(new ObjetoLimitante(317,304));this.limites.add(new ObjetoLimitante(349,316));this.limites.add(new ObjetoLimitante(366,336));

      break;
    }
  }
}
