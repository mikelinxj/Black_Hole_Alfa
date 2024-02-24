//BASE
float X1 = 0;//Coord de los enemigos
float Y1 = 0;
float X2 = 0;//Coord de los enemigos
float Y2 = 0;
float X3 = 0;//Coord de los enemigos
float Y3 = 0;

float Xx = 0;//coord del jugador
float Yy = 0;

float Xd = 0;//distancia entre el jugador y el enemigo
float Yd = 0;
float Xda = 0;//distancia entre el jugador y el enemigo
float Yda = 0;
float Xdb = 0;//distancia entre el jugador y el enemigo
float Ydb = 0;

float distancia = 0;
float distancia1 = 0;
float distancia2 = 0;

boolean click = false;
boolean click1 = false;
boolean click2 = false;

float recarga = 20;
float recarga1 = 20;
float recarga2 = 20;

long t = 0;
float timer= 0;
float shijian= 30;

float puntos = 0;

float sizeEnemigo = 45;
float speed = 25;
float sizeJugador = 60;

PImage planetas[] = new PImage[9];
String imFile1[] = {"0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png"};
PImage extra[] = new PImage[1];
String imFile3[] = {"reloj.png"};

int ap1 = 0;
int ap2 = 0;
int ap3 = 0;

//INDEX
PImage index[] = new PImage[2];
String imFile4[] = {"F1.png","F2.jpg"};

boolean inicio = false;


//LOBBY
boolean lobby = false;
PImage cursor[] = new PImage[9];
String imFile2[] = {"C1.png", "C2.png", "C3.png", "C4.png", "C5.png", "C6.png", "C7.png", "C8.png", "C9.png"};

int select = 0;
//MUSIC

import ddf.minim.*;

Minim minim;
AudioPlayer player;

//GAME_OVER

boolean game_over = false ;

PImage over[] = new PImage[1];
String imFile5[] = {"game_over.jpg"};

//RELOAD
boolean reload = false;

void setup(){
//GENERAL
  size(1920,1080);
//BASE
  
  for (int a=0; a < 9 ; a++){
    planetas[a] = loadImage(imFile1[a]);//cargo imagen a la posicion 0
  }
  for (int c=0; c < 1 ; c++){
    extra[c] = loadImage(imFile3[c]);//cargo imagen a la posicion 0
  }
  
  X1 = int(random(width+100));
  Y1 = height + 50;
  X2 = -50 ;
  Y2 = int(random(height));
  X3 = width + 50 ;
  Y3 = int(random(height+100));
  
  Xx = width/2;
  Yy = height/2;
  
  
  ap1 = int(random(1,8));
  ap2 = int(random(1,8));
  ap3 = int(random(1,8));
  
  
//INDEX
  for (int d=0; d<2; d++){
    index[d] = loadImage(imFile4[d]);//cargo imagen a la posicion 0
  }
//LOBBY
  for (int b=0; b < 9; b++) {
    cursor[b] = loadImage(imFile2[b]);//cargo imagen a la posicion 0
  }
  
//MUSIC
  
  // Inicializa Minim
  minim = new Minim(this);

  // Carga el archivo de audio
  player = minim.loadFile("space.mp3");

  // Reproduce la canción en bucle
  player.loop();

//GAME_OVER
  for (int e=0; e<1; e++){
    over[e] = loadImage(imFile5[e]);//cargo imagen a la posicion 0
  }
  
}

void draw(){
  //INDEX && LOBBY && GAME_OVER
  if (inicio == false && lobby == false && game_over == false){
   
    imageMode(CORNER);
    image(index[1],0,0,1920,1080);
    image(index[0],0,0,1920,1080);
    noCursor(); // Oculta el cursor predeterminado

    //Texto linea 1
    textSize(100);
    fill(0, 102, 153);
    text("Presione", width/2 - 250, height/2 - 100); 
    
    //Texto linea 2
    textSize(150);
    fill(#988200);
    text("ENTER", width/2 - 150, height/2 + 25);
    
    //Texto linea 3
    textSize(100);
    fill(0, 102, 153);
    text("Para Jugar.",width/2 - 50, height/2 + 100); 
    
    if (keyCode == ENTER){
      lobby = true;
    }
  }
  //LOBBY && GAME_OVER
  if ( lobby == true && inicio == false && game_over == false){  
    background(0);
    imageMode(CENTER);
    image(cursor[select], width/2, height/4, 200, 200);
    textSize(50);
    fill(255);
    text("Presione", width/2-400, height/2-50);
    fill(#35BCB4);
    text("SPACE KEY", width/2-250, height/2-10);
    fill(255);
    text("para seleccionar", width/2-150, height/2+30);
    text("El Cursor:", width/2, height/2+70);
    textSize(80);
    textMode(SHAPE);
    if (select == 0){
      fill(#FF001E);
      text("TECNO",width/2+220,height/2+70);
    }
    if (select == 1){
      fill(#009FFF);
      text("DIGITAL",width/2+220,height/2+70);
    }
    if (select == 2){
      fill(#14B700);
      text("DRAGON",width/2+220,height/2+70);
    }
    if (select == 3){
      fill(#F2E700);
      text("GOLD",width/2+220,height/2+70);
    }
    if (select == 4){
      fill(#D100F2);
      text("GEM",width/2+220,height/2+70);
    }
    if (select == 5){
      fill(#00FFFD);
      text("ICE",width/2+220,height/2+70);
    }
    if (select == 6){
      fill(#C9B545);
      text("MECHANIC",width/2+220,height/2+70);
    }
    if (select == 7){
      fill(#6634F5);
      text("GALAXY",width/2+220,height/2+70);
    }
    if (select == 8){
      fill(#DE9DF2);
      text("ROCKET",width/2+220,height/2+70);
    }
    
    //LOBBY && INDEX
    if (keyCode == ' '){ // ' ' ---> es el teclado de barra espaciadora
      inicio = true;
      t = millis();//inicio el contador de tiempo 
    }
  }
  
  //BASE
  if (inicio == true && lobby == true && game_over == false){
    background(10);//background(cR,cG,cB);
    //image(im[3],0,0,1920,1000);
    fill(#0779F0);
    rect(Xx,Yy,-sizeJugador/2,-sizeJugador/2);
    imageMode(CENTER);
    image(planetas[0],Xx-sizeJugador/4 + 2 ,Yy-sizeJugador/4 + 2 ,sizeJugador,sizeJugador);
      
    if (click == false){ // Crear planeta 1
      fill(#31F007);
      //ellipse(X1,Y1,sizeEnemigo,sizeEnemigo);
      image(planetas[ap1],X1- sizeEnemigo/35,Y1-sizeEnemigo/35,sizeEnemigo,sizeEnemigo);
      
    
    }else {
      recarga = recarga + 1;
      if (recarga == 20){
        click = false;
        X1 = int(random(width));
        Y1 = int (random(height));
      }
    }
    
    if (click1 == false){ // Crear planeta 2
      fill(#31F007);
      //ellipse(X2,Y2,sizeEnemigo,sizeEnemigo);
      image(planetas[ap2],X2-sizeEnemigo/35,Y2-sizeEnemigo/35,sizeEnemigo,sizeEnemigo);
    
    }else {
      recarga1 = recarga1 + 1;
      if (recarga1 == 20){
        click1 = false;
        X2 = int(random(width));
        Y2 = int (random(height));
      }
    }
    
    if (click2 == false){ // Crear planeta 3
      fill(#31F007);
      //ellipse(X3,Y3,sizeEnemigo,sizeEnemigo);
      image(planetas[ap3],X3-sizeEnemigo/35,Y3-sizeEnemigo/35,sizeEnemigo,sizeEnemigo);
      
    }else {
      recarga2 = recarga2 + 1;
      if (recarga2 == 20){
        click2 = false;
        X3 = int(random(width));
        Y3 = int (random(height));
      }
    }
    
    image(cursor[select],mouseX,mouseY,35,35);//Sustituye el puntero de ratón predeterminado por el cursor elegido
    
    //Limites
    if (Xx <= 0){
      Xx = 20;
    }
    if (Xx >= width){
      Xx = width;
    }
    if (Yy <= 0){
      Yy = 20;
    }
    if (Yy >= height){
      Yy = height;
    }
    
    //GAME_OVER------------------+++
    //Colision
    if ( Y1 + sizeEnemigo/2 > Yy && Y1 - sizeEnemigo/2 < Yy ){
      // coinciden tambien en X??:
      if ( X1 + sizeEnemigo/2 > Xx && X1 - sizeEnemigo/2 < Xx){
        //hay colision!:
        game_over = true;
      }
    }
    if ( Y2 + sizeEnemigo/2 > Yy && Y2 - sizeEnemigo/2 < Yy ){
      // coinciden tambien en X??:
      if ( X2 + sizeEnemigo/2 > Xx && X2 - sizeEnemigo/2 < Xx){
        //hay colision!:
        game_over = true;
      }
    }
    if ( Y3 + sizeEnemigo/2 > Yy && Y3 - sizeEnemigo/2 < Yy ){
      // coinciden tambien en X??:
      if ( X3 + sizeEnemigo/2 > Xx && X3 - sizeEnemigo/2 < Xx){
        //hay colision!:
        game_over = true;
      }
    }
      
    // Calcula la dirección hacia el círculo fijo
    Xd = Xx - 10 - X1;
    Yd = Yy - 10 - Y1;
  
  
    // Normaliza la dirección
    distancia = sqrt(Xd*Xd + Yd*Yd);
    Xd /= distancia;
    Yd /= distancia;
  
    // Mueve el círculo móvil un paso hacia el círculo fijo
    X1 += Xd * 3 ;
    Y1 += Yd * 3 ;
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
    // Calcula la dirección hacia el círculo fijo
    Xda = Xx - 10 - X2;
    Yda = Yy - 10 - Y2;
  
    // Normaliza la dirección
    distancia1 = sqrt(Xda*Xda + Yda*Yda);
    Xda /= distancia1;
    Yda /= distancia1;
  
    // Mueve el círculo móvil un paso hacia el círculo fijo
    X2 += Xda * 3 ;
    Y2 += Yda * 3 ;
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
    // Calcula la dirección hacia el círculo fijo
    Xdb = Xx - 10 - X3;
    Ydb = Yy - 10 - Y3;
  
    // Normaliza la dirección
    distancia2 = sqrt(Xdb*Xdb + Ydb*Ydb);
    Xdb /= distancia2;
    Ydb /= distancia2;
  
    // Mueve el círculo móvil un paso hacia el círculo fijo
    X3 += Xdb * 3 ;
    Y3 += Ydb * 3 ;
    
    //GAME_OVER---------+++
     //Calculo de tiempo que ha pasado
    timer = (millis() - t)/1000 ;
    if (shijian - timer <= 0){
      game_over = true;
    }
    textSize(40);
    fill(#29FF4B);
    text("Tiempo restante:" + ( shijian - timer),55,50); //Aparicion de tiempo en pantalla
    image(extra[0],30,35,50,50);
    
    //Puntuacion
    text("Puntuación:" + puntos ,750,30); //Aparicion de puntuacion en pantalla
    
    // Sustituye la imagen en la posición del ratón
    //image(im[0], mouseX, mouseY); 
  }
  
  //GAME_OVER
  if (game_over == true){
    inicio = false;
    lobby = false;
    background(#1c1c1c);
    imageMode(CENTER);
    image(over[0],width/2,height/2-220,750,750);
    textSize(50);
    fill(#E8E6E5);
    text("Presione",width/2-250,height/2+20);
    textSize(75);
    fill(#00FC0E);
    text("R",width/2-75,height/2+95);
    textSize(50);
    fill(#E8E6E5);
    text("para",width/2-50,height/2+145);
    textSize(100);
    fill(#FF83C8);
    text("VOLVER A JUGAR",width/2-300,height/2+245);
    if(keyPressed){
      if( key == 'r' || key == 'R'){
        game_over = false;
        reload = true;
      }
    }
  }
  if (reload == true){
    shijian = 30;
    puntos = 0;
    
    Xx = width/2;
    Yy = height/2;
    
    X1 = int(random(width+100));
    Y1 = height + 50;
    X2 = -50 ;
    Y2 = int(random(height));
    X3 = width + 50 ;
    Y3 = int(random(height+100));
    
    game_over = false;
    reload = false;
  }
  noCursor(); // Oculta el cursor predeterminado
  
}// FIN DEL VOID DRAW(){}

void keyPressed(){
  //BASE
  
  if (keyPressed){
    if (key == 'w' || key == 'W') {
      Yy = Yy - speed;
    }
    if (key == 's' || key == 'S') {
      Yy = Yy + speed;
    }
    if (key == 'a' || key == 'A') {
      Xx = Xx - speed;
    }
    if (key == 'd' || key == 'D') {
      Xx = Xx + speed;
    }
   }
   
  //INDEX
  //LOBBY
  
  // 0 ---> 1º imagen ; 8 ---> 9º imagen ; total de imagenes son 9: del 0-8.
  if (keyCode == LEFT) {
    select = (select +8 ) % 9;  //(0 + 8)%9 ; devuelve como resto 8, siendo la ultima imagen que he asignado en la array
  }

  if (keyCode == RIGHT) {
    select = (select + 1) % 9;  //(8 + 1)%9 ; devuelve como resto 0, siendo la primera imagen que he asignado en la array
  }
  
  //MUSIC

}

void mousePressed() {
  //BASE
  
  if (mouseX < X1 + sizeEnemigo/2 && mouseX > X1 - sizeEnemigo/2 && mouseY > Y1 - sizeEnemigo/2 && mouseY < Y1 + sizeEnemigo/2) {
    X1 = 5000;
    click = true;
    recarga = 0;
    shijian = shijian + 2 ;
    puntos = puntos + 1;
    ap1 = int(random(1,8));
  }
  if (mouseX < X2 + sizeEnemigo/2 && mouseX > X2 - sizeEnemigo/2 && mouseY > Y2 - sizeEnemigo/2 && mouseY < Y2 + sizeEnemigo/2) {
    X2 = 5000;
    click1 = true;
    recarga1 = 0;
    shijian = shijian + 2;
    puntos = puntos + 1;
    ap2 = int(random(1,8));
  }
  if (mouseX < X3 + sizeEnemigo/2 && mouseX > X3 - sizeEnemigo/2 && mouseY > Y3 - sizeEnemigo/2 && mouseY < Y3 + sizeEnemigo/2) {
    X3 = 5000;
    click2 = true;
    recarga2 = 0;
    shijian = shijian + 2 ;
    puntos = puntos + 1;
    ap3 = int(random(1,8));
  }
  
  //INDEX
  //LOBBY

  //MUSIC
}

//MUSIC
void stop() {
  // Detén la reproducción y libera recursos al cerrar la aplicación
  player.close();
  minim.stop();
  super.stop();
}
